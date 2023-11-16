import 'package:roommatch/Models/MainUserModel.dart';

class MainUserViewModel {
  // Singleton pattern
  static final MainUserViewModel _instance = MainUserViewModel._internal();

  factory MainUserViewModel() {
    return _instance;
  }

  MainUserViewModel._internal();
  MainUserModel? user;

  MainUserModel createUserIfNeeded(String email, String password) {
    if (user == null) {
      List<String> emailParts = email.split('@');

      String username = emailParts[0];

      List<String> nameParts = username.split('.');

      String firstName = nameParts[0];
      firstName = firstName[0].toUpperCase() + firstName.substring(1);
      String lastName = nameParts.length > 1 ? nameParts[1] : '';
      lastName = lastName[0].toUpperCase() + lastName.substring(1);
      user = MainUserModel(
        username,
        password,
        false,
        [],
        [],
        [],
        [],
        firstName,
        lastName,
        0,
        "",
        0,
        {},
        [],
        "",
        0.0,
        [],
      );
    }
    print(user?.firstName);
    print(user?.lastName);
    return user!;
  }

  MainUserModel getUser() {
    return user!;
  }

  void setUser(MainUserModel newUser) {
    user = newUser;
  }
}
