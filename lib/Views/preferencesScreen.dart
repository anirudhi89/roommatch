import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';

class PreferencesScreen extends StatefulWidget {
  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  List<String> selectedPreferences = [];

  void togglePreference(String preference) {
    setState(() {
      if (selectedPreferences.contains(preference)) {
        selectedPreferences.remove(preference);
      } else {
        selectedPreferences.add(preference);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose your preferences:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                buildPreferenceButton('Early Riser'),
                buildPreferenceButton('Night Owl'),
                buildPreferenceButton('Smoking'),
                buildPreferenceButton('Drinking'),
                buildPreferenceButton('Going Out'),
                buildPreferenceButton('Cleanly'),
                buildPreferenceButton('Prefers Quiet'),
                buildPreferenceButton('Loud'),
                buildPreferenceButton('Frequent Guests'),
                buildPreferenceButton('Works at Home'),
                buildPreferenceButton('Goes to Gym'),
                buildPreferenceButton('Gamer'),
                buildPreferenceButton('Study'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            // Save selected preferences to the user model
            MainUserViewModel().user?.setPreferences(selectedPreferences);
            List<String> savedPreferences =
                MainUserViewModel().user?.getPreferences() ?? [];
            print("Saved Preferences: $savedPreferences");
            // TODO: Perform any other actions or navigate to the next screen
          },
          child: Text('Save Preferences'),
        ),
      ),
    );
  }

  Widget buildPreferenceButton(String preference) {
    return ElevatedButton(
      onPressed: () {
        togglePreference(preference);
      },
      style: ButtonStyle(
        backgroundColor: selectedPreferences.contains(preference)
            ? MaterialStateProperty.all<Color>(Colors.blue)
            : null,
      ),
      child: Text(preference),
    );
  }
}
