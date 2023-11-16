import 'package:roommatch/Models/MainUserModel.dart';

class SetUserViewModel {
  // Singleton pattern
  static final SetUserViewModel _instance = SetUserViewModel._internal();

  factory SetUserViewModel() {
    return _instance;
  }

  SetUserViewModel._internal();

  MainUserModel createUser(String email, String password) {
    print('Creating user with email: ${email}, password: $password');
    print(password);

    MainUserModel user = MainUserModel(
      email,
      password,
      false,
      [],
      [],
      [],
      "",
      "",
      0,
      "",
      0,
      {},
      [],
      "",
      0.0,
      [],
    );
    return user;
  }
}
