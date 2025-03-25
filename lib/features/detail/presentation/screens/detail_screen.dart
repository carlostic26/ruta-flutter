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
import 'package:ruta_flutter/features/level/presentation/state/shared_preferences_provider.dart';
import 'package:ruta_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart'
    as progress;
import 'package:ruta_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/state/completed_subtopic_state_notifier.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';

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
    final progressUseCasesProvider =
        ref.read(progress.progressRepositoryProvider);
    final completedSubtopicsNotifier =
        ref.read(completedSubtopicsProvider.notifier);

    // Obtener los parámetros necesarios
    final module = ref.read(moduleProvider);
    final levelId = ref.read(actualLevelIdProvider);
    final topicId = ref.read(topicIdProvider);
    final subtopicId = ref.read(subtopicIdProvider);

    // Verificar si el subtopic ya tiene un registro de progreso
    final isCompleted =
        await progressUseCasesProvider.isSubtopicCompleted(subtopicId);

    // Si el subtopic ya está completado, no hacer nada
    if (isCompleted) {
      return;
    }

    // Iniciar el temporizador
    _timer = Timer(const Duration(seconds: 8), () async {
      try {
        // Registrar el puntaje y el progreso en la base de datos
        await progressUseCasesProvider.createProgressBySubtopic(
          module: module,
          levelId: levelId,
          topicId: topicId,
          subtopicId: subtopicId,
          score: 2,
        );

        // Notificar que el subtopic se completó
        completedSubtopicsNotifier.markSubtopicAsCompleted(subtopicId);

        // Verificar si el topic al que pertenece también está completado
        final completedTopicsNotifier =
            ref.read(completedTopicsProvider.notifier);
        await completedTopicsNotifier.checkAndUpdateTopicCompletion(
            topicId, module, levelId);

        // Verificar si el nivel al que pertenece también está completado
        final completedLevelsNotifier =
            ref.read(completedLevelsProvider.notifier);
        await completedLevelsNotifier.checkAndUpdateLevelCompletion(
            levelId, module);

        // Mostrar un SnackBar después de registrar los puntos
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                '¡+2 puntos acumulados! Sigue repasando temas.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error al guardar el progreso: $e',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    final getDetailUseCase = ref.read(getDetailUseCaseProvider);
    final subtopicID = ref.watch(subtopicIdProvider);
    final module = ref.watch(moduleProvider);
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
            title: AppBarDetailWidget(widthScreen: widthScreen),
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
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                    titleSubtopic.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Espacio extra
                // PageView dentro de un Flexible para que se ajuste correctamente
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
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
                        heightScreen: heightScreen,
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
