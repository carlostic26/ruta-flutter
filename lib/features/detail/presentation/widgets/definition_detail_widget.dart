import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/detail/data/models/detail_model.dart';
import 'package:ruta_flutter/features/topic/presentation/state/provider/get_subtopic_use_case_provider.dart';

class DefinitionDetailWidget extends ConsumerWidget {
  const DefinitionDetailWidget(
      {super.key, required this.heightScreen, required this.detail});

  final double heightScreen;
  final DetailModel detail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleSubtopic = ref.watch(titleSubtopicProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleSubtopic.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                detail.definition.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: heightScreen * 0.05,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: SizedBox(
            height: 350,
            child: Image.network(detail.imgUrl.toString()),
          ),
        )
      ],
    );
  }
}
