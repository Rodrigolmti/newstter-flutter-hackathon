import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class NewstterApp extends StatefulWidget {
  @override
  _NewstterAppState createState() => _NewstterAppState();
}

class _NewstterAppState extends State<NewstterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo,

        // Define the default Font Family
        // fontFamily: '',

        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: DefaultTabController(
        length: 4,
        child: HomeScreen(),
      ),
    );
  }
}
