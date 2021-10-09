import 'package:flutter/material.dart';

import 'src/pages/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.green[900],
        ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SplashScreen()
    );
  }
}