//Simple skeleton view for the app settings page

import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';

class AppSettings extends StatelessWidget {
  AppSettings({Key? key}) : super(key: key);
  MainUserModel mainuser = MainUserViewModel().getUser();

  @override
  Widget build(BuildContext context) {
    TextEditingController username_controller =
        TextEditingController(text: '${mainuser.userName}');
    TextEditingController password_controller =
        TextEditingController(text: '${mainuser.password}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
        backgroundColor: Colors.lightBlue[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),
            TextField(
              controller: username_controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
              onChanged: (String? newusername) {
                mainuser.userName = newusername!;
                debugPrint(
                    '[uid=${mainuser.userID}] Username changed to $newusername');
              },
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: password_controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
              onChanged: (String? newpassword) {
                mainuser.password = newpassword!;
                debugPrint(
                    '[uid=${mainuser.userID}] Password changed to $newpassword');
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Setting 1',
              style: TextStyle(fontSize: 20),
            ),
            const SettingSwitch(title: "Setting 1"),
            const SizedBox(height: 20),
            const Text(
              'Setting 2',
              style: TextStyle(fontSize: 20),
            ),
            const SettingSwitch(title: "Setting 2"),
          ],
        ),
      ),
    );
  }
}

//Quick widget for a setting switch
//Takes in a title

class SettingSwitch extends StatefulWidget {
  final String title;
  const SettingSwitch({Key? key, required this.title}) : super(key: key);

  @override
  _SettingSwitchState createState() => _SettingSwitchState();
}

class _SettingSwitchState extends State<SettingSwitch> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _value,
      activeColor: Colors.lightBlue[800],
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}
