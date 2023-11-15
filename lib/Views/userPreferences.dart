//Simple skeleton view for the user's preferences

import 'package:flutter/material.dart';

class UserPreferences extends StatelessWidget {
  const UserPreferences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Preferences')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Preferences',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 30),
            const Text(
              'Preference 1',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'Preference 2',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'Preference 3',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'Preference 4',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'Preference 5',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
