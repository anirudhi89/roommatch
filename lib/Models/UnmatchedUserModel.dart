import 'package:flutter/material.dart';
import 'package:roommatch/Models/baseUserModel.dart';

class UnmatchedUserModel extends baseUserModel {
  String name;
  List<Image> images;
  int age;
  String description;

  UnmatchedUserModel(this.name, this.images, this.age, this.description);
}
