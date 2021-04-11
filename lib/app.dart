import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod_darkswitch/ui/app_theme/app_theme.dart';
import 'package:flutter_riverpod_darkswitch/ui/app_theme/app_theme_provider.dart';
import 'package:flutter_riverpod_darkswitch/ui/home/home_page.dart';
import 'package:flutter_riverpod_darkswitch/ui/settings/settings_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final darkModeEnabled = useProvider(appThemeStateNotifier);
    return MaterialApp.router(
      routeInformationParser: BeamerRouteInformationParser(),
      routerDelegate: BeamerRouterDelegate(
        locationBuilder: SimpleLocationBuilder(
          routes: {
            '/': (context) => MyHomePage(),
            '/settings': (context) => Settings()
          }
        )
      ),
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}