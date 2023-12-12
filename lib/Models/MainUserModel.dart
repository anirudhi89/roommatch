import 'package:flutter/material.dart';
import 'package:roommatch/Models/MatchedUserModel.dart';
import 'package:roommatch/Models/Message.dart';
import 'package:roommatch/Models/Preferences.dart';
import 'package:roommatch/Models/UnmatchedUserModel.dart';
import 'package:roommatch/Models/BaseUserModel.dart';

// TODO: SINGLETON
class MainUserModel extends BaseUserModel {
  bool doneTutorial = false;
  String userName;
  String password;
  List<UnmatchedUserModel> potentialMatches = [];
  List<MatchedUserModel> mutuallyMatched = [];
  List<UnmatchedUserModel> oneWayMatched = [];
  List<UnmatchedUserModel> swipedOnMe = [];

  MainUserModel(
      this.userName,
      this.password,
      this.doneTutorial,
      this.potentialMatches,
      this.mutuallyMatched,
      this.oneWayMatched,
      this.swipedOnMe,
      String firstName,
      String lastName,
      int userID,
      String collegeName,
      int age,
      Map<String, String> preferences,
      List<String> images,
      String bio,
      double algoScore,
      List<Message> messages)
      : super(firstName, lastName, userID, collegeName, age, preferences,
            images, bio, algoScore);

  String printSmtg() {
    return 'Hello';
  }

  Map<String, String> setPreferences(List<String> newPreferences) {
    Map<String, String> updatedPreferences = Map.from(preferences);

    updatedPreferences['smoking'] =
        newPreferences.contains('Non Smoking') ? 'Non Smoking' : 'Smoking';
    updatedPreferences['hotOrCold'] = newPreferences.contains('Hot Temperature')
        ? 'Hot Temperature'
        : 'Cold Temperature';
    updatedPreferences['onCampus'] =
        newPreferences.contains('On Campus') ? 'On Campus' : 'Off Campus';
    updatedPreferences['prefGender'] =
        newPreferences.contains('Female Roommate')
            ? 'Female Roommate'
            : 'Male Roommate';
    updatedPreferences['earlyRiser'] =
        newPreferences.contains('Early Riser') ? 'Early Riser' : 'Night Owl';
    updatedPreferences['drinking'] =
        newPreferences.contains('Non Drinking') ? 'Non Drinking' : 'Drinking';

    preferences = updatedPreferences;
    return updatedPreferences;
  }

  List<String> getPreferences() {
    // Assuming preferences are stored as key-value pairs
    return preferences.values.toList();
  }
}
