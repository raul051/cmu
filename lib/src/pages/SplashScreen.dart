import 'dart:async';

import 'package:cmu/src/widgets/CustomPainer.dart';
import 'package:flutter/material.dart';

import 'LogIn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
      Timer(Duration(seconds:3),(){
        Navigator.push(context, MaterialPageRoute(
          builder: (_) => LogInPage() ));
      });
      super.initState();
    }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         CurvaCustom(), 
         CurvaCustomV(),
          Container(
          margin: EdgeInsets.only(top:150, bottom:150),
          padding: EdgeInsetsDirectional.all(10),
          child: Center(
            child: Image(image: AssetImage('assets/CMU.png'))
           ),
         ),
        ]
      ),
      //backgroundColor: Color(0x31807F7F),
    );
  }
}