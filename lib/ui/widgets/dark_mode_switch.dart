import 'package:flutter/material.dart';
import 'package:flutter_riverpod_darkswitch/ui/app_theme/app_theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DarkModeSwitch extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeEnabled = ref.watch(appThemeStateNotifier);
    return Switch(
      value: darkModeEnabled,
      onChanged: (enabled) {
        if (enabled) {
          ref.read(appThemeStateNotifier.notifier).setDarkTheme();
        } else {
          ref.read(appThemeStateNotifier.notifier).setLightTheme();
        }
      },
    );
  }
}
