import 'package:flutter/material.dart';
import 'package:roommatch/Models/MatchedUserModel.dart';
import 'package:roommatch/Models/Message.dart';
import 'package:roommatch/Models/Preferences.dart';
import 'package:roommatch/Models/UnmatchedUserModel.dart';
import 'package:roommatch/Models/baseUserModel.dart';

class MainUserModel extends baseUserModel {
  bool doneTutorial = false;

  String password;
  List<UnmatchedUserModel> potentialMatches = [];
  List<MatchedUserModel> mutuallyMatched = [];
  List<UnmatchedUserModel> oneWayMatched = [];

  MainUserModel(
      this.password,
      this.doneTutorial,
      this.potentialMatches,
      this.mutuallyMatched,
      this.oneWayMatched,
      String firstName,
      String lastName,
      String userName,
      int userID,
      String collegeName,
      int age,
      Set<Preferences> preferences,
      List<Image> images,
      String bio,
      double algoScore,
      List<Message> messages)
      : super(firstName, lastName, userID, collegeName, age, preferences,
            images, bio, algoScore);
}
