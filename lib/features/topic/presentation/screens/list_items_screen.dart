import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutas_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutas_flutter/features/topic/presentation/screens/topic_screen.dart';
import 'package:rutas_flutter/features/topic/presentation/screens/subtopic_screen.dart';
import 'package:rutas_flutter/features/topic/presentation/state/provider/get_topic_use_case_provider.dart';

final currentPageProvider = StateProvider<int>((ref) => 0);

class ListItemsScreen extends ConsumerStatefulWidget {
  const ListItemsScreen({super.key});

  @override
  ConsumerState<ListItemsScreen> createState() => _ListItemsScreenState();
}

class _ListItemsScreenState extends ConsumerState<ListItemsScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Inicializar el controller con la página actual
    _pageController =
        PageController(initialPage: ref.read(currentPageProvider));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final levelTitle = ref.watch(levelTitleProvider);
    final titleTopic = ref.watch(topicTitleProvider);

    // Escuchar cambios en el provider para actualizar el PageController
    ref.listen<int>(currentPageProvider, (_, nextPage) {
      if (_pageController.hasClients &&
          _pageController.page?.round() != nextPage) {
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    return Scaffold(
      //si estoy en page 0 este es el appbar
      appBar: ref.watch(currentPageProvider) == 0
          ? AppBar(
              title: Text(
                levelTitle.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
              ),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              centerTitle: true,
              foregroundColor: Colors.white,
            )
          : AppBar(
              title: Text(
                titleTopic.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  ref.read(currentPageProvider.notifier).state = 0;
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              centerTitle: true,
              foregroundColor: Colors.white,
            ),

      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          // Actualizar el provider cuando el usuario hace swipe manual (aunque está desactivado)
          ref.read(currentPageProvider.notifier).state = index;
        },
        children: const [
          TopicScreen(),
          SubtopicScreen(),
        ],
      ),
    );
  }
}
