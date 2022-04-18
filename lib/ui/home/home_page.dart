import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Beamer/Riverpod Theme Demo'),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Beamer.of(context).beamToNamed('/settings');
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text('Go to Settings to change the theme')],
            ),
          ),
        ],
      ),
    );
  }
}
