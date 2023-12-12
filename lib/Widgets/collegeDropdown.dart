//Dropdown menu widget for selecting a college
import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';

class CollegeDropdown extends StatefulWidget {
  String currCollege;

  CollegeDropdown({
    super.key,
    required this.currCollege,
  });

  @override
  State<CollegeDropdown> createState() => _CollegeDropdownState();
}

class _CollegeDropdownState extends State<CollegeDropdown> {
  final List<String> validColleges = [
    'University of Pittsburgh',
    'Carnegie Mellon University',
    'Duquesne University',
    'Carlow University',
    'Chatham University',
    'Penn State University',
  ];
  MainUserModel mainuser = MainUserViewModel().getUser();

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      alignment: Alignment.center,
      value: widget.currCollege,
      icon: Icon(Icons.school, color: Colors.white),
      onChanged: (String? value) {
        setState(() {
          widget.currCollege = value!;
        });
        mainuser.collegeName = value!;
        debugPrint(
            '[uid=${mainuser.userID}] College changed to ${mainuser.collegeName}');
      },
      items: validColleges.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Roboto',
            ),
          ),
        );
      }).toList(),
    );
  }
}
