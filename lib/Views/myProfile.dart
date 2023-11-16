//View for the user's profile

import 'package:flutter/material.dart';
import 'package:roommatch/Widgets/navBar.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('My Profile'), automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
              'Images: ',
              style: TextStyle(fontSize: 20),
            ),
            const Padding(padding: EdgeInsets.all(50)),
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
              'Institution: ',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'Bio: ',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBarExpanded(tab: 0),
    );
  }
}
