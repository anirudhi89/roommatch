//View for the user's profile

import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';
import 'package:roommatch/Widgets/clickableImage.dart';
import 'package:roommatch/Widgets/navBar.dart';
import 'package:roommatch/Widgets/ageDropdown.dart';
import 'package:roommatch/Widgets/nameChange.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainUserModel mainUser = MainUserViewModel().getUser();
    TextEditingController textcontroller_fn =
        TextEditingController(text: '${mainUser.firstName} ');
    TextEditingController textcontroller_ln =
        TextEditingController(text: '${mainUser.lastName}');
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
            height: 400,
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
            height: 50,
            child: Align(
              alignment: Alignment.topLeft,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                ),
                child: Row(
                  children: <Widget>[
                    NameChange(),
                    SizedBox(width: 15),
                    SizedBox(
                      height: 50,
                      width: 60,
                      child: AgeDropdown(currentAge: mainUser.age),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
              //SizedBox for institution
              //Dropdown menu? Text box that suggests options?
              ),
          SizedBox(
              //SizedBox for bio
              ),
          SizedBox(
              //Final box for a "Save changes" button
              //Pressing the button will save:
              //1. First and last name changes (from texteditingcontroller.text)
              //2. Institution name change
              //3. Changes in bio
              ),
        ],
      ),
      bottomNavigationBar: NavBarExpanded(tab: 0),
    );
  }
}
