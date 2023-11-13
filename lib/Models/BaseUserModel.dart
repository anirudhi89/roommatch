import 'package:flutter/material.dart';
import 'package:roommatch/Models/Preferences.dart';

class baseUserModel {
  String firstName;
  String lastName;
  int userID; //int: -2^63 to 2^63 - 1. when compiled to JavaScript -2^53 to 2^53 - 1.
  String collegeName;
  int age;
  Set<Preferences> preferences;
  List<Image> images;
  String bio;
  double algoScore;
  baseUserModel(this.firstName, this.lastName, this.userID, this.collegeName,
      this.age, this.preferences, this.images, this.bio, this.algoScore);
}
