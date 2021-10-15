import 'package:cmu/providers/registro_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResgistroUsersPage extends StatelessWidget {
  const ResgistroUsersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff008651), title:Text("Resgistro de usuarios")),
      body:Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children:[
              SizedBox(height:35),
              ChangeNotifierProvider(
                create:(_) => ResgistroFormProvider(),
                child: _RegistroForm(),
              )
            ]
          )
        ),
      ),
      //backgroundColor: Color(0x718B8A8A),
    );
  }
}

class _RegistroForm extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

  final loginForm = Provider.of<ResgistroFormProvider>(context);
  final stiloTitulo = TextStyle(fontSize: 20, color:Color(0xC2161616));

    return Container(
      child: Form(
        key:loginForm.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Text("Matricula",style:stiloTitulo),
            SizedBox(height: 10,),
            _cajaMatricula(context),
            SizedBox(height: 18,),
            Text("Nombre",style:stiloTitulo),
            SizedBox(height: 10,),
            _cajaNombre(context),
            SizedBox(height: 18),
            Text("Apellido paterno",style:stiloTitulo),
            SizedBox(height: 10,),
            _cajaApellidoPa(context),
            SizedBox(height: 18),
            Text("Apellido materno",style:stiloTitulo),
            SizedBox(height: 10,),
            _cajaApellidoMa(context),
            SizedBox(height: 18),
            Text("Correo electronico",style:stiloTitulo),
            SizedBox(height: 10,),
            _cajaMail(context),
            SizedBox(height: 18),
            Text("Contraseña",style:stiloTitulo),
            SizedBox(height: 10,),
            _cajaPass(context),
            SizedBox(height: 55),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
              elevation:0,
              color:Color(0xffEF6C00),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child:Text("Registrar", style:TextStyle(color:Colors.white)),
              ),
                onPressed:(){
                if( !loginForm.isValidForm()) return;
                Navigator.pushReplacementNamed(context, 'Home');
            }
              ),
              SizedBox(height: 55),
          ],
        ),
      )
    );
  }

  _cajaMail(BuildContext context) {
    final registroForm = Provider.of<ResgistroFormProvider>(context);
    return Container(
              decoration: BoxDecoration(
                color:Color(0x31807F7F),
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
                onChanged: (value) => registroForm.correo = value,
                validator: (value){
                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = new RegExp(pattern);
                  
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ingrese su correo electronico';
                },
              ),
            );
  }

 Widget _cajaPass(BuildContext context) {
   final loginForm = Provider.of<ResgistroFormProvider>(context);
   return Container(
              decoration: BoxDecoration(
                color:Color(0x31807F7F),
                borderRadius: BorderRadius.circular(50),
              ),
              width: 300,
              child: TextFormField(
                obscureText: true,
                autocorrect: false,
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
                validator: (value){
                  return ( value != null && value.length >= 8)
                  ? null
                  : 'La contraseña debe contener almenos 8 caracteres';
                  
                },
              ),
            );
 }

 Widget _cajaMatricula(BuildContext context) {
  
   final loginForm = Provider.of<ResgistroFormProvider>(context);
   return Container(
              decoration: BoxDecoration(
                color:Color(0x31807F7F),
                borderRadius: BorderRadius.circular(50),
              ),
              width: 300,
              child: TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.app_registration,
                  color: Color(0xffEF6C00),
                ),
                hintText: '20182iti035',
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'OpenSans',
                  ),
                ),
                onChanged: (value) => loginForm.password = value,
                validator: (value){
                  return ( value != null)
                  ? null
                  : 'Ingrese algún valor';
                  
                },
              ),
            );

 }

  _cajaNombre(BuildContext context) {

    final loginForm = Provider.of<ResgistroFormProvider>(context);
   return Container(
              decoration: BoxDecoration(
                color:Color(0x31807F7F),
                borderRadius: BorderRadius.circular(50),
              ),
              width: 300,
              child: TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.notes_rounded,
                  color: Color(0xffEF6C00),
                ),
                hintText: 'Sólo el nombre',
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'OpenSans',
                  ),
                ),
                onChanged: (value) => loginForm.password = value,
                validator: (value){
                  return ( value != null)
                  ? null
                  : 'Ingrese algún valor';
                  
                },
              ),
            );
  }

  _cajaApellidoPa(BuildContext context) {

    final loginForm = Provider.of<ResgistroFormProvider>(context);
   return Container(
              decoration: BoxDecoration(
                color:Color(0x31807F7F),
                borderRadius: BorderRadius.circular(50),
              ),
              width: 300,
              child: TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.notes_rounded,
                  color: Color(0xffEF6C00),
                ),
                hintText: 'Sólo el apellido paterno',
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'OpenSans',
                  ),
                ),
                onChanged: (value) => loginForm.password = value,
                validator: (value){
                  return ( value != null)
                  ? null
                  : 'Ingrese algún valor';
                  
                },
              ),
            );
  }

  _cajaApellidoMa(BuildContext context) {
    final loginForm = Provider.of<ResgistroFormProvider>(context);
   return Container(
              decoration: BoxDecoration(
                color:Color(0x31807F7F),
                borderRadius: BorderRadius.circular(50),
              ),
              width: 300,
              child: TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.notes_rounded,
                  color: Color(0xffEF6C00),
                ),
                hintText: 'Sólo el apellido materno',
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'OpenSans',
                  ),
                ),
                onChanged: (value) => loginForm.password = value,
                validator: (value){
                  return ( value != null)
                  ? null
                  : 'Ingrese algún valor';
                  
                },
              ),
            );
  }
}