import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String storageKey = 'saved_students';

final List<Profile> profiles = createDefaultProfiles();
final Set<String> favoriteStudents = {};

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await loadSavedStudents();
  } catch (_) {
    profiles
      ..clear()
      ..addAll(createDefaultProfiles());
  }

  runApp(const MyApp());
}

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

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'course': course,
      'yearLevel': yearLevel,
      'age': age,
      'hobby': hobby,
      'studentId': studentId,
      'email': email,
      'favoriteSubject': favoriteSubject,
      'active': active,
    };
  }

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      image: json['image']?.toString() ?? '',
      name: json['name']?.toString(),
      course: json['course']?.toString(),
      yearLevel: int.tryParse(json['yearLevel']?.toString() ?? ''),
      age: int.tryParse(json['age']?.toString() ?? ''),
      hobby: json['hobby']?.toString(),
      studentId: json['studentId']?.toString(),
      email: json['email']?.toString(),
      favoriteSubject: json['favoriteSubject']?.toString(),
      active: json['active'] == false ? false : true,
    );
  }
}

List<Profile> createDefaultProfiles() {
  return [
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
    ),
    Profile(
      image: 'assets/barbie.jpg',
      name: 'Julia Kong',
      course: 'BSIT',
      yearLevel: 3,
      age: 21,
      hobby: 'Reading',
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
      hobby: 'Gaming',
      studentId: '2023-003',
      email: 'mav@example.com',
      favoriteSubject: 'Networking',
    ),
    Profile(
      image: 'assets/barbie3.jpg',
      name: 'Dom Ocarol',
      course: 'BSIT',
      yearLevel: 3,
      age: 21,
      hobby: 'Sports',
      studentId: '2023-004',
      email: 'dom@example.com',
      favoriteSubject: 'Database',
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
}

void sortProfilesByName() {
  profiles.sort(
    (a, b) =>
        (a.name ?? '').toLowerCase().compareTo((b.name ?? '').toLowerCase()),
  );
}

Future<void> saveStudentsToStorage() async {
  final prefs = await SharedPreferences.getInstance();
  final data = jsonEncode(profiles.map((profile) => profile.toJson()).toList());
  await prefs.setString(storageKey, data);
}

Future<void> loadSavedStudents() async {
  final prefs = await SharedPreferences.getInstance();
  final savedData = prefs.getString(storageKey);

  final Map<String, Profile> records = {
    for (final profile in createDefaultProfiles()) profile.studentId!: profile,
  };

  if (savedData != null && savedData.trim().isNotEmpty) {
    try {
      final decoded = jsonDecode(savedData);

      if (decoded is List) {
        for (final item in decoded) {
          if (item is! Map) continue;

          try {
            final profile = Profile.fromJson(Map<String, dynamic>.from(item));

            final id = profile.studentId?.trim();

            if (id == null || id.isEmpty) continue;

            // Restore the default picture if an older saved record has none.
            final defaultProfile = records[id];
            if (profile.image.trim().isEmpty && defaultProfile != null) {
              profile.image = defaultProfile.image;
            }

            records[id] = profile;
          } catch (_) {
            // Skip invalid saved records.
          }
        }
      }
    } catch (_) {
      // Use default profiles if saved data is invalid.
    }
  }

  profiles
    ..clear()
    ..addAll(records.values);

  sortProfilesByName();
  await saveStudentsToStorage();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Enrollment System',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8E7),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE91E63)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFFAD1457),
          elevation: 1,
        ),
      ),
      home: const StudentListScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == '/add-student') {
          return MaterialPageRoute<Profile>(
            builder: (_) => const AddStudentScreen(),
          );
        }

        if (settings.name == '/student-details') {
          final profile = settings.arguments as Profile;
          return MaterialPageRoute(
            builder: (_) => StudentDetailsScreen(profile: profile),
          );
        }

        return MaterialPageRoute(builder: (_) => const StudentListScreen());
      },
    );
  }
}

