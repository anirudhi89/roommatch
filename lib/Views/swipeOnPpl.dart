import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/ListOfUsers.dart';
import 'package:roommatch/Models/UnmatchedUserModel.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';
import 'package:roommatch/Widgets/navBar.dart';
import 'package:roommatch/ViewModels/HandleMatching.dart';
import 'package:roommatch/Widgets/MatchCard.dart';

// REF: https://pub.dev/packages/flutter_card_swiper
// Main page where users can swipe on one another -> swipe animation

class SwipeOnPpl extends StatelessWidget {
  SwipeOnPpl({Key? key}) : super(key: key);

  final HandleMatching handleMatching = HandleMatching();

  List<UnmatchedUserModel> generatingUsers = ListOfUsers().generateFakeUsers();
  bool ForceMatched = false;

  bool _onSwipe(
    BuildContext context,
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    if (direction.name == 'right') {
      if (ForceMatched) {
        MainUserViewModel()
            .getUser()
            .oneWayMatched
            .add(generatingUsers[previousIndex]);
        handleMatching.ForceMatch(generatingUsers[previousIndex]);
        if (handleMatching.checkIfMatch(generatingUsers[previousIndex]) == 1) {
          // Animation for Match
          _showMatchPopup(context);
        }
      }
      MainUserViewModel()
          .getUser()
          .oneWayMatched
          .add(generatingUsers[previousIndex]);
      if (handleMatching.checkIfMatch(generatingUsers[previousIndex]) == 1) {
        //Animation for Match
        _showMatchPopup(context);
      }
    }
    return true;
  }

  void _showMatchPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('It\'s a Match!'),
          content: Text('Congratulations! You have a match.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  onForceMatch(UnmatchedUserModel user) {
    MainUserViewModel().getUser().swipedOnMe.add(user);
    return;
  }

  final CardSwiperController controller = CardSwiperController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CardSwiper(
                controller: controller,
                // onSwipe: _onSwipe,
                onSwipe: (previousIndex, currentIndex, direction) =>
                    _onSwipe(context, previousIndex, currentIndex, direction),
                cardsCount: generatingUsers.length,
                cardBuilder:
                    (context, index, percentThresholdX, percentThresholdY) {
                  UnmatchedUserModel user = generatingUsers[index];
                  return MatchCard(
                    user: user,
                    onLike: () {
                      // Handle like action
                      controller.swipeRight();
                    },
                    onDislike: () {
                      controller.swipeLeft();
                      // Handle dislike action
                    },
                    onForceMatch: () {
                      onForceMatch(user);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(tab: 1),
    );
  }
}
