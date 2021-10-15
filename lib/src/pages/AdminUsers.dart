import 'package:cmu/providers/users_provider.dart';
import 'package:flutter/material.dart';

import 'ResgistroUsersPage.dart';

class AdminUsersPage extends StatelessWidget {
  const AdminUsersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff008651), title:Text("Gestión de usuarios")),
      body: _listaUsers(),
      //backgroundColor: Color(0x31807F7F),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff008651),
        child: Icon(Icons.add_circle_outline,size:40),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute( builder: (_) => ResgistroUsersPage(), ));
        },
      ),
    );
  }

 Widget _listaUsers() {

    //usersProvider.cargarData();
    return FutureBuilder(
      future: usersProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot){

        return ListView(
          children: _listaItems(snapshot.data),
        );

      },
    );
    /*return ListView(
      children:  _listaItems()
    );*/
 }

 List<Widget> _listaItems( List<dynamic> data ) {

   final List<Widget> usuarios = [];

   data.forEach((user) { 

     final widgetTemp = ListTile(
       title: Text(user['nombreUser']),
       leading: Icon(Icons.account_circle, size:30, color: Color(0xffEF6C00)),
       onTap: (){},
     );
      usuarios..add(widgetTemp)
              ..add(Divider(color: Color(0x31807F7F),));
   });

   return usuarios;
   
 }
}