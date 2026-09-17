import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 24, 25, 25),
      ),
      home: _MyHomePageState(),
    );
  }
}

class _MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Social',
          style: TextStyle(
            fontFamily: 'arial',
            fontWeight: FontWeight.bold,
            fontSize: 45,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .start,
          children: [
            Card(
              margin: EdgeInsets.zero,

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              color: Colors.black,
              child: Padding(
                padding: EdgeInsetsGeometry.all(15.0),
                child: Row(
                  children: [
                    Text(
                      'Friends',
                      style: TextStyle(
                        fontSize: 15,

                        fontWeight: FontWeight.bold,
                        fontFamily: 'sans-serif',
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Messages',
                      style: TextStyle(
                        fontSize: 15,

                        fontWeight: FontWeight.bold,
                        fontFamily: 'sans-serif',
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Requests',
                      style: TextStyle(
                        fontSize: 15,

                        fontWeight: FontWeight.bold,
                        fontFamily: 'sans-serif',
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 1, bottom: 0, left: 0, right: 0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              color: const Color.fromARGB(255, 12, 12, 12),
              child: Padding(
                padding: EdgeInsetsGeometry.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  ),

                  child: Padding(
                    padding: EdgeInsetsGeometry.all(12),
                    child: Row(
                      children: [
                        Icon(Icons.search, size: 30, color: Colors.white),

                        SizedBox(width: 5),

                        Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white54,
                            fontFamily: 'sans-serif',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Card(
              color: Colors.black,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: Padding(
                padding: EdgeInsetsGeometry.only(
                  top: 0,
                  bottom: 15,
                  left: 25,
                  right: 15,
                ),
                child: Row(
                  children: [
                    Icon(Icons.circle_rounded, size: 30, color: Colors.red),
                    SizedBox(width: 10),
                    Text(
                      'Valorant',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'sans-serif',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '3',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'sans-serif',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.black,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: Padding(
                padding: EdgeInsetsGeometry.only(
                  top: 0,
                  bottom: 16,
                  left: 30,
                  right: 16,
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 20, 20, 20),
                          radius: 25,
                          child: Icon(
                            Icons.person,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),

                        Row(
                          children: [
                            Icon(Icons.circle, size: 15, color: Colors.black),

                            SizedBox(width: 10),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'MissYouLikeKrazy',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'sans-serif',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                SizedBox(height: 5),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.monitor,
                                      size: 15,
                                      color: Colors.white,
                                    ),

                                    SizedBox(width: 1),

                                    Text(
                                      'Online - Valorant',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'sans-serif',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    Card(
                      color: Colors.black,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(
                          top: 0,
                          bottom: 16,
                          left: 30,
                          right: 16,
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    20,
                                    20,
                                    20,
                                  ),
                                  radius: 25,
                                  child: Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                ),

                                SizedBox(height: -1),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: Colors.black,
                                    ),

                                    SizedBox(width: 10),

                                    Icon(
                                      Icons.play_circle,
                                      size: 15,
                                      color: Colors.lightBlue,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(width: 10),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'bread',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'sans-serif',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                SizedBox(height: 5),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.monitor,
                                      size: 15,
                                      color: Colors.white,
                                    ),

                                    SizedBox(width: 1),

                                    Text(
                                      'Playing - VALORANT',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'sans-serif',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Card(
                      color: Colors.black,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.zero,
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(
                          top: 0,
                          bottom: 16,
                          left: 30,
                          right: 16,
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    20,
                                    20,
                                    20,
                                  ),
                                  radius: 25,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                ),

                                SizedBox(height: -1),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: Colors.black,
                                    ),

                                    SizedBox(width: 10),

                                    Icon(
                                      Icons.play_circle,
                                      size: 15,
                                      color: Colors.lightBlue,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(width: 10),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ('The14th'),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'sans-serif',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                SizedBox(height: 5),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.monitor,
                                      size: 15,
                                      color: Colors.white,
                                    ),

                                    SizedBox(width: 1),

                                    Text(
                                      'Playing - VALORANT',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'sans-serif',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Card(
                      color: Colors.black,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(
                          top: 0,
                          bottom: 16,
                          left: 30,
                          right: 16,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Online',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'sans-serif',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(width: 10),

                            Text(
                              '4',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'sans-serif',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Card(
                      color: Colors.black,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(
                          top: 0,
                          bottom: 16,
                          left: 30,
                          right: 16,
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    20,
                                    20,
                                    20,
                                  ),
                                  radius: 25,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                ),

                                SizedBox(height: -1),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: Colors.black,
                                    ),

                                    SizedBox(width: 10),

                                    Icon(
                                      Icons.dark_mode,
                                      size: 15,
                                      color: Colors.yellow,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 5),

                            Row(
                              children: [
                                Icon(
                                  Icons.mobile_friendly,
                                  size: 15,
                                  color: Colors.white,
                                ),

                                SizedBox(width: 1),

                                Text(
                                  'Away - Riot Mobile',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'sans-serif',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
