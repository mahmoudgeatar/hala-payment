import 'dart:convert';

import 'package:hala/model/role_model.dart';
import 'package:hala/statics/base_url.dart';
import 'package:http/http.dart' as http;

class RegisterServices {
  var roles;
  var register;

  // Future<Register> registerMedthod({var firstName,var middleName,var lastName,var email}) async {
  //   register = await http.post(
  //     '$apiKeyConst/api/authentication/register',
  //     body: {
  //       "FirstName":firstName,
  //       "MiddleName":middleName,
  //       "LastName":lastName,
  //       "Email":email,
  //       "Language":"en"
  //     },
  //   );
  // }

  Future<RoleModel> getRoles() async {
    roles = await http.get('$baseUrl/User/GetRoles');
  }

  Future<RoleModel> registerMethod(name, email, password, role) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final msg = jsonEncode({
      "fullName": name.toString(),
      "email": email.toString(),
      "password": password.toString(),
      "roles": [role]
    });
    register = await http.post(
      "$baseUrl/User/RegisterUser",
      body: msg,
      headers: headers,
    );
  }
}
