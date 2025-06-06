import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutas_flutter/features/common/domain/data/services/parse_inline_code_span_service.dart';
import 'package:rutas_flutter/features/detail/data/models/detail_model.dart';
import 'package:rutas_flutter/features/detail/presentation/state/image_detail_provider.dart';
import 'package:rutas_flutter/features/detail/presentation/widgets/image_loading_widget.dart';

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.invalidate(randomImageProvider);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final imageUrl = ref.watch(randomImageProvider);
            return ImageLoadingWrapper(imageUrl: imageUrl);
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: RichText(
            text: TextSpan(
              children:
                  parseInlineCodeSpans(widget.detail.definition.toString()),
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
