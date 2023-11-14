import 'package:flutter/material.dart';
import 'package:roommatch/ViewModels/ListOfUsers.dart';
import 'package:roommatch/Models/UnmatchedUserModel.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:roommatch/Widgets/navBar.dart';

// REF: https://pub.dev/packages/flutter_card_swiper
// Main page where users can swipe on one another -> swipe animation

class SwipeOnPpl extends StatelessWidget {
  SwipeOnPpl({Key? key}) : super(key: key);

  List<UnmatchedUserModel> generatingUsers = ListOfUsers().generateFakeUsers();

  @override
  Widget build(BuildContext context) {
    List<Container> userCards = List.generate(generatingUsers.length, (index) {
      UnmatchedUserModel user = generatingUsers[index];
      return Container(
        height: 700,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${user.firstName} ${user.lastName}'),
            Text('Age: ${user.age}'),
            Text('College: ${user.collegeName}'),
            // Add more user details as needed
          ],
        ),
      );
    });

    return Scaffold(
      body: SafeArea(
        // Avoid hitting notch
        // https://api.flutter.dev/flutter/widgets/SafeArea-class.html
        // Replace with Padding later?
        top: true,
        child: Center(
          child: CardSwiper(
            cardsCount: userCards.length,
            cardBuilder:
                (context, index, percentThresholdX, percentThresholdY) =>
                    userCards[index],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
