import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_theme_state.dart';

final appThemeStateNotifier =
    StateNotifierProvider.autoDispose<AppThemeState, bool>((ref) {
  ref.maintainState = true;
  return AppThemeState();
});
