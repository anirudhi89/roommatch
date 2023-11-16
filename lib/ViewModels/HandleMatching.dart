import 'dart:js_interop';

import 'package:roommatch/Models/MatchedUserModel.dart';
import 'package:roommatch/Models/UnmatchedUserModel.dart';

class HandleMatching {
  const HandleMatching();

  void ForceMatch(UnmatchedUserModel user) {
    MatchedUserModel updatedUser = user.convertToMatchedUser();
    print(updatedUser.jsify()); 
  }
}
