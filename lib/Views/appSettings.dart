//Simple skeleton view for the app settings page

import 'package:flutter/material.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
              'Setting 1',
              style: TextStyle(fontSize: 20),
            ),
            const SettingSwitch(title: "Setting 1"),
            const SizedBox(height: 30),
            const Text(
              'Setting 2',
              style: TextStyle(fontSize: 20),
            ),
            const SettingSwitch(title: "Setting 2"),
            const SizedBox(height: 30),
            const Text(
              'Setting 3',
              style: TextStyle(fontSize: 20),
            ),
            const SettingSwitch(title: "Setting 3"),
            const SizedBox(height: 30),
            const Text(
              'Setting 4',
              style: TextStyle(fontSize: 20),
            ),
            const SettingSwitch(title: "Setting 4"),
          ],
        ),
      ),
    );
  }
}

//Quick widget for a setting switch
//Takes in a title

class SettingSwitch extends StatefulWidget {
  final String title;
  const SettingSwitch({Key? key, required this.title}) : super(key: key);

  @override
  _SettingSwitchState createState() => _SettingSwitchState();
}

class _SettingSwitchState extends State<SettingSwitch> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _value,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}
