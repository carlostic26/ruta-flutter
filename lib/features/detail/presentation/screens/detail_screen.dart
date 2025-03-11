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
import 'package:ruta_flutter/features/score/presentation/state/provider/score_use_cases_provider.dart';
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
    _startTimer(); // Iniciar el temporizador aquí
  }

  @override
  void dispose() {
    _timer
        ?.cancel(); // Cancelar el temporizador si el usuario sale de la pantalla
    super.dispose();
  }

  void _startTimer() {
    final scoreUseCases = ref.read(scoreRepositoryProvider);

    // Obtener los parámetros necesarios
    final subtopicID = ref.read(subtopicIdProvider);
    final module = ref.read(moduleProvider);
    final level = ref.read(levelIdProvider);
    final topic = ref.read(topicIdProvider);

    // Iniciar el temporizador
    _timer = Timer(const Duration(seconds: 10), () async {
      await scoreUseCases.addScore(subtopicID, module, level, topic, 2);

      // Mostrar un SnackBar después de registrar los puntos
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              '¡+2 puntos acumulados! Sigue repasando temas.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            duration: Duration(seconds: 3), // Duración del SnackBar
          ),
        );
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
                  height: MediaQuery.of(context).size.height *
                      0.8, // Ajuste dinámico
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
