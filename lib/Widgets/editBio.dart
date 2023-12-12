//Bio editing box

import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';

class EditBio extends StatefulWidget {
  final String bio;

  const EditBio({
    super.key,
    required this.bio,
  });

  @override
  State<EditBio> createState() => _EditBioState();
}

class _EditBioState extends State<EditBio> {
  @override
  Widget build(BuildContext context) {
    TextEditingController bio_controller =
        TextEditingController(text: '${widget.bio}');
    FocusNode _focusnode = FocusNode();
    MainUserModel mainuser = MainUserViewModel().getUser();

    return Column(
      children: <Widget>[
        SizedBox(height: 3),
        SizedBox(
          height: 100,
          width: 350,
          child: EditableText(
            textAlign: TextAlign.center,
            backgroundCursorColor: Colors.black,
            controller: bio_controller,
            focusNode: _focusnode,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
            cursorColor: Colors.black,
            onChanged: (String? newbio) {
              mainuser.bio = newbio!;
              debugPrint('Bio changed to $newbio');
            },
            maxLines: 5,
          ),
        ),
      ],
    );
  }
}
