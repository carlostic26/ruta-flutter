import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/detail/data/models/detail_model.dart';

class DefinitionDetailWidget extends ConsumerStatefulWidget {
  const DefinitionDetailWidget({
    super.key,
    required this.heightScreen,
    required this.detail,
  });

  final double heightScreen;
  final DetailModel detail;

  @override
  ConsumerState<DefinitionDetailWidget> createState() =>
      _DefinitionDetailWidgetState();
}

class _DefinitionDetailWidgetState
    extends ConsumerState<DefinitionDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, // Se ajusta automáticamente al contenido
      //physics: const NeverScrollableScrollPhysics(), // Evita doble scroll
      children: [
        SizedBox(height: widget.heightScreen * 0.05),
/*         Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: SizedBox(
            height: 350,
            child: widget.detail.imgUrl.toString().isEmpty
                ? Image.asset(
                    'assets/icons/placeholder.png',
                    fit: BoxFit.cover,
                  )
                : FadeInImage.assetNetwork(
                    placeholder: 'assets/icons/placeholder.png',
                    image: widget.detail.imgUrl.toString(),
                    fit: BoxFit.cover,
                    placeholderErrorBuilder: (context, error, stackTrace) {
                      return const Center(child: CircularProgressIndicator());
                    },
                    imageErrorBuilder: (context, error, stackTrace) {
                      return const Center(child: Icon(Icons.error));
                    },
                  ),
          ),
        ), */
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Text(
            widget.detail.definition.toString(),
            style: const TextStyle(
                color: Colors.white, fontFamily: 'Poppins', fontSize: 12),
          ),
        ),
      ],
    );
  }
}
