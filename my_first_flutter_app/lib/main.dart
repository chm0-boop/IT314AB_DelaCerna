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
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/student-list',

      routes: {
        '/student-list': (context) => const StudentListScreen(),

        '/add-student': (context) => const AddStudentScreen(),
      },

      onGenerateRoute: (settings) {
        if (settings.name == '/student-details') {
          final Profile profile = settings.arguments as Profile;

          return MaterialPageRoute(
            builder: (context) => StudentDetailsScreen(profile: profile),
          );
        }

        return null;
      },
    );
  }
}

// ang screen for student list

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final Set<String> favoriteStudents = {};

  bool isLoading = true;

  final List<Profile> originalProfiles = [
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
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) {
      return;
    }

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
    final String id = profile.studentId ?? profile.name ?? '';

    setState(() {
      if (favoriteStudents.contains(id)) {
        favoriteStudents.remove(id);
      } else {
        favoriteStudents.add(id);
      }
    });
  }

  void deleteStudent(int index) {
    final String id = profiles[index].studentId ?? profiles[index].name ?? '';

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

    if (!mounted) {
      return;
    }

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

  void openStudentDetails(Profile profile) {
    Navigator.pushNamed(context, '/student-details', arguments: profile);
  }

  void openAddStudent() {
    Navigator.pushNamed(context, '/add-student');
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
          const Icon(Icons.people_outline, size: 80, color: Colors.grey),

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
        final Profile profile = profiles[index];

        final String studentKey = profile.studentId ?? profile.name ?? '';

        final bool isFavorite = favoriteStudents.contains(studentKey);

        return Card(
          margin: const EdgeInsets.only(bottom: 15),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Color(0xFFAD1457)),
          ),

          child: InkWell(
            borderRadius: BorderRadius.circular(15),

            onTap: () {
              openStudentDetails(profile);
            },

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
                        'This student is inactive',

                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 15),

                  Text(
                    'Student ID: '
                    '${showData(profile.studentId)}',
                  ),

                  Text(
                    'Course: '
                    '${showData(profile.course)}',
                  ),

                  Text(
                    'Year Level: '
                    '${profile.yearLevel ?? 'Not provided'}',
                  ),

                  Text(
                    'Age: '
                    '${profile.age ?? 'Not provided'}',
                  ),

                  Text(
                    'Hobby: '
                    '${showData(profile.hobby)}',
                  ),

                  Text(
                    'Email: '
                    '${showData(profile.email)}',
                  ),

                  Text(
                    'Favorite Subject: '
                    '${showData(profile.favoriteSubject)}',
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            toggleFavorite(profile);
                          },

                          child: Text(isFavorite ? 'Unfavorite' : 'Favorite'),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showEditDialog(profile);
                          },

                          child: const Text('Edit'),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            deleteStudent(index);
                          },

                          child: const Text('Delete'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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

        actions: [
          IconButton(
            onPressed: openAddStudent,

            icon: const Icon(Icons.person_add),

            tooltip: 'Add Student',
          ),
        ],
      ),

      body: content,
    );
  }
}

// screen for student details

class StudentDetailsScreen extends StatelessWidget {
  final Profile profile;

  const StudentDetailsScreen({super.key, required this.profile});

  void showEditModal(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Student'),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Name: '
                  '${showData(profile.name)}',
                ),

                const SizedBox(height: 8),

                Text(
                  'Student ID: '
                  '${showData(profile.studentId)}',
                ),

                const SizedBox(height: 8),

                Text(
                  'Course: '
                  '${showData(profile.course)}',
                ),

                const SizedBox(height: 8),

                Text(
                  'Year Level: '
                  '${profile.yearLevel ?? 'Not provided'}',
                ),

                const SizedBox(height: 8),

                Text(
                  'Age: '
                  '${profile.age ?? 'Not provided'}',
                ),

                const SizedBox(height: 8),

                Text(
                  'Hobby: '
                  '${showData(profile.hobby)}',
                ),

                const SizedBox(height: 8),

                Text(
                  'Email: '
                  '${showData(profile.email)}',
                ),

                const SizedBox(height: 8),

                Text(
                  'Favorite Subject: '
                  '${showData(profile.favoriteSubject)}',
                ),

                const SizedBox(height: 8),

                Text(
                  'Status: '
                  '${profile.active ? 'ACTIVE' : 'INACTIVE'}',
                ),
              ],
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6F0),

      appBar: AppBar(
        title: const Text('Student Details'),

        backgroundColor: Colors.white,

        foregroundColor: const Color(0xFFAD1457),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),

            side: const BorderSide(color: Color(0xFFAD1457)),
          ),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),

                    child: Image.asset(
                      profile.image,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: Text(
                    showData(profile.name),

                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Georgia',
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  'Student ID: '
                  '${showData(profile.studentId)}',

                  style: const TextStyle(fontSize: 17),
                ),

                const SizedBox(height: 8),

                Text(
                  'Course: '
                  '${showData(profile.course)}',

                  style: const TextStyle(fontSize: 17),
                ),

                const SizedBox(height: 8),

                Text(
                  'Year Level: '
                  '${profile.yearLevel ?? 'Not provided'}',

                  style: const TextStyle(fontSize: 17),
                ),

                const SizedBox(height: 8),

                Text(
                  'Age: '
                  '${profile.age ?? 'Not provided'}',

                  style: const TextStyle(fontSize: 17),
                ),

                const SizedBox(height: 8),

                Text(
                  'Hobby: '
                  '${showData(profile.hobby)}',

                  style: const TextStyle(fontSize: 17),
                ),

                const SizedBox(height: 8),

                Text(
                  'Email: '
                  '${showData(profile.email)}',

                  style: const TextStyle(fontSize: 17),
                ),

                const SizedBox(height: 8),

                Text(
                  'Favorite Subject: '
                  '${showData(profile.favoriteSubject)}',

                  style: const TextStyle(fontSize: 17),
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    const Text(
                      'Status: ',

                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      profile.active ? 'ACTIVE' : 'INACTIVE',

                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: profile.active ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton.icon(
                    onPressed: () {
                      showEditModal(context);
                    },

                    icon: const Icon(Icons.edit),

                    label: const Text('Edit Student'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddStudentScreen extends StatelessWidget {
  const AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6F0),

      appBar: AppBar(
        title: const Text('Add Student'),

        backgroundColor: Colors.white,

        foregroundColor: const Color(0xFFAD1457),
      ),

      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),

            side: const BorderSide(color: Color(0xFFAD1457)),
          ),

          child: Padding(
            padding: const EdgeInsets.all(30),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                const Icon(
                  Icons.person_add,
                  size: 80,
                  color: Color(0xFFAD1457),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Add Student',

                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Georgia',
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Add Student Screen',

                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Student information '
                  'form will be added here.',

                  textAlign: TextAlign.center,

                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
