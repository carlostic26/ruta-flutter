import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/detail/data/models/detail_model.dart';
import 'package:ruta_flutter/features/detail/presentation/state/detail_sections_state.dart';
import 'package:ruta_flutter/features/detail/presentation/state/provider/get_detail_use_case_provider.dart';
import 'package:ruta_flutter/features/detail/presentation/widgets/appbar_detail_widget.dart';
import 'package:ruta_flutter/features/detail/presentation/widgets/code_detail_widget.dart';
import 'package:ruta_flutter/features/detail/presentation/widgets/definition_detail_widget.dart';
import 'package:ruta_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_subtopic_use_case_provider.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    final getDetailUseCase = ref.read(getDetailUseCaseProvider);
    final subtopicID = ref.watch(subtopicIdProvider);
    final module = ref.watch(moduleProvider);
    // Obtener el título del subtopic usando Riverpod
    final titleSubtopic = ref.watch(titleSubtopicProvider);

    // Obtener el PageController
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
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    titleSubtopic.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    // Actualizar el estado según la página actual
                    ref.read(appBarSectionProvider.notifier).state = index == 0
                        ? AppBarSection.definition
                        : AppBarSection.code;
                  },
                  children: [
                    DefinitionDetailWidget(
                      heightScreen: heightScreen,
                      detail: detail,
                    ),
                    CodeDetailWidget(
                      detail: detail,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
