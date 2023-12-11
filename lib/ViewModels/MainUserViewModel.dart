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
        username, //username
        password, //pwd
        true, //tutorial complete? [DEFAULT=true]
        [], //potential matches [DEFAULT=empty]
        [], //mutual matches [DEFAULT=empty]
        [], //one way matches [DEFAULT=empty]
        [], //swiped on me [DEFAULT=empty]
        firstName, //first name
        lastName, //last name
        1, //user ID [DEFAULT=1]
        "University of Pittsburgh", //college name [DEFAULT=University of Pittsburgh]
        20, //age [DEFAULT=20]
        {}, //preferences [DEFAULT=empty]
        [], //images [DEFAULT=empty, will be arbitrarily filled later]
        "Hi! I'm ${firstName} and I'm a rising Junior at Pitt studying computer science.", //bio [DEFAULT=generic Pitt bio]
        0.0, //algo score [DEFAULT=0]
        [], //messages [DEFAULT=empty]
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
