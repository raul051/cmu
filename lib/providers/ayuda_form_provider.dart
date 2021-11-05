import 'package:flutter/material.dart';

class AyudaFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  String ubicacion = '';
  String malestar = '';
  String idalumno = '';

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
