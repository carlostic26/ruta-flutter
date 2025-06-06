import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rutas_flutter/core/ads/ads_manager.dart';
import 'package:rutas_flutter/core/database/database_helper.dart';
import 'package:rutas_flutter/core/theme/theme_manager.dart';
import 'package:rutas_flutter/core/theme/theme_notifier.dart';
import 'package:rutas_flutter/features/exam/data/datasources/local_exam_data_source.dart';
import 'package:rutas_flutter/features/level/presentation/state/completed_levels_shp_provider.dart';
import 'package:rutas_flutter/features/loading/presentation/screens/loading_screen.dart';
import 'package:rutas_flutter/features/progress/data/datasources/progress_local_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppOpenAd? openAd;
bool isAdLoaded = false;

Future<void> loadOpenAd() async {
  RutaAdsIds cursinAds = RutaAdsIds();
  try {
    await AppOpenAd.load(
      adUnitId: cursinAds.openApp_adUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          openAd = ad;
          openAd!.show();
          isAdLoaded = true;
        },
        onAdFailedToLoad: (error) {
          isAdLoaded = false;
        },
      ),
      orientation: AppOpenAd.orientationPortrait,
    );
  } catch (e) {
    //print('Error loading open ad: $e');
    isAdLoaded = false;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  LocalDatabaseHelper().getDatabase();
  ProgressLocalDatabaseHelper().getDatabase;
  LocalExamDataSource().getDatabase;
  //LocalExamDataSource().printAllQuestions();

  await dotenv.load(fileName: '.env');

  final sharedPreferences = await SharedPreferences.getInstance();

  await loadOpenAd();

  Timer(const Duration(seconds: 12), () async {
    if (!isAdLoaded) {
      openAd?.dispose();
    }
  });

  runApp(ProviderScope(
    overrides: [
      // Sobrescribir el SharedPreferencesProvider con la instancia de SharedPreferences
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RutaFlutter',
        theme: isDarkMode ? ThemeManager.darkTheme : ThemeManager.lightTheme,
        home: const LoadingScreen());
  }
}
