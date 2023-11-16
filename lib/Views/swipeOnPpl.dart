import 'package:flutter/material.dart';
import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/ViewModels/ListOfUsers.dart';
import 'package:roommatch/Models/UnmatchedUserModel.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';
import 'package:roommatch/Widgets/navBar.dart';
import 'package:roommatch/ViewModels/HandleMatching.dart';

// REF: https://pub.dev/packages/flutter_card_swiper
// Main page where users can swipe on one another -> swipe animation

class SwipeOnPpl extends StatelessWidget {
  SwipeOnPpl({Key? key}) : super(key: key);

  final HandleMatching handleMatching = HandleMatching();

  List<UnmatchedUserModel> generatingUsers = ListOfUsers().generateFakeUsers();
  bool ForceMatched = false;
  @override
  Widget build(BuildContext context) {
    bool _onSwipe(
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
          if (handleMatching.checkIfMatch(generatingUsers[previousIndex]) ==
              1) {
            // Animation for Match
          }
        }
        MainUserViewModel()
            .getUser()
            .oneWayMatched
            .add(generatingUsers[previousIndex]);
        if (handleMatching.checkIfMatch(generatingUsers[previousIndex]) == 1) {
          //Animation for Match
        }
      }
      return true;
    }

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CardSwiper(
                onSwipe: _onSwipe,
                cardsCount: generatingUsers.length,
                cardBuilder:
                    (context, index, percentThresholdX, percentThresholdY) {
                  UnmatchedUserModel user = generatingUsers[index];
                  return Stack(
                    children: [
                      Container(
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
                            Center(child: Text('About: ${user.bio}'))

                            // ADD MORE LATER
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 16.0,
                        right: 16.0,
                        child: GestureDetector(
                          onTap: () {
                            MainUserViewModel().getUser().swipedOnMe.add(user);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Text(
                              'A',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
