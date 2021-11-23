import 'package:cmu/src/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'src/pages/alumnos/home_page.dart';
import 'src/pages/alumnos/logIn_page_prueba.dart';
import 'src/pages/logIn_page.dart';
import 'src/pages/status_socket.dart';

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
          'LogInPrueba': (_) => LogInPagePrueba(),
          'SplashScreen': (_) => SplashScreen(),
          'HomeAlumnos': (_) => HomePageAlumnos(),
          'Login': (_) => LogInPage(),
          'status': (_) => StatusPage(),
        });
  }
}
