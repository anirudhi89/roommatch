import 'package:flutter/material.dart';
import 'package:roommatch/Models/Message.dart';
import 'package:roommatch/Models/BaseUserModel.dart';
import 'package:roommatch/Models/Preferences.dart';
import 'package:roommatch/Models/UnmatchedUserModel.dart';

class MatchedUserModel extends BaseUserModel {
  late List<Message> messages;
  String firstName;
  String lastName;
  int userID;
  String collegeName;
  int age;
  Set<Preferences> preferences;
  List<Image> images;
  String bio;
  double algoScore;

  // MatchedUserModel(this.name, this.images, this.age, this.description);
  MatchedUserModel(
    this.messages,
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
