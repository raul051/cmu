import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

    String email = '';
    String password = '';

  bool isValidForm(){


    return formkey.currentState?.validate() ?? false;
  }

}