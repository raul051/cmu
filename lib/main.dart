import 'package:flutter/material.dart';

import 'src/pages/AdminUsers.dart';
import 'src/pages/BuzonPage.dart';
import 'src/pages/HomePage.dart';
import 'src/pages/LogIn.dart';
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
      initialRoute: 'SplashScreen',
      routes: {
        'SplashScreen'  : (_) => SplashScreen(),
        'Home'  : (_) =>  HomePage(),
        'Login' : (_) =>  LogInPage(),
        'AdminUsers'  : (_) =>  AdminUsersPage(), 
        'Buzon':  (_) =>  BuzonPage(),
      }
    );
  }
}