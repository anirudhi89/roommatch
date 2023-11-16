//View for the user's chats
//Will display in recent order, as well as a search bar to search for specific chats

import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/Models/MatchedUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';
import 'package:roommatch/Widgets/navBar.dart';

class MyChats extends StatelessWidget {
  MyChats({Key? key}) : super(key: key);

  MainUserModel user = MainUserViewModel().getUser();

  @override
  Widget build(BuildContext context) {
    List<MatchedUserModel> chatList = user.mutuallyMatched;
    List<String> namesOfPpl = [];
    for (int i = 0; i < chatList.length; i++) {
      String fullname = chatList[i].firstName + " " + chatList[i].lastName;
      namesOfPpl.add(fullname);
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'My Chats',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: namesOfPpl.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        namesOfPpl[index],
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(tab: 2),
    );
  }
}
