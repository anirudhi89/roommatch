//View for the user's profile

import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';
import 'package:roommatch/Widgets/clickableImage.dart';
import 'package:roommatch/Widgets/navBar.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainUserModel mainUser = MainUserViewModel().getUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue[800],
      ),
      body: Column(
        children: <Widget>[
          //Single image that expands into grid view (new screen?)
          Center(
            child: Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  //Take user to image selection screen
                  debugPrint(
                      'Clicked image. Taking user to image selection screen...');
                },
                child: SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'images/roommatchdude.jpg',
                      height: 500,
                      width: 500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: Text('Age, Name'),
          )
        ],
      ),
      bottomNavigationBar: NavBarExpanded(tab: 0),
    );
  }
}
