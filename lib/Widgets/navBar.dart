import 'package:flutter/material.dart';
import 'package:roommatch/Views/EditUserPreferences.dart';
import 'package:roommatch/Views/myChats.dart';
import 'package:roommatch/Views/myProfile.dart';
import 'package:roommatch/Views/swipeOnPpl.dart';
import 'package:roommatch/Views/userPreferences.dart';
import 'package:roommatch/Views/appSettings.dart';

/*
Generic NavBar widget that will fit as the bottomNavigationBar for several of our screens
Has 3 sections: Profile, Home, and Chats
Takes in one parameter (tab) so each screen is initialized with the correct option highlighted
*/

class NavBar extends StatefulWidget {
  final int tab;
  const NavBar({super.key, required this.tab});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
          //Profile screen
          if (currentPageIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyProfile()),
            );
          } else if (currentPageIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SwipeOnPpl()),
            );
          } else if (currentPageIndex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyChats()),
            );
          }
        });
      },
      indicatorColor: Color.fromARGB(255, 34, 188, 222),
      selectedIndex: widget.tab,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.person_sharp),
          label: 'Profile',
        ),
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.message_outlined),
          label: 'Chats',
        ),
      ],
    );
  }
}

/*
Slightly altered NavBar for the Profile page, with options to open Preferences as well as Settings
Has 5 sections: Profile, Preferences, Home, Settings, Chats
Similarly takes in one parameter
*/
class NavBarExpanded extends StatefulWidget {
  final int tab;

  const NavBarExpanded({Key? key, required this.tab}) : super(key: key);

  @override
  State<NavBarExpanded> createState() => _NavBarExpandedState();
}

class _NavBarExpandedState extends State<NavBarExpanded> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
          //Profile screen
          if (currentPageIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyProfile()),
            );
          } else if (currentPageIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditUserPreferences()),
            );
          } else if (currentPageIndex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SwipeOnPpl()),
            );
          } else if (currentPageIndex == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppSettings()),
            );
          } else if (currentPageIndex == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyChats()),
            );
          }
        });
      },
      indicatorColor: Color.fromARGB(255, 34, 188, 222),
      selectedIndex: widget.tab,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.person_sharp),
          label: 'Profile',
        ),
        NavigationDestination(
          icon: Icon(Icons.display_settings_sharp),
          label: 'Preferences',
        ),
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        NavigationDestination(
          icon: Icon(Icons.message_outlined),
          label: 'Chats',
        ),
      ],
    );
  }
}
