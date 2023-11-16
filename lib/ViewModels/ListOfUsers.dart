import 'dart:math';

import 'package:roommatch/Models/UnmatchedUserModel.dart';

class ListOfUsers {
  List<UnmatchedUserModel> main() {
    return generateFakeUsers();
  }

  List<UnmatchedUserModel> generateFakeUsers() {
    List<String> firstNames = [
      'John',
      'Jane',
      'Bob',
      'Alice',
      'Charlie',
      'Emma',
      'David',
      'Eva',
      'Frank',
      'Grace',
      'Harry',
      'Helen',
      'Ivan',
      'Isabel',
      'Jack',
      'Julia',
      'Kevin',
      'Karen',
      'Leo',
      'Lily',
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
      String firstName = firstNames[random.nextInt(firstNames.length)];
      String lastName = lastNames[random.nextInt(lastNames.length)];
      String college = colleges[random.nextInt(colleges.length)];
      int age = 18 + random.nextInt(7); // Between 18 and 24
      double algoScore = (random.nextDouble() * 2) - 1; // Between -1 and 1

      Map<String, String> preferences = {
        'smoking': (random.nextBool()) ? 'yes' : 'no',
        'hotOrCold': (random.nextBool()) ? 'hot' : 'cold',
        'onCampus': (random.nextBool()) ? 'true' : 'false',
        'prefGender': (random.nextBool()) ? 'male' : 'female',
      };

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
        [],
        bio,
        algoScore,
      ));
    }

    return users;
  }
}
