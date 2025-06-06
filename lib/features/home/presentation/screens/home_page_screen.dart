import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutas_flutter/core/ads/banner/ad_banner_provider_home.dart';
import 'package:rutas_flutter/features/detail/presentation/state/detail_sections_state.dart';
import 'package:rutas_flutter/features/home/presentation/providers/navigation_home_page_state.dart';
import 'package:rutas_flutter/features/home/presentation/widgets/home_drawer_widget.dart';
import 'package:rutas_flutter/features/home/presentation/widgets/module_widget.dart';
import 'package:rutas_flutter/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutas_flutter/features/level/presentation/widgets/generate_route_path_widget.dart';
import 'package:rutas_flutter/features/progress/presentation/screens/progres_score_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(adBannerProviderHome.notifier)
          .loadAdaptiveAd(context, screenId: 'home');
    });
  }

  @override
  void dispose() {
    // Solo disponer si estamos en esta pantalla
    if (ref.read(adBannerProviderHome).currentScreen == 'home') {
      ref.read(adBannerProviderHome.notifier).disposeCurrentAd();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(pageControllerProvider);
    final currentIndex = ref.watch(pageIndexProvider);
    final adState = ref.watch(adBannerProviderHome);

    // Define los AppBars para cada pantalla
    final List<PreferredSizeWidget> appBars = [
      AppBar(
        title: const Text(
          'Módulos',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu),
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      AppBar(
        title: Text(
          'Ruta ${ref.watch(actualModuleProvider)}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0.5,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => ref.read(navigationServiceProvider).goBack(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_events),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProgressScoreScreen(),
                ),
              );
            },
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: appBars[currentIndex],
      drawer: currentIndex == 0
          ? HomeDrawer(
              context: context,
            )
          : null,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          ref.read(pageIndexProvider.notifier).state = index;
        },
        children: const [
          _HomeContent(),
          PathContent(),
        ],
      ),
      bottomNavigationBar: _buildAdBanner(adState),
    );
  }

  Widget _buildAdBanner(AdBannerStateHome adState) {
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
  }
}

// HomeContent solo contiene el contenido sin Scaffold
class _HomeContent extends ConsumerWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ModuleWidget(
        heightScreen: MediaQuery.of(context).size.height,
        widthScreen: MediaQuery.of(context).size.width,
      ),
    );
  }
}

// PathContent solo contiene el contenido sin Scaffold
class PathContent extends ConsumerWidget {
  const PathContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const GenerateLevelsRoutePathWidget();
  }
}
