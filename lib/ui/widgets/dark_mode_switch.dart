import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_theme/app_theme_provider.dart';

class DarkModeSwitch extends HookConsumerWidget {
  const DarkModeSwitch({Key? key}) : super(key: key);

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
