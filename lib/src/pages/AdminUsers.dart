import 'package:flutter/material.dart';

class AdminUsersPage extends StatelessWidget {
  const AdminUsersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff008651), title:Text("Gestión de usuarios")),
      body: Center(child: Text("Aquí estara el modulo de administración de usuarios",style:TextStyle(color:Colors.white)),),
      backgroundColor: Color(0x31807F7F),
    );
  }
}