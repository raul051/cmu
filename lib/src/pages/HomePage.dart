import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children:[
              _logo(),
              _btnapoyo(),
              
            ]
          ),
        )
      ),
      //backgroundColor: Color(0x31807F7F),
    );
  }

 Widget _btnapoyo() {
   return Container(
     margin: EdgeInsetsDirectional.only(bottom: 20),
     width: MediaQuery.of(context).size.width * 0.88,
     height: 700,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(10),
       color: Colors.green[600]
     ),
     child: Text("Aqui estaran los botones"),
   );
 }

 Widget _logo() {
   return Container(
     margin: EdgeInsets.only(bottom: 30, top: 40),
     child: Image(image: AssetImage('assets/CMU.png'),width: 350), //MediaQuery.of(context).size.width * 0.5
   );
 }

}