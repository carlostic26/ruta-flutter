import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutas_flutter/core/ads/ad_banner_provider_detail.dart';
import 'package:rutas_flutter/core/ads/ad_banner_provider_home.dart';
import 'package:rutas_flutter/features/detail/presentation/screens/detail_screen.dart';
import 'package:rutas_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutas_flutter/features/list_items/presentation/screens/topic_screen.dart';
import 'package:rutas_flutter/features/list_items/presentation/screens/subtopic_screen.dart';
import 'package:rutas_flutter/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';

final currentPageProvider = StateProvider<int>((ref) => 0);

class ListItemsScreen extends ConsumerStatefulWidget {
  const ListItemsScreen({super.key});

  @override
  ConsumerState<ListItemsScreen> createState() => _ListItemsScreenState();
}

class _ListItemsScreenState extends ConsumerState<ListItemsScreen> {
  late PageController _pageController;
  bool _adLoaded = false;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: ref.read(currentPageProvider));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_adLoaded) {
        ref.read(adBannerProviderDetail.notifier)
          ..disposeCurrentAd()
          ..loadAdaptiveAd(context, screenId: 'listItems')
              .then((_) => _adLoaded = true);
      }
    });
  }

  @override
  void dispose() {
    // Forzar la disposición del banner al salir de la pantalla
    ref.read(adBannerProviderDetail.notifier).disposeCurrentAd();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final levelTitle = ref.watch(levelTitleProvider);
    final titleTopic = ref.watch(topicTitleProvider);
    final adState = ref.watch(adBannerProviderDetail);

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
        children: const [TopicScreen(), SubtopicScreen(), DetailScreen()],
      ),
      bottomNavigationBar: _buildAdBanner(adState),
    );
  }

  Widget _buildAdBanner(AdBannerStateDetail adState) {
    // Solo mostrar el banner si es para esta pantalla
    if (adState.currentScreen == 'listItems' &&
        adState.bannerAd != null &&
        adState.isLoaded) {
      return SizedBox(
        width: adState.bannerAd!.size.width.toDouble(),
        height: adState.bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: adState.bannerAd!),
      );
    } else {
      return const SizedBox(height: 50);
    }
  }

/*   Widget _buildAdBanner(AdBannerStateDetail adState) {
    if (adState.bannerAd != null && adState.isLoaded) {
      return Container(
        color: Colors.transparent,
        width: adState.bannerAd!.size.width.toDouble(),
        height: adState.bannerAd!.size.height.toDouble(),
        alignment: Alignment.center,
        child: AdWidget(ad: adState.bannerAd!),
      );
    } else {
      // Mostrar un placeholder mientras carga el anuncio
      return Container(
        height: 50, // Altura aproximada de un banner
        color: Colors.transparent,
      );
    }
  } */
}
