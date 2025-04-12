import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/detail/data/models/detail_model.dart';
import 'package:ruta_flutter/features/detail/presentation/state/detail_sections_state.dart';
import 'package:ruta_flutter/features/detail/presentation/state/provider/get_detail_use_case_provider.dart';
import 'package:ruta_flutter/features/detail/presentation/widgets/appbar_detail_widget.dart';
import 'package:ruta_flutter/features/detail/presentation/widgets/code_detail_widget.dart';
import 'package:ruta_flutter/features/detail/presentation/widgets/definition_detail_widget.dart';
import 'package:ruta_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/level/presentation/state/completed_levels_shp_provider.dart';
import 'package:ruta_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({super.key});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() async {
    final progressRepository = ref.read(progressRepositoryProvider);
    final module = ref.read(actualModuleProvider);
    final levelId = ref.read(actualLevelIdProvider);
    final topicId = ref.read(topicIdProvider);
    final subtopicId = ref.read(subtopicIdProvider);
    final getLevelUseCase = ref.read(getLevelUseCaseProvider);

    final completedSubtopicsNotifier =
        ref.read(completedSubtopicsProvider(module).notifier);
    final topicsNotifier = ref.read(completedTopicsProvider(module).notifier);
    final completedLevelsNotifier = ref.read(completedLevelsProvider.notifier);

    if (await progressRepository.isSubtopicCompleted(module, subtopicId))
      return;

    _timer = Timer(const Duration(seconds: 8), () async {
      try {
        await progressRepository.createProgressBySubtopic(
          module: module,
          levelId: levelId,
          topicId: topicId,
          subtopicId: subtopicId,
          score: 2,
        );

        completedSubtopicsNotifier.markSubtopicAsCompleted(subtopicId);
        await topicsNotifier.checkAndUpdateTopicCompletion(topicId, levelId);
        await completedLevelsNotifier.checkAndUpdateLevelCompletionByModule(
            levelId, module);

        // Verificar si se completó el último nivel
        final levels = await getLevelUseCase.call(module);
        final completedLevels =
            completedLevelsNotifier.getCompletedLevelsForModule(module);

        if (levels.length == completedLevels.length) {
          // Guardar en SharedPreferences que se completó el módulo
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('${module}_completed', true);
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('¡+2 puntos acumulados! Sigue repasando temas.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al guardar el progreso: $e'),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getDetailUseCase = ref.read(getDetailUseCaseProvider);
    final subtopicID = ref.watch(subtopicIdProvider);
    final module = ref.watch(actualModuleProvider);
    final titleSubtopic = ref.watch(titleSubtopicProvider);
    final pageController = ref.watch(pageControllerProvider);

    return FutureBuilder<DetailModel>(
      future: getDetailUseCase.call(subtopicID, module),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(
              child: Text('No se encontró detalle del subtema.'));
        }

        final detail = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: AppBarDetailWidget(widthScreen: size.width),
            centerTitle: true,
            foregroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                ref.read(appBarSectionProvider.notifier).state =
                    AppBarSection.definition;
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                    titleSubtopic,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: size.height * 0.8,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      ref.read(appBarSectionProvider.notifier).state =
                          index == 0
                              ? AppBarSection.definition
                              : AppBarSection.code;
                    },
                    children: [
                      DefinitionDetailWidget(
                        heightScreen: size.height,
                        detail: detail,
                      ),
                      CodeDetailWidget(detail: detail),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
