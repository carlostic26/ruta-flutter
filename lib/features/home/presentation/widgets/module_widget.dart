import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutas_flutter/features/home/presentation/providers/navigation_home_page_state.dart';
import 'package:rutas_flutter/features/level/presentation/state/completed_levels_shp_provider.dart';
import 'package:rutas_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutas_flutter/features/home/presentation/widgets/spacer_home_widget.dart';

class ModuleWidget extends ConsumerWidget {
  const ModuleWidget({
    super.key,
    required this.heightScreen,
    required this.widthScreen,
  });

  final double heightScreen;
  final double widthScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String jrDescription =
        'Repasos desde cero: sintaxis, widgets básicos y gestión de almacenamiento local. Ideal para principiantes.';
    String midDescription =
        'Domina y repasa conceptos avanzados: estado, APIs, Firebase, patrones de diseño, SOLID y optimización de apps.';
    String srDescription =
        'Domina, aprende o repasa técnicas expertas: programación reactiva, animaciones, CI/CD y despliegues automatizados para aplicaciones escalables.';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpacerHomeWidget(heightScreen: heightScreen),
        // Junior Dev Module
        _buildModule(
          context: context,
          ref: ref,
          module: 'Jr',
          title: 'Flutter Junior Dev',
          description: jrDescription,
          color: Colors.blue,
          imagePath: 'assets/images/jr_dev.png',
          isEnabled: true,
        ),

        SpacerHomeWidget(heightScreen: heightScreen),

        // Middle Dev Module
        _buildModule(
          context: context,
          ref: ref,
          module: 'Mid',
          title: 'Flutter Middle Dev',
          description: midDescription,
          color: Colors.orange,
          imagePath: 'assets/images/middle_dev.png',
          isEnabled: true,
        ),

        SpacerHomeWidget(heightScreen: heightScreen),

        // Senior Dev Module
        _buildModule(
          context: context,
          ref: ref,
          module: 'Sr',
          title: 'Flutter Senior Dev',
          description: srDescription,
          color: Colors.green,
          imagePath: 'assets/images/sr_dev.png',
          isEnabled: true,
        ),
      ],
    );
  }

  Widget _buildModule({
    required BuildContext context,
    required WidgetRef ref,
    required String module,
    required String title,
    required String description,
    required Color color,
    required String imagePath,
    required bool isEnabled,
  }) {
    return GestureDetector(
      onTap: () {
        // Normaliza el módulo antes de navegar
        final normalizedModule = module;
        ref.read(actualModuleProvider.notifier).state = normalizedModule;
        goToPathScreen(context, normalizedModule, ref);
      },
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: widthScreen * 0.35,
                height: heightScreen * 0.15,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                width: widthScreen * 0.35,
                height: heightScreen * 0.15,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  highlightColor: Colors.blue.withOpacity(0.2),
                  iconSize: 60,
                  onPressed: () {
                    ref.read(actualModuleProvider.notifier).state = module;
                    goToPathScreen(context, module, ref);
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 50, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.justify,
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void goToPathScreen(BuildContext context, String module, WidgetRef ref) {
    final normalizedModule = module;
    ref.read(actualModuleProvider.notifier).state = normalizedModule;
    ref
        .read(completedLevelsProvider.notifier)
        .loadModuleLevels(normalizedModule);

    final navService = ref.read(navigationServiceProvider);
    navService.navigateTo(1);
  }
}
