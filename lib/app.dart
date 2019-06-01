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
      ),
      home: DefaultTabController(
        length: 4,
        child: HomeScreen(),
      ),
    );
  }
}
