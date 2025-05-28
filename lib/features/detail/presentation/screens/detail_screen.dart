import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutas_flutter/features/detail/data/models/detail_model.dart';
import 'package:rutas_flutter/features/detail/presentation/state/detail_sections_state.dart';
import 'package:rutas_flutter/features/detail/presentation/state/provider/get_detail_use_case_provider.dart';
import 'package:rutas_flutter/features/detail/presentation/widgets/appbar_detail_widget.dart';
import 'package:rutas_flutter/features/detail/presentation/widgets/code_detail_widget.dart';
import 'package:rutas_flutter/features/detail/presentation/widgets/definition_detail_widget.dart';
import 'package:rutas_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutas_flutter/features/level/presentation/state/completed_levels_shp_provider.dart';
import 'package:rutas_flutter/features/list_items/presentation/screens/list_items_screen.dart';
import 'package:rutas_flutter/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:rutas_flutter/features/list_items/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:rutas_flutter/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final PageController parentPageController;

  const DetailScreen({
    super.key,
    required this.parentPageController,
  });

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  Timer? _timer;
  bool _isHandlingBack = false;

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

  Future<bool> _handleSystemBack() async {
    final pageController = ref.read(pageControllerItemsProvider);

    if (_isHandlingBack) return false;
    _isHandlingBack = true;

    // Si estamos en la página de código (índice 1), retroceder a definición (índice 0)
    if (pageController.hasClients && pageController.page?.round() == 1) {
      await pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _isHandlingBack = false;
      return false;
    }

    // Si estamos en la página de definición (índice 0), retroceder a SubtopicScreen
    await widget.parentPageController.animateToPage(
      1, // SubtopicScreen
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    _isHandlingBack = false;
    return false;
  }

  void _startTimer() async {
    final progressRepository = ref.read(progressRepositoryProvider);
    final module = ref.read(actualModuleProvider);

    final topicId = ref.read(topicIdProvider);
    final subtopicId = ref.read(subtopicIdProvider);

    late final int levelId;

    switch (module) {
      case 'Jr':
        levelId = ref.read(actualLevelIdJrProvider);
        break;
      case 'Mid':
        levelId = ref.read(actualLevelIdMidProvider);
        break;
      case 'Sr':
        levelId = ref.read(actualLevelIdSrProvider);
        break;
      default:
        break;
    }

    final completedSubtopicsNotifier =
        ref.read(completedSubtopicsProvider(module).notifier);
    final topicsNotifier = ref.read(completedTopicsProvider(module).notifier);
    final completedLevelsNotifier = ref.read(completedLevelsProvider.notifier);

    final isCompleted =
        await progressRepository.isSubtopicCompleted(module, subtopicId);
    if (isCompleted) return;

    _timer = Timer(const Duration(seconds: 12), () async {
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

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('¡+2 puntos acumulados! Sigue repasando.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al guardar el progreso: $e'),
              duration: const Duration(seconds: 1),
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
    final pageController = ref.watch(pageControllerItemsProvider);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          await _handleSystemBack();
        }
      },
      child: FutureBuilder<DetailModel>(
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
            body: Column(
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
                Expanded(
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
