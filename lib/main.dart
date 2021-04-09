import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppThemeState extends StateNotifier<bool> {
  AppThemeState(): super(false);

  void setLightTheme() => state = false;
  void setDarkTheme() => state = true;
}

// Theme
final appThemeStateNotifier = StateNotifierProvider<AppThemeState, bool>((ref) => AppThemeState());

void main() {
  runApp(ProviderScope(child: MyApp()));
}

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
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Flutter Theme Riverpod Demo"),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Beamer.of(context).beamToNamed('/settings');
              },
            )
          ],
        )

      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Light Mode"),
                DarkModeSwitch(),
                Text("Dark Mode"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Light Mode"),
                DarkModeSwitch(),
                Text("Dark Mode"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DarkModeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final darkModeEnabled = context.read(appThemeStateNotifier);
    return Switch(
      value: darkModeEnabled,
      onChanged: (enabled) {
        if (enabled) {
          context.read(appThemeStateNotifier.notifier).setDarkTheme();
        } else {
          context.read(appThemeStateNotifier.notifier).setLightTheme();
        }
      },
    );
  }
}

class AppTheme {
  // Private Constructor
  AppTheme._();

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
