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
      List<Image> images,
      String bio,
      double algoScore,
      List<Message> messages)
      : super(firstName, lastName, userID, collegeName, age, preferences,
            images, bio, algoScore);

  String printSmtg() {
    return 'Hello';
  }
  void setPreferences(List<String> selectedPreferences) {
    Map<String, String> newPreferences = {};

    // Assuming preferences are stored as key-value pairs
    for (String preference in selectedPreferences) {
      newPreferences[preference] = "selected"; // You can modify this based on your needs
    }

    // Set the preferences in the user model
    preferences = newPreferences;
  }
    List<String> getPreferences() {
    // Assuming preferences are stored as key-value pairs
    return preferences.keys.toList();
  }

}
