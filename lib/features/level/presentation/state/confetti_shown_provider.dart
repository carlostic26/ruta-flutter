import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/level/presentation/state/confeti_shown_state_notifier.dart';

final confettiShownProvider =
    StateNotifierProvider<ConfettiShownNotifier, List<int>>(
  (ref) => ConfettiShownNotifier(),
);
