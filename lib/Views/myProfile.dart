//View for the user's profile

//Flutter imports
import 'package:flutter/material.dart';

//Models and ViewModels
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';

//Widgets
import 'package:roommatch/Widgets/clickableImage.dart';
import 'package:roommatch/Widgets/navBar.dart';
import 'package:roommatch/Widgets/ageDropdown.dart';
import 'package:roommatch/Widgets/nameChange.dart';
import 'package:roommatch/Widgets/collegeDropdown.dart';

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
            height: 390,
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
          Row(
            //Row for name change and age change
            children: <Widget>[
              SizedBox(width: 15),
              SizedBox(
                //SizedBox for name change
                height: 50,
                width: 225,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: NameChange(),
                  ),
                ),
              ),
              SizedBox(width: 15),
              SizedBox(
                //SizedBox for age change
                height: 50,
                width: 125,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AgeDropdown(
                        currentAge: mainUser.age,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5), //Padding
          SizedBox(
            height: 50,
            width: 275,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.lightBlue[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CollegeDropdown(
                  currCollege: mainUser.collegeName,
                ),
              ),
            ),
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
