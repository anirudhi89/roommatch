import 'dart:math';

import 'package:roommatch/Models/UnmatchedUserModel.dart';

class ListOfUsers {
  List<UnmatchedUserModel> main() {
    return generateFakeUsers();
  }

  List<UnmatchedUserModel> generateFakeUsers() {
    List<String> guyFirstNames = [
      'John',
      'Bob',
      'Charlie',
      'David',
      'Frank',
      'Harry',
      'Ivan',
      'Jack',
      'Kevin',
      'Leo',
      'Mike',
      'Nick',
      'Oscar',
      'Paul',
      'Robert'
    ];

    List<String> girlFirstNames = [
      'Jane',
      'Alice',
      'Emma',
      'Eva',
      'Grace',
      'Helen',
      'Isabel',
      'Julia',
      'Karen',
      'Lily',
      'Alex',
      'Mia',
      'Nina',
      'Olivia',
      'Pamela'
    ];

    List<String> lastNames = [
      'Doe',
      'Smith',
      'Johnson',
      'Brown',
      'Lee',
      'Davis',
      'Miller',
      'Moore',
      'Taylor',
      'Wilson',
      'Anderson',
      'Thomas',
      'Jackson',
      'White',
      'Harris',
      'Martin',
      'Thompson',
      'Garcia',
      'Martinez',
      'Jones',
    ];

    List<String> colleges = [
      'University of Pittsburgh',
      'Carnegie Mellon University',
      'Duquesne University',
      'Carlow University',
      'Chatham University',
      'Penn State University',
    ];

    List<String> bioTemplates = [
      'I am a student at {college}.',
      'I am a senior at {college}, looking for a roommate next year. I love to play {sport} and {hobby}.',
      'Hello, I am studying {major} at {college}.',
    ];

    Random random = Random();

    List<UnmatchedUserModel> users = [];

    for (int i = 1; i <= 30; i++) {
      String firstName;
      if (i.isEven) {
        firstName = girlFirstNames[random.nextInt(girlFirstNames.length)];
      } else {
        firstName = guyFirstNames[random.nextInt(guyFirstNames.length)];
      }

      String lastName = lastNames[random.nextInt(lastNames.length)];
      String college = colleges[random.nextInt(colleges.length)];
      int age = 18 + random.nextInt(7); // Between 18 and 24
      double algoScore = (random.nextDouble() * 2) - 1; // Between -1 and 1

      Map<String, String> preferences = {
        'smoking': (random.nextBool()) ? 'Smoking' : 'Non Smoking',
        'hotOrCold':
            (random.nextBool()) ? 'Hot Temperature' : 'Cold Temperature',
        'onCampus': (random.nextBool()) ? 'On Campus' : 'Off Campus',
        'prefGender': (i.isEven) ? 'Female roommate' : 'Male roommate',
      };

      List<String> images = List.filled(
        6,
        (i.isEven) ? 'images/roommatchgirl.jpeg' : 'images/roommatchdude.jpg',
      );

      String bio = bioTemplates[random.nextInt(bioTemplates.length)];
      bio = bio
          .replaceAll('{college}', college)
          .replaceAll('{sport}',
              ['basketball', 'football', 'soccer'][random.nextInt(3)])
          .replaceAll('{hobby}',
              ['reading', 'traveling', 'painting'][random.nextInt(3)])
          .replaceAll('{major}',
              ['Computer Science', 'Biology', 'Psychology'][random.nextInt(3)]);

      users.add(UnmatchedUserModel(
        firstName,
        lastName,
        i,
        college,
        age,
        preferences,
        images,
        bio,
        algoScore,
      ));
    }

    return users;
  }
}
