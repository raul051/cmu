import 'package:cmu/src/pages/alumnos/peticones_page.dart';
import 'package:cmu/src/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
          backgroundColor: Color(0xff008651), title: Text("Perfil de usuario")),
      body: Column(
        children: [
          _barravatar(context),
          SizedBox(
            height: 15,
          ),
          _dataosContacto(),
          SizedBox(
            height: 15,
          ),
          _datosEdu(),
          SizedBox(
            height: 70,
          ),
          _bottonpeticion(context)
        ],
      ),
    );
  }

  Widget _barravatar(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 6.5,
        decoration: BoxDecoration(color: Color(0xFF277C68)),
        child: Row(children: [
          Container(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 2.5,
            ),
            margin: EdgeInsets.only(right: 10, left: 5),
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/user.jpg'),
              radius: 40.0,
            ),
          ),
          SizedBox(
            width: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              Text("Soy un estudiante",
                  style: TextStyle(color: Colors.white, fontSize: 17))
            ],
          )
        ]));
  }

  Widget _dataosContacto() {
    return Column(
      children: [
        Text(
          "Datos de contacto",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 11,
        ),
        Container(
          width: 350,
          height: 123,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffEF6C00),
          ),
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  "correo@correo.com",
                  style: TextStyle(fontSize: 18),
                ),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: Color(0xff008651)),
                leading: Icon(Icons.mail, color: Colors.white),
                onTap: () {},
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                title: Text(
                  "247xxxx200",
                  style: TextStyle(fontSize: 18),
                ),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: Color(0xff008651)),
                leading: Icon(Icons.phone, color: Colors.white),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }

  _datosEdu() {
    return Column(
      children: [
        Text(
          "Datos de institucionales",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 11,
        ),
        Container(
          width: 350,
          height: 123,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffEF6C00),
          ),
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  "IDGS",
                  style: TextStyle(fontSize: 18),
                ),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: Color(0xff008651)),
                leading: Icon(Icons.book_rounded, color: Colors.white),
                onTap: () {},
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                title: Text(
                  "20182ITI035",
                  style: TextStyle(fontSize: 18),
                ),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: Color(0xff008651)),
                leading: Icon(Icons.account_circle, color: Colors.white),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _bottonpeticion(BuildContext context) {
    return InkWell(
      onTap: () => _modalpeticion(context),
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 25),
        width: 250,
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xff008651), borderRadius: BorderRadius.circular(100)),
        child: Text(
          "Necesito una aclaración",
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
      ),
    );
  }

  void _modalpeticion(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Solicitar una aclaración"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("¿Necesita alguna alacración o petición sobre sus datos?"),
                Image.asset("assets/CMU.png", width: 100, height: 100)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancelar")),
              TextButton(
                child: Text("Aceptar"),
                onPressed: () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => PeticionesPage(),
                )),
              )
            ],
          );
        });
  }
}
