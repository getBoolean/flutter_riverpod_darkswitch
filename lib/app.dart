import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ui/app_theme/app_theme.dart';
import 'ui/home/home_page.dart';
import 'ui/settings/settings_page.dart';

class MyApp extends HookConsumerWidget {
  // Cannot be const when using beamer https://github.com/Dart-Code/Dart-Code/issues/3065#issuecomment-1061896753
  MyApp({Key? key}) : super(key: key);
  
  final _routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const MyHomePage(),
        '/settings': (context, state, data) => const Settings()
      },
    ),
  );


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeEnabled = ref.watch(appThemeStateNotifier);

    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