// Reusable student picture.
// If the asset is missing or cannot load, show the student's initials.
Widget studentPicture(Profile profile, {double radius = 28}) {
  final name = profile.name ?? '';
  final initials = name.isNotEmpty ? name[0].toUpperCase() : '?';

  return CircleAvatar(
    radius: radius,
    backgroundColor: const Color(0xFFFFE6F0),
    backgroundImage: profile.image.trim().isNotEmpty
        ? AssetImage(profile.image)
        : null,
    onBackgroundImageError: profile.image.trim().isNotEmpty
        ? (exception, stackTrace) {}
        : null,
    child: profile.image.trim().isEmpty
        ? Text(
            initials,
            style: TextStyle(
              color: const Color(0xFFAD1457),
              fontSize: radius * 0.75,
              fontWeight: FontWeight.bold,
            ),
          )
        : null,
  );
}

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  bool isOpeningAddStudent = false;

  Future<void> openAddStudent() async {
    if (isOpeningAddStudent) return;

    setState(() => isOpeningAddStudent = true);

    try {
      final newStudent = await Navigator.of(
        context,
      ).pushNamed<Profile>('/add-student');

      if (!mounted || newStudent == null) return;

      final duplicate = profiles.any(
        (profile) =>
            (profile.studentId ?? '').toLowerCase() ==
            (newStudent.studentId ?? '').toLowerCase(),
      );

      if (duplicate) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('This Student ID already exists.')),
        );
        return;
      }

      setState(() {
        profiles.add(newStudent);
        sortProfilesByName();
      });

      try {
        await saveStudentsToStorage();

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student successfully enrolled!')),
        );
      } catch (e) {
        if (!mounted) return;

        setState(() => profiles.remove(newStudent));

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Unable to save student: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => isOpeningAddStudent = false);
      }
    }
  }

  Future<void> openDetails(Profile profile) async {
    await Navigator.of(
      context,
    ).pushNamed('/student-details', arguments: profile);

    if (mounted) {
      setState(sortProfilesByName);
    }
  }

  Future<void> editStudent(Profile profile) async {
    final result = await showEditStudentDialog(context, profile);

    if (result == true) {
      setState(sortProfilesByName);
      await saveStudentsToStorage();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student information updated!')),
      );
    }
  }

  Future<void> changeStatus(Profile profile) async {
    setState(() => profile.active = !profile.active);
    await saveStudentsToStorage();
  }

  void toggleFavorite(Profile profile) {
    setState(() {
      final id = profile.studentId ?? '';

      if (favoriteStudents.contains(id)) {
        favoriteStudents.remove(id);
      } else {
        favoriteStudents.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Enrollment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Add Student',
            onPressed: isOpeningAddStudent ? null : openAddStudent,
            icon: const Icon(Icons.person_add, size: 27),
          ),
        ],
      ),
      body: profiles.isEmpty
          ? const Center(child: Text('No students found.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                final profile = profiles[index];
                final isFavorite = favoriteStudents.contains(
                  profile.studentId ?? '',
                );

                return Card(
                  color: Colors.white,
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: Color(0xFFFFC1D9)),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: studentPicture(profile),
                    title: Text(
                      profile.name ?? 'No Name',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFAD1457),
                      ),
                    ),
                    subtitle: Text(
                      '${profile.studentId ?? ''}\n'
                      '${profile.course ?? ''} - Year ${profile.yearLevel ?? ''}\n'
                      '${profile.active ? 'Active' : 'Inactive'}',
                    ),
                    isThreeLine: true,
                    onTap: () => openDetails(profile),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) async {
                        if (value == 'edit') {
                          await editStudent(profile);
                        } else if (value == 'favorite') {
                          toggleFavorite(profile);
                        } else if (value == 'status') {
                          await changeStatus(profile);
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(value: 'edit', child: Text('Edit')),
                        PopupMenuItem(
                          value: 'favorite',
                          child: Text(
                            isFavorite ? 'Remove Favorite' : 'Add to Favorites',
                          ),
                        ),
                        PopupMenuItem(
                          value: 'status',
                          child: Text(
                            profile.active ? 'Deactivate' : 'Activate',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Student',
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
        onPressed: isOpeningAddStudent ? null : openAddStudent,
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final idController = TextEditingController();
  final courseController = TextEditingController(text: 'BSIT');
  final yearController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final hobbyController = TextEditingController();
  final subjectController = TextEditingController();

  bool active = true;

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    courseController.dispose();
    yearController.dispose();
    ageController.dispose();
    emailController.dispose();
    hobbyController.dispose();
    subjectController.dispose();
    super.dispose();
  }

  String? requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final pattern = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!pattern.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  String? yearValidator(String? value) {
    final year = int.tryParse(value ?? '');

    if (year == null || year < 1 || year > 4) {
      return 'Enter a year level from 1 to 4';
    }
    return null;
  }

  String? ageValidator(String? value) {
    final age = int.tryParse(value ?? '');

    if (age == null || age < 1 || age > 120) {
      return 'Enter a valid age';
    }
    return null;
  }

  void saveStudent() {
    if (!formKey.currentState!.validate()) return;

    final id = idController.text.trim();

    final duplicate = profiles.any(
      (profile) => (profile.studentId ?? '').toLowerCase() == id.toLowerCase(),
    );

    if (duplicate) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('This Student ID already exists.')),
      );
      return;
    }

    final student = Profile(
      image: '',
      name: nameController.text.trim(),
      studentId: id,
      course: courseController.text.trim(),
      yearLevel: int.parse(yearController.text.trim()),
      age: int.parse(ageController.text.trim()),
      email: emailController.text.trim(),
      hobby: hobbyController.text.trim(),
      favoriteSubject: subjectController.text.trim(),
      active: active,
    );

    Navigator.of(context).pop<Profile>(student);
  }

  Widget buildField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator ?? requiredValidator,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE91E63), width: 2),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Student')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Icon(
                Icons.person_add_alt_1,
                size: 65,
                color: Color(0xFFE91E63),
              ),
              const SizedBox(height: 12),
              const Text(
                'New Student Information',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFAD1457),
                ),
              ),
              const SizedBox(height: 22),
              buildField(label: 'Full Name', controller: nameController),
              buildField(label: 'Student ID', controller: idController),
              buildField(label: 'Course', controller: courseController),
              buildField(
                label: 'Year Level (1-4)',
                controller: yearController,
                keyboardType: TextInputType.number,
                validator: yearValidator,
              ),
              buildField(
                label: 'Age',
                controller: ageController,
                keyboardType: TextInputType.number,
                validator: ageValidator,
              ),
              buildField(
                label: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
              ),
              buildField(label: 'Hobby', controller: hobbyController),
              buildField(
                label: 'Favorite Subject',
                controller: subjectController,
              ),
              SwitchListTile(
                title: const Text('Active Student'),
                value: active,
                activeColor: const Color(0xFFE91E63),
                onChanged: (value) {
                  setState(() => active = value);
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: saveStudent,
                  icon: const Icon(Icons.save),
                  label: const Text('Save Student'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentDetailsScreen extends StatefulWidget {
  final Profile profile;

  const StudentDetailsScreen({super.key, required this.profile});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  Future<void> editStudent() async {
    final result = await showEditStudentDialog(context, widget.profile);

    if (result == true) {
      sortProfilesByName();
      await saveStudentsToStorage();

      if (!mounted) return;

      setState(() {});

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student information updated!')),
      );
    }
  }

  Widget detailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFAD1457),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value == null || value.isEmpty ? 'Not provided' : value,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = widget.profile;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        actions: [
          IconButton(
            tooltip: 'Edit Student',
            onPressed: editStudent,
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            color: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  studentPicture(profile, radius: 55),
                  const SizedBox(height: 15),
                  Text(
                    profile.name ?? 'No Name',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFAD1457),
                    ),
                  ),
                  const SizedBox(height: 20),
                  detailRow('Student ID', profile.studentId),
                  detailRow('Course', profile.course),
                  detailRow('Year Level', profile.yearLevel?.toString()),
                  detailRow('Age', profile.age?.toString()),
                  detailRow('Email', profile.email),
                  detailRow('Hobby', profile.hobby),
                  detailRow('Favorite Subject', profile.favoriteSubject),
                  detailRow('Status', profile.active ? 'Active' : 'Inactive'),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: editStudent,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit Student'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE91E63),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool?> showEditStudentDialog(BuildContext context, Profile profile) {
  final nameController = TextEditingController(text: profile.name);
  final courseController = TextEditingController(text: profile.course);
  final yearController = TextEditingController(
    text: profile.yearLevel?.toString() ?? '',
  );
  final ageController = TextEditingController(
    text: profile.age?.toString() ?? '',
  );
  final emailController = TextEditingController(text: profile.email);
  final hobbyController = TextEditingController(text: profile.hobby);
  final subjectController = TextEditingController(
    text: profile.favoriteSubject,
  );

  final formKey = GlobalKey<FormState>();

  return showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text('Edit Student'),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                editField('Full Name', nameController),
                editField('Course', courseController),
                editField(
                  'Year Level',
                  yearController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    final year = int.tryParse(value ?? '');

                    if (year == null || year < 1 || year > 4) {
                      return 'Enter a year from 1 to 4';
                    }
                    return null;
                  },
                ),
                editField(
                  'Age',
                  ageController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    final age = int.tryParse(value ?? '');

                    if (age == null || age < 1 || age > 120) {
                      return 'Enter a valid age';
                    }
                    return null;
                  },
                ),
                editField(
                  'Email',
                  emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        !RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        ).hasMatch(value.trim())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                editField('Hobby', hobbyController),
                editField('Favorite Subject', subjectController),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;

              profile.name = nameController.text.trim();
              profile.course = courseController.text.trim();
              profile.yearLevel = int.parse(yearController.text.trim());
              profile.age = int.parse(ageController.text.trim());
              profile.email = emailController.text.trim();
              profile.hobby = hobbyController.text.trim();
              profile.favoriteSubject = subjectController.text.trim();

              Navigator.pop(dialogContext, true);
            },
            child: const Text('Save Changes'),
          ),
        ],
      );
    },
  ).whenComplete(() {
    nameController.dispose();
    courseController.dispose();
    yearController.dispose();
    ageController.dispose();
    emailController.dispose();
    hobbyController.dispose();
    subjectController.dispose();
  });
}

Widget editField(
  String label,
  TextEditingController controller, {
  TextInputType keyboardType = TextInputType.text,
  String? Function(String?)? validator,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator:
          validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field is required';
            }
            return null;
          },
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    ),
  );
}
