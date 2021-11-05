import 'package:cmu/providers/login_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            child: Column(children: [
              _logo(),
              ChangeNotifierProvider(
                create: (_) => LoginFormProvider(),
                child: _LoginForm(),
              )
            ]),
          )),
      //backgroundColor: Color(0x31807F7F),
    );
  }

  Widget _logo() {
    return Container(
      margin: EdgeInsets.only(bottom: 30, top: 40),
      child: Image(
          image: AssetImage('assets/CMU.png'),
          width: 350), //MediaQuery.of(context).size.width * 0.5
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
        child: Form(
      key: loginForm.formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          _cajaMail(context),
          SizedBox(height: 35),
          _cajaPass(context),
          SizedBox(height: 55),
          MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
              color: Color(0xffEF6C00),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text("Ingresar", style: TextStyle(color: Colors.white)),
              ),
              onPressed: () {
                if (!loginForm.isValidForm()) return;
                Navigator.pushReplacementNamed(context, 'HomeAlumnos');
              })
        ],
      ),
    ));
  }

  _cajaMail(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Color(0x31807F7F),
        borderRadius: BorderRadius.circular(50),
      ),
      width: 300,
      child: TextFormField(
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.mail,
            color: Color(0xffEF6C00),
          ),
          hintText: 'ejemplo@ejemplo.com',
          hintStyle: TextStyle(
            color: Colors.black54,
            fontFamily: 'OpenSans',
          ),
        ),
        onChanged: (value) => loginForm.email = value,
        validator: (value) {
          String pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regExp = new RegExp(pattern);

          return regExp.hasMatch(value ?? '')
              ? null
              : 'Ingrese su correo electronico';
        },
      ),
    );
  }

  Widget _cajaPass(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Color(0x31807F7F),
        borderRadius: BorderRadius.circular(50),
      ),
      width: 300,
      child: TextFormField(
        obscureText: true,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.lock,
            color: Color(0xffEF6C00),
          ),
          hintText: '**********',
          hintStyle: TextStyle(
            color: Colors.black54,
            fontFamily: 'OpenSans',
          ),
        ),
        onChanged: (value) => loginForm.password = value,
        validator: (value) {
          return (value != null && value.length >= 8)
              ? null
              : 'La contraseña debe contener almenos 8 caracteres';
        },
      ),
    );
  }

  Widget btnSupmit(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
        color: Color(0xffEF6C00),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          child: Text("Ingresar", style: TextStyle(color: Colors.white)),
        ),
        onPressed: () {
          loginForm.isValidForm();
        });
  }
}
