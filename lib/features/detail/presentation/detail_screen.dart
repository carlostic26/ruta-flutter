import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/detail/data/models/detail_model.dart';
import 'package:ruta_flutter/features/detail/presentation/state/provider/appbar_detail_state.dart';
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

    // Obtencion de la seccion de appbar activa
    final activeSection = ref.watch(appBarSectionProvider);

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
          body: AnimatedSwitcher(
            duration:
                const Duration(milliseconds: 1200), // Duración de la animación
            child: activeSection == AppBarSection.definition
                ? DefinitionDetailWidget(
                    heightScreen: heightScreen, detail: detail)
                : CodeDetailWidget(
                    detail: detail,
                  ),
          ),
        );
      },
    );
  }
}
