import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppThemeState extends StateNotifier<bool> {
  AppThemeState(): super(false);

  void setLightTheme() => state = false;
  void setDarkTheme() => state = true;
}