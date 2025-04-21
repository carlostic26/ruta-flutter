import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutas_flutter/core/ads/ads_manager.dart';

final adBannerProvider = StateNotifierProvider<AdBannerNotifier, AdBannerState>(
  (ref) => AdBannerNotifier(),
);

class AdBannerState {
  final BannerAd? bannerAd;
  final bool isLoaded;
  final AnchoredAdaptiveBannerAdSize? adSize;

  AdBannerState({
    this.bannerAd,
    this.isLoaded = false,
    this.adSize,
  });
}

class AdBannerNotifier extends StateNotifier<AdBannerState> {
  AdBannerNotifier() : super(AdBannerState());

  final RutaAdsIds adsIds = RutaAdsIds();

  Future<void> loadAdaptiveAd(BuildContext context) async {
    // Limpiar el banner anterior si existe
    state.bannerAd?.dispose();

    // Obtener el tamaño adaptativo
    final adSize =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      MediaQuery.of(context).size.width.truncate(),
    );

    if (adSize == null) {
      debugPrint('No se pudo obtener el tamaño adaptativo');
      return;
    }

    // Crear el nuevo banner
    final bannerAd = BannerAd(
      adUnitId: adsIds.banner_adUnitId,
      size: adSize,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          state = AdBannerState(
            bannerAd: ad as BannerAd,
            isLoaded: true,
            adSize: adSize,
          );
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('Error al cargar el banner: ${error.message}');
          ad.dispose();
          state = AdBannerState();
        },
      ),
    );

    // Cargar el banner
    await bannerAd.load();
    state = AdBannerState(bannerAd: bannerAd, adSize: adSize);
  }

  @override
  void dispose() {
    state.bannerAd?.dispose();
    super.dispose();
  }
}
