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
      // Set<Preferences> preferences,
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
}
