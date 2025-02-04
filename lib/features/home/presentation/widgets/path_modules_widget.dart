import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/home/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:ruta_flutter/features/home/presentation/widgets/generate_route_path_widget.dart';

class PathCircleLevelsWidget extends ConsumerWidget {
  const PathCircleLevelsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelList = ref.watch(levelListProvider);

    //TODO: Recibir la lista de niveles enviarla al metodo de dialogo (widget) y mostrar la info del objeto level x
    //TODO: Implementar el diseño UI de las rutas (boton, lineas)

    return const GenerateRoutePathWidget();
  }
}
