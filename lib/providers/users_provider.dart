import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;


class _UsersProvider {

  List<dynamic> usuarios = [];

  _UsersProvider(){
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {

    final resp = await rootBundle.loadString('data/users.json');
    
    Map dataMap = json.decode(resp);
    usuarios = dataMap['usuarios'];

    return usuarios;

  }
}

final usersProvider = new _UsersProvider();