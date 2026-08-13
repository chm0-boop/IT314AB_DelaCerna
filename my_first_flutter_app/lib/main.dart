import 'package:flutter/material.dart';

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
        // DARK PINK BACKGROUND
        backgroundColor: const Color(0xFFAD1457),

        // APP BAR
        appBar: AppBar(
          title: const Text(
            'My First Flutter Application',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Georgia',
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFFE91E63),
        ),

        // CENTERED CONTENT
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),

            // ROUNDED CARD AND BORDER
            decoration: BoxDecoration(
              color: const Color(0xFFFCE4EC),
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(25),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // YOUR PHOTO
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/DelaCerna.jpg',
                    width: 200,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 20),

                // FULL NAME
                const Text(
                  'Leachim Dela Cerna',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Georgia',
                  ),
                ),

                const SizedBox(height: 8),

                // COURSE AND SECTION
                const Text(
                  'BSIT-3',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Georgia',
                  ),
                ),

                const SizedBox(height: 8),

                // DATE
                const Text(
                  '07-30-2026',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Georgia',
                  ),
                ),
              ],
            ),
          ),
        ),

        // FLOATING BUTTON
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: const Color(0xFFE91E63),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
