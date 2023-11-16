import 'package:roommatch/Models/MainUserModel.dart';
import 'package:roommatch/Models/MatchedUserModel.dart';
import 'package:roommatch/Models/UnmatchedUserModel.dart';
import 'package:roommatch/ViewModels/MainUserViewModel.dart';

class HandleMatching {
  HandleMatching();
  MainUserModel mainUser = MainUserViewModel().getUser();

  void ForceMatch(UnmatchedUserModel user) {
    mainUser.oneWayMatched.add(user);
    print("Force Matched");
    checkIfMatch(user);
  }

  int checkIfMatch(UnmatchedUserModel user) {
    if (mainUser.swipedOnMe.contains(user) &&
        mainUser.oneWayMatched.contains(user)) {
      mainUser.oneWayMatched.remove(user);
      mainUser.mutuallyMatched.add(user.convertToMatchedUser());
      print(mainUser.mutuallyMatched.length);
      return 1;
    } else
      return 0;
  }
}
