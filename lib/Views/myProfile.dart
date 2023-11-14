//View for the user's profile

import 'package:flutter/material.dart';
import 'package:roommatch/Widgets/navBar.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('My Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'My Profile',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 30),
            const Text(
              'Name: ',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'Age: ',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'College: ',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'Bio: ',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'Images: ',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
