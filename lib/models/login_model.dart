class LoginResponseModel {
  final String token;
  final bool error;

  LoginResponseModel({this.token, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      //error: json["error"] != false ? json["error"] : true,
    );
  }
}

class LoginRequestModel {
  String matricula;
  String password;

  LoginRequestModel({
    this.matricula,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'matricula': matricula.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
