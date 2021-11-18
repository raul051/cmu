import 'package:cmu/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String linkApi =
        "http://cmu-backend-dev.us-west-1.elasticbeanstalk.com/api/v1/auth/login";

    final response =
        await http.post(Uri.parse(linkApi), body: requestModel.toJson());
    return LoginResponseModel.fromJson(json.decode(response.body));
    /*if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error al cargar la data");
    }*/
  }
}
