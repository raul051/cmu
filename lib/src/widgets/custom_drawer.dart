import 'package:cmu/src/pages/alumnos/home_page.dart';
import 'package:cmu/src/pages/alumnos/profile_page.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    {
      return Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  child: Row(children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(2.5),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/user.jpg'),
                        radius: 40.0,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          "Raúl Tamayo",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Soy un alumno",
                            style: TextStyle(color: Colors.white, fontSize: 17))
                      ],
                    )
                  ]),
                ),
                decoration: BoxDecoration(color: Color(0xff008651)),
              ),
              ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Color(0xffEF6C00),
                    size: 35,
                  ),
                  title: Text(
                    'Inicio',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => HomePageAlumnos(),
                      ))),
              Divider(
                color: Color(0xffa3a2a2),
              ),
              ListTile(
                  leading: Icon(
                    Icons.supervised_user_circle,
                    color: Color(0xffEF6C00),
                    size: 35,
                  ),
                  title: Text(
                    'Mi perfil',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => ProfilePage(),
                      ))),
              Divider(
                color: Color(0xffa3a2a2),
              ),
              ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Color(0xffEF6C00),
                    size: 35,
                  ),
                  title: Text(
                    'Cerrar Seción',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'Login');
                  }),
              Divider(
                color: Color(0xffa3a2a2),
              ),
            ],
          ),
        ),
      );
    }
  }
}
