import 'package:flutter/material.dart';

// ==========================================
// STUDENT DATA
// ==========================================

class Profile {
  String image;
  String? name;
  String? course;
  int? yearLevel;
  int? age;
  String? hobby;

  // NEW FIELDS
  String? studentId;
  String? email;
  String? favoriteSubject;

  Profile({
    required this.image,
    this.name,
    this.course,
    this.yearLevel,
    this.age,
    this.hobby,
    this.studentId,
    this.email,
    this.favoriteSubject,
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
// STUDENT LIST
// ==========================================

List<Profile> profiles = [
  // STUDENT 1
  Profile(
    image: 'assets/DelaCerna.jpg',
    name: 'Leachim Dela Cerna',
    course: 'BSIT',
    yearLevel: 3,
    age: 21,
    hobby: 'Dancing',
    studentId: '2026001',
    email: 'leachim.delecerna@dbtc-cebu.edu.ph',
    favoriteSubject: 'Programming',
  ),

  // STUDENT 2
  Profile(
    image: 'assets/barbie.jpg',
    name: 'Julia Kong',
    course: 'BSIT',
    yearLevel: 3,
    age: 20,
    hobby: 'Singing',
    studentId: '2026002',
    email: 'julia.kong@dbtc-cebu.edu.ph',
    favoriteSubject: 'Web Development',
  ),

  // STUDENT 3
  Profile(
    image: 'assets/barbie1.jpg',
    name: 'Mav Tajanlangit',
    course: 'BSIT',
    yearLevel: 3,
    age: 21,
    hobby: null,
    studentId: '2026003',
    email: 'mav.tajanlangit@dbtc-cebu.edu.ph',
    favoriteSubject: 'Database',
  ),

  // STUDENT 4
  Profile(
    image: 'assets/barbie3.jpg',
    name: 'Dom Ocarol',
    course: null,
    yearLevel: 3,
    age: 20,
    hobby: 'Watching Movies',
    studentId: '2026004',
    email: 'dom.ocarol@dbtc-cebu.edu.ph',
    favoriteSubject: 'Information Management',
  ),

  // STUDENT 5
  Profile(
    image: 'assets/barbie4.jpg',
    name: 'Krylle Racaza',
    course: 'BSIT',
    yearLevel: 3,
    age: 22,
    hobby: 'Gaming',
    studentId: '2026005',
    email: 'krylle.racaza@dbtc-cebu.edu.ph',
    favoriteSubject: 'Networking',
  ),

  // STUDENT 6
  Profile(
    image: 'assets/emji.jpg',
    name: 'Emji Syllanto',
    course: 'BSIT',
    yearLevel: 3,
    age: 21,
    hobby: 'Dancing',
    studentId: '2026006',
    email: 'emji.syllanto@dbtc-cebu.edu.ph',
    favoriteSubject: 'Programming',
  ),
];

// ==========================================
// FLAG 7 — SORT THE ROLL CALL
// ==========================================

// Sort students alphabetically by name
void sortProfilesByName() {
  profiles.sort((a, b) {
    String nameA = a.name ?? '';
    String nameB = b.name ?? '';

    return nameA.compareTo(nameB);
  });
}

// ==========================================
// MAIN
// ==========================================

void main() {
  // ==========================================
  // FLAG 7
  // SORT THE LIST BEFORE DISPLAYING IT
  // ==========================================

  sortProfilesByName();

  runApp(const MyApp());
}

// ==========================================
// MY APP
// ==========================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'My First Flutter Application',

      home: Scaffold(
        backgroundColor: const Color(0xFFFFE6F0),

        // ==========================================
        // APP BAR
        // ==========================================
        appBar: AppBar(
          title: const Text(
            'My First Flutter Application',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),

          backgroundColor: Colors.white,
        ),

        // ==========================================
        // STUDENT LIST
        // ==========================================
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
                    // ==========================================
                    // PROFILE IMAGE
                    // ==========================================
                    Image.asset(profile.image, width: 120, height: 120),

                    const SizedBox(height: 15),

                    // ==========================================
                    // NAME
                    // ==========================================
                    Text(
                      showData(profile.name),

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ==========================================
                    // STUDENT ID
                    // ==========================================
                    Text(
                      'Student ID: ${showData(profile.studentId)}',

                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 8),

                    // ==========================================
                    // EMAIL
                    // ==========================================
                    Text(
                      'Email: ${showData(profile.email)}',

                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 8),

                    // ==========================================
                    // COURSE
                    // ==========================================
                    Text(
                      'Course: ${showData(profile.course)}',

                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 8),

                    // ==========================================
                    // YEAR LEVEL
                    // ==========================================
                    Text(
                      'Year Level: ${profile.yearLevel?.toString() ?? 'Not provided'}',

                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 8),

                    // ==========================================
                    // AGE
                    // ==========================================
                    Text(
                      'Age: ${profile.age?.toString() ?? 'Not provided'}',

                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 8),

                    // ==========================================
                    // HOBBY
                    // ==========================================
                    Text(
                      'Hobby: ${showData(profile.hobby)}',

                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 8),

                    // ==========================================
                    // FAVORITE SUBJECT
                    // ==========================================
                    Text(
                      'Favorite Subject: ${showData(profile.favoriteSubject)}',

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
