import 'package:flutter/material.dart';

class ResgistroFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

    String  matricula   = '';
    String  password    = '';   
    String  nombre      = '';       
    String  amaterno   = '';  
    String  apatern    = '';   
    String  genero      = '';    
    String  correo      = '';     
    String  idcarrera  = ''; 

  bool isValidForm(){


    return formkey.currentState?.validate() ?? false;
  }

}