import 'package:cmu/api/api_Service.dart';
import 'package:cmu/models/login_model.dart';
import 'package:cmu/providers/login_form_provider.dart';
import 'package:cmu/src/widgets/progressHUD.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  LoginRequestModel loginRequestModel;
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _logInUI(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _logInUI(BuildContext context) {
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

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  bool isApiCallProcess = false;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final scaffoldkey = GlobalKey<ScaffoldState>();

  LoginRequestModel loginRequestModel;

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: scaffoldkey,
        child: Form(
          key: globalFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              _cajaMatricula(context),
              SizedBox(height: 35),
              _cajaPass(context),
              SizedBox(height: 55),
              _boton(context)
            ],
          ),
        ));
  }

  _cajaMatricula(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0x31807F7F),
        borderRadius: BorderRadius.circular(50),
      ),
      width: 300,
      child: new TextFormField(
        onSaved: (input) => loginRequestModel.matricula = input,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.mail,
            color: Color(0xffEF6C00),
          ),
          hintText: '20182iti035',
          hintStyle: TextStyle(
            color: Colors.black54,
            fontFamily: 'OpenSans',
          ),
        ),
        validator: (input) => input.length < 5 ? "Revisa tu matricula" : null,
      ),
    );
  }

  Widget _cajaPass(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0x31807F7F),
        borderRadius: BorderRadius.circular(50),
      ),
      width: 300,
      child: new TextFormField(
        onSaved: (input) => loginRequestModel.password = input,
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
        validator: (value) {
          return (value != null && value.length >= 8)
              ? null
              : 'La contraseña debe contener almenos 8 caracteres';
        },
      ),
    );
  }

  Widget _boton(BuildContext context) {
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
          if (validateAndSave()) {
            print(loginRequestModel.toJson());

            setState(() {
              isApiCallProcess = true;
            });

            APIService apiService = new APIService();
            apiService.login(loginRequestModel).then((value) {
              if (value != null) {
                setState(() {
                  isApiCallProcess = false;
                });

                if (value.token.isNotEmpty) {
                  final snackBar = SnackBar(content: Text("Login Successful"));
                  scaffoldkey.currentState.showSnackBar(snackBar);
                } else {
                  final snackBar = SnackBar(content: Text("Existio un error"));
                  scaffoldkey.currentState.showSnackBar(snackBar);
                }
              }
            });
          }
        });
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
