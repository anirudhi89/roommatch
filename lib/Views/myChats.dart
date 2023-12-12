import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/Models/MatchedUserModel.dart';
import 'package:roommatch/Models/Message.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';
import 'package:roommatch/Views/MessageScreen.dart';
import 'package:roommatch/Widgets/navBar.dart';

class MyChats extends StatefulWidget {
  MyChats({Key? key}) : super(key: key);

  @override
  _MyChatsState createState() => _MyChatsState();
}

class _MyChatsState extends State<MyChats> {
  MainUserModel user = MainUserViewModel().getUser();

  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: user.mutuallyMatched.length,
                  itemBuilder: (context, index) {
                    if (index % 2 == 0) {
                      MatchedUserModel matchedUser =
                          user.mutuallyMatched[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final result = await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MessageScreen(
                                    matchedUser: matchedUser,
                                    onMessageSent: (message) {
                                      _sendRandomMessage(matchedUser, message);

                                      setState(() {});
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage(matchedUser.images[0]),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '${matchedUser.firstName}',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: user.mutuallyMatched.length,
                  itemBuilder: (context, index) {
                    if (index % 2 == 0) {
                      return Container();
                    }
                    MatchedUserModel matchedUser = user.mutuallyMatched[index];
                    String fullName =
                        '${matchedUser.firstName} ${matchedUser.lastName}';
                    String latestMessage = matchedUser.messages.isEmpty
                        ? _sendRandomMessage(matchedUser,
                            "Hey nice to meet you ${matchedUser.firstName}")
                        : matchedUser.messages.last.content;

                    return ListTile(
                      title: Text(
                        fullName,
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        latestMessage,
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () async {
                        final result = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MessageScreen(
                              matchedUser: matchedUser,
                              onMessageSent: (message) {
                                _sendRandomMessage(matchedUser, message);

                                setState(() {});
                              },
                            ),
                          ),
                        );

                        if (result != null && result is String) {
                          _sendRandomMessage(matchedUser, result);

                          setState(() {});
                        }
                      },
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

  String _sendRandomMessage(MatchedUserModel matchedUser, String message) {
    matchedUser.messages.add(
      Message(
        senderName: user.userName,
        content: message,
        timestamp: DateTime.now(),
      ),
    );
    return message;
  }
}
