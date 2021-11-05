import 'package:flutter/material.dart';

class BuzonAdminPage extends StatelessWidget {
  const BuzonAdminPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff008651),
          title: Text("Buzón de peticiones")),
      body: Center(
        child: Text("Aquí va a estar el Buzón de peticiones"),
      ),
    );
  }
}
