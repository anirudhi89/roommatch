import 'package:flutter/material.dart';
import 'package:roommatch/Models/Message.dart';
import 'package:roommatch/Models/BaseUserModel.dart';
import 'package:roommatch/Models/Preferences.dart';
import 'package:roommatch/Models/UnmatchedUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';

class MatchedUserModel extends BaseUserModel {
  late List<Message> messages;

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

  Message sendMessageToMatchedUser(String content) {
    var mainuser = MainUserViewModel().getUser();

    Message newMessage = Message(
      senderName: mainuser.userName, // mainuser is sender
      content: content,
      timestamp: DateTime.now(),
    );
    messages.add(newMessage);
    return newMessage;
  }
}
