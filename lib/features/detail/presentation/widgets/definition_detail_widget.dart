import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/detail/data/models/detail_model.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_subtopic_use_case_provider.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Text(
            widget.detail.definition.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: widget.heightScreen * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: SizedBox(
            height: 350,
            child: Image.network(widget.detail.imgUrl.toString()),
          ),
        ),
      ],
    );
  }
}
