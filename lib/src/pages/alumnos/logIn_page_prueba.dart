import 'package:cmu/api/api_Service.dart';
import 'package:cmu/models/login_model.dart';
import 'package:cmu/src/widgets/progressHUD.dart';
import 'package:flutter/material.dart';

class LogInPagePrueba extends StatefulWidget {
  @override
  _LogInPagePruebaState createState() => _LogInPagePruebaState();
}

class _LogInPagePruebaState extends State<LogInPagePrueba> {
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
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30, top: 10),
                            child: Image(
                                image: AssetImage('assets/CMU.png'),
                                width:
                                    350), //MediaQuery.of(context).size.width * 0.5
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0x31807F7F),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: new TextFormField(
                              onSaved: (input) =>
                                  loginRequestModel.matricula = input,
                              validator: (input) => input.length < 5
                                  ? "Revisa tu matricula"
                                  : null,
                              decoration: new InputDecoration(
                                hintText: "Matricula",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Color(0xffEF6C00),
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0x31807F7F),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: new TextFormField(
                              obscureText: true,
                              autocorrect: false,
                              onSaved: (input) =>
                                  loginRequestModel.password = input,
                              validator: (input) => input.length < 3
                                  ? "Revisa tu password"
                                  : null,
                              decoration: new InputDecoration(
                                hintText: "Password",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color(0xffEF6C00),
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 38),
                          MaterialButton(
                            color: Color(0xffEF6C00),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 88),
                            onPressed: () {
                              if (validateAndSave()) {
                                print(loginRequestModel.toJson());

                                setState(() {
                                  isApiCallProcess = true;
                                });

                                APIService apiService = new APIService();
                                apiService
                                    .login(loginRequestModel)
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });

                                    if (value.token.isNotEmpty) {
                                      final snackBar = SnackBar(
                                          content: Text("Login Successful"));
                                      scaffoldkey.currentState
                                          .showSnackBar(snackBar);

                                      Navigator.pushReplacementNamed(
                                          context, 'HomeAlumnos');
                                    } else {
                                      final snackBar = SnackBar(
                                          content: Text("Existio un error"));
                                      scaffoldkey.currentState
                                          .showSnackBar(snackBar);
                                    }
                                  }
                                });
                              }
                            },
                            child: Text(
                              "Ingresar",
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: StadiumBorder(),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ));
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
