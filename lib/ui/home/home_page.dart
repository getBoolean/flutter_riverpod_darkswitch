import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_darkswitch/ui/widgets/dark_mode_switch.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Beamer/Riverpod Theme Demo"),
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
                Text("Go to Settings to change the theme"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}