import 'package:flutter/material.dart';
import 'package:roommatch/Views/swipeOnPpl.dart';
import 'package:roommatch/Models/ViewModels/SetUserViewModel.dart';
import 'package:roommatch/Models/MainUserModel.dart';

import 'ProfileScreen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({Key? key});

  void handleSignUp(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;
    // Create a new user using SetUserViewModel
    MainUserModel newUser = SetUserViewModel().createUser(email, password);

    // Now you can use the newUser object as needed, for example, navigate to the next screen.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(user: newUser),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('RoomMatch'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueAccent,
              Colors.blueGrey,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TODO: Add a logo
            Text(
              'Sign Up',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                handleSignUp(context);
              },
              child: Text('Sign-up'),
            ),
          ],
        ),
      ),
    );
  }
}
