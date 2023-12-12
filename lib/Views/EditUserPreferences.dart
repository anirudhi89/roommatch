import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';
import 'package:roommatch/Views/UploadPictures.dart';

class EditUserPreferences extends StatefulWidget {
  @override
  _EditUserPreferencesState createState() => _EditUserPreferencesState();
}

class _EditUserPreferencesState extends State<EditUserPreferences> {
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
        child: Column(
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
            Expanded(
              child: Wrap(
                spacing: 8.0, // Adjust the spacing as needed
                runSpacing: 8.0, // Adjust the run spacing as needed
                children: [
                  buildPreferenceButton('Early Riser'),
                  buildPreferenceButton('Night Owl'),
                  buildPreferenceButton('Non Smoking'),
                  buildPreferenceButton('Smoking'),
                  buildPreferenceButton('Drinking'),
                  buildPreferenceButton('Non Drinking'),
                  buildPreferenceButton('On Campus'),
                  buildPreferenceButton('Off Campus'),
                  buildPreferenceButton('Male Roommate'),
                  buildPreferenceButton('Female Roommate'),
                  buildPreferenceButton('Cold Temperature'),
                  buildPreferenceButton('Hot Temperature'),
                  buildPreferenceButton('Frequent Guests'),
                  buildPreferenceButton('No Guests'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            // Save selected preferences to the user model
            final mainuser = MainUserViewModel().getUser();
            mainuser.setPreferences(selectedPreferences);
            List<String> savedPreferences = mainuser.getPreferences() ?? [];
            print("Saved Preferences: $savedPreferences");
            // Navigate to upload pics page
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UploadPictures(),
              ),
            );
          },
          child: Text('Save Preferences'),
        ),
      ),
    );
  }

  Widget buildPreferenceButton(String preference) {
    MainUserViewModel mainUserVM = MainUserViewModel();
    List<String> currpref = mainUserVM.getUser().getPreferences();

    return Container(
      child: ElevatedButton(
        onPressed: () {
          togglePreference(preference);
        },
        style: ButtonStyle(
          backgroundColor: currpref.contains(preference)
              ? MaterialStateProperty.all<Color>(Colors.blue)
              : null,
        ),
        child: Text(preference),
      ),
    );
  }
}
