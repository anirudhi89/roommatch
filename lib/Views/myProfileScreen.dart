//This view is for displaying the user's profile
//This also allows the user to make changes to their profile

import 'package:flutter/material.dart';
import 'package:roommatch/Widgets/clickableImage.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RoomMatch'),
      ),
      body: Container(
        //Background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueAccent,
              Colors.blueGrey,
            ],
          ),
        ),
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(9, (index) {
            return Center(
              child: ClickableImage(
                  img: 'images/roommatchdude.jpg', imgnum: index),
            );
          }),
        ),
      ),
    );
  }
}
