import 'package:flutter/material.dart';

class Profile {
  String image;
  String? name;
  String? course;
  int? yearLevel;
  int? age;
  String? hobby;
  String? studentId;
  String? email;
  String? favoriteSubject;
  bool active;

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
    this.active = true,
  });
}

String showData(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Not provided';
  }

  return value;
}

List<Profile> profiles = [
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
    active: true,
  ),
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
    active: false,
  ),
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
    active: true,
  ),
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
    active: false,
  ),
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
    active: true,
  ),
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
    active: false,
  ),
];

void sortProfilesByName() {
  profiles.sort((a, b) {
    String nameA = a.name ?? '';
    String nameB = b.name ?? '';

    return nameA.compareTo(nameB);
  });
}

void main() {
  sortProfilesByName();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First Flutter Application',
      home: const StudentHome(),
    );
  }
}

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  Set<String> favoriteStudents = {};

  void showEditDialog(Profile profile) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text(
            'Edit Student',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'You selected ${showData(profile.name)} for editing.',
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void toggleFavorite(Profile profile) {
    if (profile.studentId == null) {
      return;
    }

    setState(() {
      if (favoriteStudents.contains(profile.studentId)) {
        favoriteStudents.remove(profile.studentId);
      } else {
        favoriteStudents.add(profile.studentId!);
      }
    });
  }

  void deleteStudent(int index) {
    Profile deletedProfile = profiles[index];
    String deletedName = showData(deletedProfile.name);
    String? deletedStudentId = deletedProfile.studentId;

    setState(() {
      profiles.removeAt(index);

      if (deletedStudentId != null) {
        favoriteStudents.remove(deletedStudentId);
      }
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$deletedName has been deleted.')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6F0),
      appBar: AppBar(
        title: const Text(
          'My First Flutter Application',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
      ),
      body: profiles.isEmpty
          ? const Center(
              child: Text(
                'No students found.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                Profile profile = profiles[index];

                bool isFavorite =
                    profile.studentId != null &&
                    favoriteStudents.contains(profile.studentId);

                return Card(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                  elevation: 4,
                  color: isFavorite ? Colors.pink.shade100 : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(profile.image, width: 120, height: 120),
                        const SizedBox(height: 15),
                        Text(
                          showData(profile.name),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: profile.active
                                ? Colors.green.shade100
                                : Colors.red.shade100,
                          ),
                          child: Text(
                            profile.active ? 'ACTIVE' : 'INACTIVE',
                            style: TextStyle(
                              color: profile.active
                                  ? Colors.green.shade700
                                  : Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (isFavorite) ...[
                          const SizedBox(height: 5),
                          const Text(
                            '★ FAVORITE STUDENT',
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        const SizedBox(height: 8),
                        Text(
                          'Student ID: ${showData(profile.studentId)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Email: ${showData(profile.email)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Course: ${showData(profile.course)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Year Level: '
                          '${profile.yearLevel?.toString() ?? 'Not provided'}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Age: '
                          '${profile.age?.toString() ?? 'Not provided'}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Hobby: ${showData(profile.hobby)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Favorite Subject: '
                          '${showData(profile.favoriteSubject)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 15),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                toggleFavorite(profile);
                              },
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.pink : Colors.black,
                              ),
                              label: Text(
                                isFavorite ? 'Favorited' : 'Favorite',
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                showEditDialog(profile);
                              },
                              icon: const Icon(Icons.edit),
                              label: const Text('Edit'),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                deleteStudent(index);
                              },
                              icon: const Icon(Icons.delete),
                              label: const Text('Delete'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
