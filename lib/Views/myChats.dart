//View for the user's chats
//Will display in recent order, as well as a search bar to search for specific chats

import 'package:flutter/material.dart';
import 'package:roommatch/Widgets/navBar.dart';

class MyChats extends StatelessWidget {
  const MyChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('My Chats')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'My Chats',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 30),
            const Text(
              'Chat 1',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'Chat 2',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'Chat 3',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'Chat 4',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'Chat 5',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(tab: 2),
    );
  }
}
