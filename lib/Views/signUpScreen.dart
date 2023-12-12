import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';
import 'package:roommatch/Views/swipeOnPpl.dart';
import 'PreferencesScreen.dart';
import 'ProfileScreen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        // AppBar with a back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigates back when the back button is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Sign Up!
              Text(
                'Sign-up and find your perfect roommate today!',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Alata',
                ), // TextStyle
              ), // Text

              // Logo
              Image.asset(
                'images/RoomMatchLogo.png',
                width: 150.0,
                height: 150.0,
              ),
              const SizedBox(height: 5),
            

              // Username textfield with label
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ), // OutlineInputBorder
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ), // FocusedBorder
                      ), // Input Decoration
                    ), // TextField
                  ],
                ), // Column
              ), // Padding

              const SizedBox(height: 5),
              // Password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ), // OutlineInputBorder
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ), // FocusedBorder
                      ), // Input Decoration
                    ), // TextField
                  ],
                ), // Column
              ), // Padding
              // Forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Not Registered?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),// Text
                  ],
                ), //Row
              ), //Padding

              // Sign in button
              ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;
                MainUserModel user = MainUserViewModel().createUserIfNeeded(email, password);
                MainUserViewModel().setUser(user);
                
                Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => PreferencesScreen(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 34, 188, 222)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), 
                  ),
               ),
                minimumSize: MaterialStateProperty.all<Size>(
                Size(double.infinity,40), 
              ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
              // Or continue with

              // Google + Apple sign in button

              // Not a member? Register now
            ],
          ), // Column
        ), // Center
      ), // Safe Area
    ); // Scaffold
  }
}