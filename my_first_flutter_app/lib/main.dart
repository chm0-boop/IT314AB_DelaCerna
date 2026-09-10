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
  if (value == null || value.isEmpty) {
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
    studentId: '2023-001',
    email: 'leachim@example.com',
    favoriteSubject: 'Information Management',
    active: true,
  ),
  Profile(
    image: 'assets/barbie.jpg',
    name: 'Julia Kong',
    course: 'BSIT',
    yearLevel: 3,
    age: 21,
    hobby: 'Watching Movies',
    studentId: '2023-002',
    email: 'julia@example.com',
    favoriteSubject: 'Programming',
    active: false,
  ),
  Profile(
    image: 'assets/barbie1.jpg',
    name: 'Mav Tajanlangit',
    course: 'BSIT',
    yearLevel: 3,
    age: 21,
    hobby: 'Playing Games',
    studentId: '2023-003',
    email: 'mav@example.com',
    favoriteSubject: 'Database',
    active: true,
  ),
  Profile(
    image: 'assets/barbie3.jpg',
    name: 'Dom Ocarol',
    course: 'BSIT',
    yearLevel: 3,
    age: 21,
    hobby: 'Basketball',
    studentId: '2023-004',
    email: 'dom@example.com',
    favoriteSubject: 'Networking',
    active: false,
  ),
  Profile(
    image: 'assets/barbie4.jpg',
    name: 'Krylle Racaza',
    course: 'BSIT',
    yearLevel: 3,
    age: 21,
    hobby: 'Music',
    studentId: '2023-005',
    email: 'krylle@example.com',
    favoriteSubject: 'Web Development',
    active: true,
  ),
  Profile(
    image: 'assets/emji.jpg',
    name: 'Emji Syllanto',
    course: 'BSIT',
    yearLevel: 3,
    age: 21,
    hobby: 'Drawing',
    studentId: '2023-006',
    email: 'emji@example.com',
    favoriteSubject: 'Information Management',
    active: false,
  ),
];

void sortProfilesByName() {
  profiles.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
}

void main() {
  sortProfilesByName();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentHome(),
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
  bool isLoading = true;

  List<Profile> originalProfiles = [
    Profile(
      image: 'assets/DelaCerna.jpg',
      name: 'Leachim Dela Cerna',
      course: 'BSIT',
      yearLevel: 3,
      age: 21,
      hobby: 'Dancing',
      studentId: '2023-001',
      email: 'leachim@example.com',
      favoriteSubject: 'Information Management',
      active: true,
    ),
    Profile(
      image: 'assets/barbie.jpg',
      name: 'Julia Kong',
      course: 'BSIT',
      yearLevel: 3,
      age: 21,
      hobby: 'Watching Movies',
      studentId: '2023-002',
      email: 'julia@example.com',
      favoriteSubject: 'Programming',
      active: false,
    ),
    Profile(
      image: 'assets/barbie1.jpg',
      name: 'Mav Tajanlangit',
      course: 'BSIT',
      yearLevel: 3,
      age: 21,
      hobby: 'Playing Games',
      studentId: '2023-003',
      email: 'mav@example.com',
      favoriteSubject: 'Database',
      active: true,
    ),
    Profile(
      image: 'assets/barbie3.jpg',
      name: 'Dom Ocarol',
      course: 'BSIT',
      yearLevel: 3,
      age: 21,
      hobby: 'Basketball',
      studentId: '2023-004',
      email: 'dom@example.com',
      favoriteSubject: 'Networking',
      active: false,
    ),
    Profile(
      image: 'assets/barbie4.jpg',
      name: 'Krylle Racaza',
      course: 'BSIT',
      yearLevel: 3,
      age: 21,
      hobby: 'Music',
      studentId: '2023-005',
      email: 'krylle@example.com',
      favoriteSubject: 'Web Development',
      active: true,
    ),
    Profile(
      image: 'assets/emji.jpg',
      name: 'Emji Syllanto',
      course: 'BSIT',
      yearLevel: 3,
      age: 21,
      hobby: 'Drawing',
      studentId: '2023-006',
      email: 'emji@example.com',
      favoriteSubject: 'Information Management',
      active: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  void showEditDialog(Profile profile) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Student'),
          content: Text('Editing ${showData(profile.name)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void toggleFavorite(Profile profile) {
    setState(() {
      String id = profile.studentId ?? profile.name ?? '';

      if (favoriteStudents.contains(id)) {
        favoriteStudents.remove(id);
      } else {
        favoriteStudents.add(id);
      }
    });
  }

  void deleteStudent(int index) {
    String id = profiles[index].studentId ?? profiles[index].name ?? '';

    setState(() {
      profiles.removeAt(index);
      favoriteStudents.remove(id);
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Student deleted')));
  }

  Future<void> restoreStudents() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      profiles = originalProfiles
          .map(
            (student) => Profile(
              image: student.image,
              name: student.name,
              course: student.course,
              yearLevel: student.yearLevel,
              age: student.age,
              hobby: student.hobby,
              studentId: student.studentId,
              email: student.email,
              favoriteSubject: student.favoriteSubject,
              active: student.active,
            ),
          )
          .toList();

      favoriteStudents.clear();
      sortProfilesByName();
      isLoading = false;
    });
  }

  Widget loadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text(
            'Loading students...',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 80, color: Colors.grey),
          const SizedBox(height: 15),
          const Text(
            'No students found',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            'The student directory is empty.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: restoreStudents,
            child: const Text('Restore Students'),
          ),
        ],
      ),
    );
  }

  Widget studentList() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: profiles.length,
      itemBuilder: (context, index) {
        final profile = profiles[index];

        String studentKey = profile.studentId ?? profile.name ?? '';

        bool isFavorite = favoriteStudents.contains(studentKey);

        return Card(
          margin: const EdgeInsets.only(bottom: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Color(0xFFAD1457)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        profile.image,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            showData(profile.name),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Georgia',
                            ),
                          ),
                          const SizedBox(height: 8),
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
                        ],
                      ),
                    ),
                  ],
                ),
                if (!profile.active) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '⚠ This student is inactive',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 15),
                Text('Student ID: ${showData(profile.studentId)}'),
                Text('Course: ${showData(profile.course)}'),
                Text('Year Level: ${profile.yearLevel ?? 'Not provided'}'),
                Text('Age: ${profile.age ?? 'Not provided'}'),
                Text('Hobby: ${showData(profile.hobby)}'),
                Text('Email: ${showData(profile.email)}'),
                Text('Favorite Subject: ${showData(profile.favoriteSubject)}'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        toggleFavorite(profile);
                      },
                      child: Text(isFavorite ? 'Unfavorite' : 'Favorite'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        showEditDialog(profile);
                      },
                      child: const Text('Edit'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        deleteStudent(index);
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (isLoading) {
      content = loadingState();
    } else if (profiles.isEmpty) {
      content = emptyState();
    } else {
      content = studentList();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFE6F0),
      appBar: AppBar(
        title: const Text('My First Flutter Application'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFFAD1457),
      ),
      body: content,
    );
  }
}
