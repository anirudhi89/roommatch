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
          SizedBox(
            //SizedBox for 3x3 grid of images
            height: 405,
            width: 400,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(9, (index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: ClickableImage(
                      img: 'images/roommatchdude.jpg',
                      imgnum: index,
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            //SizedBox for Age and Name info
            //Align to the left
            //Age: dropdown menu?
            //Name: editable text box
            height: 60,
            child: Text('${mainUser.firstName} ${mainUser.lastName}, 21'),
          ),
          SizedBox(
              //SizedBox for institution
              //Dropdown menu? Text box that suggests options?
              ),
          SizedBox(
              //SizedBox for bio
              ),
        ],
      ),
      bottomNavigationBar: NavBarExpanded(tab: 0),
    );
  }
}
