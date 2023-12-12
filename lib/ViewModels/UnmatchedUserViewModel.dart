import 'package:roommatch/Models/UnmatchedUserModel.dart';
import 'package:roommatch/Models/MatchedUserModel.dart';
import 'package:roommatch/Models/Message.dart';

class UnmatchedUserViewModel {
  // Convert UnmatchedUserModel to MatchedUserModel
  MatchedUserModel convertToMatchedUser(UnmatchedUserModel unmatchedUser) {
    List<Message> messages = [];
    return MatchedUserModel(
      messages,
      unmatchedUser.firstName,
      unmatchedUser.lastName,
      unmatchedUser.userID,
      unmatchedUser.collegeName,
      unmatchedUser.age,
      unmatchedUser.preferences,
      unmatchedUser.images,
      unmatchedUser.bio,
      unmatchedUser.algoScore,
    );
  }
}
