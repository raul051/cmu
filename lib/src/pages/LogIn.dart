import 'package:flutter/material.dart';

import 'HomePage.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
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
              _cajaMail(),
              SizedBox( height: 27),
              _cajaPass(),
              SizedBox( height: 35),
              _btnLogIng()
            ]
          ),
        )
      ),
      //backgroundColor: Color(0x31807F7F),
    );
  }

 Widget _logo() {
   return Container(
     margin: EdgeInsets.only(bottom: 30, top: 40),
     child: Image(image: AssetImage('assets/CMU.png'),width: 350), //MediaQuery.of(context).size.width * 0.5
   );
 }

 Widget _cajaPass() {
   return Container(
     decoration: BoxDecoration(
       color:Color(0x31807F7F),
       borderRadius: BorderRadius.circular(50),
     ),
     width: 300,
     child: TextField(
       obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xffEF6C00),
              ),
              hintText: 'Ingresa tu contraseña',
              hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'OpenSans',
              ),
            ),

     )
   );
 }

 Widget _cajaMail() {
   return Container(
     decoration: BoxDecoration(
       color:Color(0x31807F7F),
       borderRadius: BorderRadius.circular(50),
     ),
     width: 300,
     child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.mail,
                color: Color(0xffEF6C00),
              ),
              hintText: 'Ingresa tu Correo electronico',
              hintStyle: TextStyle(
              color: Colors.black54,
              fontFamily: 'OpenSans',
              ),
            ),

     )
   );
 }

 Widget _btnLogIng(){
   final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), primary: Color(0xffEF6C00));
   return ElevatedButton(
            style: style,
            onPressed: () { Navigator.push(context, MaterialPageRoute(
          builder: (_) => HomePage() ));},
            child: const Text('Ingresar'),
          );
 }

}
