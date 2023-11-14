import 'package:flutter/material.dart';
import 'package:roommatch/Models/BaseUserModel.dart';
import 'package:roommatch/Models/MatchedUserModel.dart';
import 'package:roommatch/Models/Message.dart';
import 'package:roommatch/Models/Preferences.dart';

class UnmatchedUserModel extends BaseUserModel {
  String firstName;
  String lastName;
  int userID;
  String collegeName;
  int age;
  Set<Preferences> preferences;
  List<Image> images;
  String bio;
  double algoScore;
  UnmatchedUserModel(
    this.firstName,
    this.lastName,
    this.userID,
    this.collegeName,
    this.age,
    this.preferences,
    this.images,
    this.bio,
    this.algoScore,
  ) : super(firstName, lastName, userID, collegeName, age, preferences, images,
            bio, algoScore);
            
  // Called by Main User's ViewModel - should also update Main User's listOfOneWayMatches
  MatchedUserModel convertToMatchedUser() {
    List<Message> messages = [];
    return MatchedUserModel(
      messages,
      firstName,
      lastName,
      userID,
      collegeName,
      age,
      preferences,
      images,
      bio,
      algoScore,
    );
  }
}
