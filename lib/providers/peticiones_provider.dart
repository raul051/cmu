import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _PeticionesProvider {
  List<dynamic> usuarios = [];

  _PeticionesProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/peticiones.json');

    Map dataMap = json.decode(resp);
    usuarios = dataMap['peticiones'];

    return usuarios;
  }
}

final usersProvider = new _PeticionesProvider();
