import 'package:roommatch/Models/MainUserModel.dart';

class SetUserViewModel {
  // Singleton pattern
  static final SetUserViewModel _instance = SetUserViewModel._internal();

  factory SetUserViewModel() {
    return _instance;
  }

  SetUserViewModel._internal();

  // Method to create a new instance of MainUserModel
  MainUserModel createUser(String email, String password) {
    // You can implement any additional logic here, such as validating inputs,
    // checking for existing users, interacting with a backend, etc.
    print('Creating user with email: $email, password: $password');

    // For now, let's create a simple instance using the email as the username
    MainUserModel user = MainUserModel(
      email,
      password,
      false,
      [],
      [],
      [],
      "", // Empty string for first name
      "", // Empty string for last name
      0, // Default userID (you might want to set this dynamically)
      "", // Empty string for college name
      0, // Default age (you might want to set this dynamically)
      {}, // Empty set for preferences
      [], // Empty list for images
      "", // Empty string for bio
      0.0, // Default algo score (you might want to set this dynamically)
      [], // Empty list for messages
    );

    // You might want to save the user data or send it to a backend service here.

    return user;
  }
}
