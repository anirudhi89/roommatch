import 'package:flutter/material.dart';
import 'package:roommatch/Models/Preferences.dart';

abstract class BaseUserModel {
  late String firstName;
  late String lastName;
  late int
      userID; //int: -2^63 to 2^63 - 1. when compiled to JavaScript -2^53 to 2^53 - 1.
  late String collegeName;
  late int age;
  // late Set<Preferences> preferences;
  Map<String, String> preferences;
  late List<Image> images;
  late String bio;
  late double algoScore;

  BaseUserModel(this.firstName, this.lastName, this.userID, this.collegeName,
      this.age, this.preferences, this.images, this.bio, this.algoScore);
}
