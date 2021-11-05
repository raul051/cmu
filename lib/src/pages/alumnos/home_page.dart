import 'package:cmu/providers/ayuda_form_provider.dart';
import 'package:cmu/src/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageAlumnos extends StatelessWidget {
  const HomePageAlumnos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff008651),
          title: Text(""),
        ),
        drawer: DrawerPage(),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titulos(),
                _botonAuxilio(context),
                _formulario(),
              ],
            ),
          ),
        ));
  }

  Widget _botonAuxilio(BuildContext context) {
    return InkWell(
      onTap: () => _alerta(context),
      child: Stack(children: [
        Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(18),
            )),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10, left: 9),
          padding: EdgeInsets.only(top: 75, left: 50),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.red[700], borderRadius: BorderRadius.circular(200)),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          height: 180,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200), color: Colors.red[500]),
          child: Container(
            margin: EdgeInsets.only(top: 70, left: 50),
            child: Text("AYUDA",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          ),
        ),
      ]),
    );
  }

  Widget _titulos() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 50),
      child: Text("¿Necesitas ayuda?", style: TextStyle(fontSize: 27)),
    );
  }

  void _alerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Pedir ayuda"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("¿Pedir ayuda a travez del sistema CMU?"),
                Image.asset("assets/CMU.png", width: 100, height: 100)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancelar")),
              TextButton(
                child: Text("Aceptar"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  Widget _formulario() {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 35),
          ChangeNotifierProvider(
            create: (_) => AyudaFormProvider(),
            child: _AyudaForm(),
          )
        ]),
      ),
    );
  }
}

class _AyudaForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<AyudaFormProvider>(context);
    final stiloTitulo = TextStyle(fontSize: 20, color: Color(0xC2161616));

    return Container(
      child: Form(
          key: loginForm.formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Text("Ubicación", style: stiloTitulo),
              SizedBox(
                height: 10,
              ),
              _cajaUbicacion(context),
              SizedBox(
                height: 18,
              ),
              Text("Malestar", style: stiloTitulo),
              SizedBox(
                height: 10,
              ),
              _cajaMalestar(context),
            ],
          )),
    );
  }

  Widget _cajaUbicacion(BuildContext context) {
    final ayudaForm = Provider.of<AyudaFormProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Color(0x31807F7F),
        borderRadius: BorderRadius.circular(50),
      ),
      width: 300,
      child: TextFormField(
        autocorrect: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.emoji_transportation_sharp,
            color: Color(0xffEF6C00),
          ),
          hintText: 'Edificio P',
          hintStyle: TextStyle(
            color: Colors.black54,
            fontFamily: 'OpenSans',
          ),
        ),
        onChanged: (value) => ayudaForm.ubicacion = value,
        validator: (value) {
          return (value != null) ? null : 'Ingrese algún valor';
        },
      ),
    );
  }

  Widget _cajaMalestar(BuildContext context) {
    final ayudaForm = Provider.of<AyudaFormProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Color(0x31807F7F),
        borderRadius: BorderRadius.circular(50),
      ),
      width: 300,
      child: TextFormField(
        autocorrect: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.sick,
            color: Color(0xffEF6C00),
          ),
          hintText: 'Fiebre',
          hintStyle: TextStyle(
            color: Colors.black54,
            fontFamily: 'OpenSans',
          ),
        ),
        onChanged: (value) => ayudaForm.malestar = value,
        validator: (value) {
          return (value != null) ? null : 'Ingrese algún valor';
        },
      ),
    );
  }
}
