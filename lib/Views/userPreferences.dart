import 'package:flutter/material.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';

class UserPreferences extends StatelessWidget {
  const UserPreferences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainUserViewModel mainUserVM = MainUserViewModel();
    Map<String, dynamic> preferences = mainUserVM.getUser().preferences;

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
            for (MapEntry<String, dynamic> entry in preferences.entries)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      '${entry.key} : ${entry.value}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
