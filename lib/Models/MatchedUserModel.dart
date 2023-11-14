import 'package:flutter/material.dart';
import 'package:roommatch/Models/Message.dart';
import 'package:roommatch/Models/BaseUserModel.dart';
import 'package:roommatch/Models/Preferences.dart';
import 'package:roommatch/Models/UnmatchedUserModel.dart';

class MatchedUserModel extends BaseUserModel {
  late List<Message> messages;
  // String firstName;
  // String lastName;
  // int userID;
  // String collegeName;
  // int age;
  // Set<Preferences> preferences;
  // List<Image> images;
  // String bio;
  // double algoScore;

  MatchedUserModel(
    this.messages,
    firstName,
    lastName,
    userID,
    collegeName,
    age,
    preferences,
    images,
    bio,
    algoScore,
  ) : super(firstName, lastName, userID, collegeName, age, preferences, images,
            bio, algoScore);

  // Called by Main User's ViewModel - should also update Main User's list of mutuallymatched
  UnmatchedUserModel convertToUnmatchedUser() {
    return UnmatchedUserModel(
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
