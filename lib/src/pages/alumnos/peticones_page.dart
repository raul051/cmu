import 'package:flutter/material.dart';

class PeticionesPage extends StatelessWidget {
  const PeticionesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff008651),
            title: Text("Aclaraciones y peticiones")),
        body: Center(child: Text("Peticones Page")));
  }
}
