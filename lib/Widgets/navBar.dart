import 'package:flutter/material.dart';
import 'package:roommatch/Views/myChats.dart';
import 'package:roommatch/Views/myProfile.dart';
import 'package:roommatch/Views/swipeOnPpl.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            //Profile screen
            if (currentPageIndex != 0 && index == 0) {
              currentPageIndex = index;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfile()),
              );
            } else if (currentPageIndex != 1 && index == 1) {
              currentPageIndex = index;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SwipeOnPpl()),
              );
            } else if (currentPageIndex != 2 && index == 2) {
              currentPageIndex = index;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyChats()),
              );
            }
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
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
      ),
      //Upon pressing profile, it will take you to the profile page (myProfile.dart)
      //Upon pressing home, it will take you to the home swipe page (swipeOnPpl.dart)
      //Upon pressing chats, it will take you to the chats page (myChats.dart)
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key, required int tab});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;

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
      indicatorColor: Colors.amber[800],
      selectedIndex: currentPageIndex,
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
