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
          ],
        ),
      ),
    );
  }
}
