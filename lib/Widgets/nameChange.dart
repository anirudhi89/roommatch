//Widget for changing your name on your profile

import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';

class NameChange extends StatefulWidget {
  NameChange({
    super.key,
  });

  @override
  State<NameChange> createState() => _NameChangeState();
}

class _NameChangeState extends State<NameChange> {
  MainUserModel mainuser = MainUserViewModel().getUser();

  @override
  Widget build(BuildContext context) {
    TextEditingController fn_controller =
        TextEditingController(text: '${mainuser.firstName}');
    TextEditingController ln_controller =
        TextEditingController(text: '${mainuser.lastName}');

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 5),
          SizedBox(
            height: 50,
            width: 75,
            child: TextField(
              controller: fn_controller,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
              onChanged: (String? newfirst) {
                mainuser.firstName = newfirst!;
                debugPrint(
                    '[uid=${mainuser.userID}] First name changed to $newfirst');
              },
            ),
          ),
          SizedBox(
            height: 50,
            width: 75,
            child: TextField(
              controller: ln_controller,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
              onChanged: (String? newlast) {
                mainuser.lastName = newlast!;
                debugPrint(
                    '[uid=${mainuser.userID}] Last name changed to $newlast');
              },
            ),
          ),
        ],
      ),
    );
  }
}
