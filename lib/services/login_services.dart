import 'dart:convert';

import 'package:hala/model/login_model.dart';
import 'package:hala/statics/base_url.dart';
import 'package:http/http.dart' as http;


class LoginService{
  var loginInfo;

  Future<LoginModel> registerMethod(email, password) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final msg = jsonEncode({
      "email": email.toString(),
      "password": password.toString(),
    });

    loginInfo = await http.post(
      "$baseUrl/User/Login",
      body: msg,
      headers: headers,
    );
    print(loginInfo.body);
  }
}