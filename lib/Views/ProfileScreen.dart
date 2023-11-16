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
            Text('Email: ${user.userName}'),
            Text('Password: ${user.password}'),
          ],
        ),
      ),
    );
  }
}
