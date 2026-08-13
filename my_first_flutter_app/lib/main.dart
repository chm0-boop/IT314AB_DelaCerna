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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // =========================
                // PROFILE CARD
                // =========================
                Card(
                  margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // PROFILE IMAGE
                        Image.asset(
                          'assets/DelaCerna.jpg',
                          width: 110,
                          height: 110,
                        ),

                        const SizedBox(height: 8),

                        // NEW WIDGET - DIVIDER
                        const Divider(thickness: 2, indent: 30, endIndent: 30),

                        const SizedBox(height: 8),

                        // NAME
                        const Text(
                          'Leachim Dela Cerna',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 3),

                        // COURSE
                        const Text(
                          'BSIT-3',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),

                        const SizedBox(height: 5),

                        // APPLICATION TITLE
                        const Text(
                          'My First Flutter Application',
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 5),

                        // DATE
                        const Text(
                          'July 30, 2026',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),

                        const SizedBox(height: 5),

                        // HOBBY
                        const Text(
                          'Hobby: Dancing',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),

                        const SizedBox(height: 10),

                        // AGE AND BIRTHDATE ROW
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Age: 21',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),

                            const Text(
                              'Birthdate: September 6, 2005',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // =========================
                // FAVORITES CARD
                // =========================
                Card(
                  margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // FAVORITES TITLE
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite, color: Colors.pink, size: 18),

                            SizedBox(width: 5),

                            Text(
                              'My Favorites',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(width: 5),

                            Icon(Icons.favorite, color: Colors.pink, size: 18),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // FAVORITE GAME
                        const Text(
                          'Favorite Game',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 3),

                        const Text(
                          'Mobile Legends',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),

                        const SizedBox(height: 10),

                        // FAVORITE FOOD
                        const Text(
                          'Favorite Food',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 3),

                        const Text(
                          'Fried Chicken',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),

                        const SizedBox(height: 10),

                        // FAVORITE MOVIE
                        const Text(
                          'Favorite Movie',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 3),

                        const Text(
                          'Avengers: Endgame',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),

                        const SizedBox(height: 12),

                        // ROW
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Game: Mobile Legends',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                              ),
                            ),

                            const Text(
                              'Food: Fried Chicken',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
