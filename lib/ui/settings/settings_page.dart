import 'package:flutter/material.dart';
import '../widgets/dark_mode_switch.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Light Mode'),
                DarkModeSwitch(),
                Text('Dark Mode'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
