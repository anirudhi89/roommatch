import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';

class AgeDropdown extends StatefulWidget {
  int currentAge;

  AgeDropdown({
    super.key,
    required this.currentAge,
  });

  @override
  State<AgeDropdown> createState() => _AgeDropdownState();
}

class _AgeDropdownState extends State<AgeDropdown> {
  final List<int> ageRange = List.generate(100, (i) => i + 1);
  MainUserModel mainuser = MainUserViewModel().getUser();

  @override
  Widget build(BuildContext context) {
    int currVal = ageRange[widget.currentAge - 1];
    return DropdownButton(
      value: currVal,
      icon: const Icon(Icons.arrow_circle_down_rounded),
      onChanged: (int? value) {
        setState(() {
          widget.currentAge = value!;
        });
        mainuser.age = value!;
      },
      items: ageRange.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
