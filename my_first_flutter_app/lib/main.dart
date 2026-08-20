import 'package:flutter/material.dart';

// ==========================================
// PROFILE DATA
// ==========================================

class Profile {
  String image;
  String? name;
  String? courseSection;
  int? age;
  String? hobby;

  Profile({
    required this.image,
    this.name,
    this.courseSection,
    this.age,
    this.hobby,
  });
}

// ==========================================
// FALLBACK FUNCTION
// ==========================================

String showData(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Not provided';
  }

  return value;
}

// ==========================================
// FIVE DIFFERENT PROFILES
// ==========================================

List<Profile> profiles = [
  // Complete Profile
  Profile(
    image: 'assets/DelaCerna.jpg',
    name: 'Leachim Dela Cerna',
    courseSection: 'BSIT-3',
    age: 21,
    hobby: 'Dancing',
  ),

  // Complete Profile
  Profile(
    image: 'assets/barbie.jpg',
    name: 'Julia Kong',
    courseSection: 'BSIT-3',
    age: 20,
    hobby: 'Singing',
  ),

  // Profile with missing Hobby
  Profile(
    image: 'assets/barbie1.jpg',
    name: 'Mav Tajanlangit',
    courseSection: 'BSIT-3',
    age: 21,
    hobby: null,
  ),

  // Profile with missing Course
  Profile(
    image: 'assets/barbie3.jpg',
    name: 'Dom Ocarol',
    courseSection: null,
    age: 20,
    hobby: 'Watching Movies',
  ),

  // Profile with missing Name
  Profile(
    image: 'assets/barbie4.jpg',
    name: null,
    courseSection: 'BSIT-3',
    age: 22,
    hobby: 'Gaming',
  ),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First Flutter Application',

      home: Scaffold(
        backgroundColor: const Color(0xFFFFE6F0),

        // APP BAR
        appBar: AppBar(
          title: const Text(
            'My First Flutter Application',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          backgroundColor: Colors.white,
        ),

        // BODY
        body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: profiles.length,

          itemBuilder: (context, index) {
            Profile profile = profiles[index];

            return Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              elevation: 4,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    // PROFILE IMAGE
                    Image.asset(profile.image, width: 120, height: 120),

                    const SizedBox(height: 15),

                    // NAME
                    Text(
                      showData(profile.name),
                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // COURSE & SECTION
                    Text(
                      'Course & Section: ${showData(profile.courseSection)}',

                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 8),

                    // AGE
                    Text(
                      'Age: ${profile.age?.toString() ?? 'Not provided'}',

                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 8),

                    // HOBBY
                    Text(
                      'Hobby: ${showData(profile.hobby)}',

                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
