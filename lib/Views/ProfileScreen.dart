import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';

class ProfileScreen extends StatelessWidget {
  final MainUserModel user;

  ProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email: ${user.userName}'), //email
            Text('Password: ${user.password}'), // Displaying the password for illustration purposes
          ],
        ),
      ),
    );
  }
}
