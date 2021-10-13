import 'package:flutter/material.dart';

import 'AdminUsers.dart';
import 'BuzonAdminPage.dart';

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
              _btnacciones(),
              
            ]
          ),
        )
      ),
      //backgroundColor: Color(0x31807F7F),
    );
  }

 Widget _btnacciones() {
   return Table(
       children: [
         TableRow(
          children: [
            InkWell(
              child: _crearBotonRedondeado(
                icon: Icons.account_circle,
                colorFondo:Color(0x71EF6C00),
                colorCirculo: Color(0xff008651),
                titulo: 'Gestión de usuarios',
              ),
              onTap:(){
               Navigator.push(context, MaterialPageRoute( builder: (_) => AdminUsersPage(), ));
               }
            ),
            InkWell(
              child: _crearBotonRedondeado(
                icon: Icons.mail,
                colorFondo:Color(0x71008650),
                colorCirculo: Color(0xFFEF6C00),
                titulo: 'Buzón de aclaraciones',
              ),
              onTap:(){
               Navigator.push(context, MaterialPageRoute( builder: (_) => BuzonAdminPage(), ));
               }
            ),
          ]
         ),
         
       ],
   );
 }

 Widget _crearBotonRedondeado({IconData icon, Color colorFondo, Color colorCirculo, String titulo}) {
      return Container(
           height: 180.0,
           margin: EdgeInsets.all(15.0),
           decoration: BoxDecoration(
             color: colorFondo, //Color.fromRGBO(65, 66, 107, 0.7),
             borderRadius: BorderRadius.circular(20.0)
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget>[
            SizedBox(height: 5.0,),
             CircleAvatar(
               backgroundColor: colorCirculo,
               radius:35.0,
               child: Icon(icon, color: Colors.white, size:40)
             ),
            
             Text(titulo, style: TextStyle(color: Colors.white),),
              SizedBox(height: 5.0,),
             ],
           ),
      );
 }

 Widget _logo() {
   return Container(
     margin: EdgeInsets.only(bottom: 30, top: 40),
     child: Image(image: AssetImage('assets/CMU.png'),width: 350), //MediaQuery.of(context).size.width * 0.5
   );
 }

}