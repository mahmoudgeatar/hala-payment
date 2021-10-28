import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hala/model/login_model.dart';
import 'package:hala/services/login_services.dart';
import 'package:hala/statics/color.dart';
import 'package:hala/ui/home_screen.dart';
import 'package:hala/widgets/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_provider.dart';

class LogInProvider extends ChangeNotifier{

  LogInProvider(){
    this.getData();
  }

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  showPassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }


  TextEditingController get userNameController => _userNameController; //logIn textfeild controller
  TextEditingController get passwordController => _passwordController;

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  LoginService _loginServices =LoginService();


  String token;
  String email,password;

  changeEmail(value){
    email=value;
  }
  changePassword(value){
    password=value;
  }




  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool lodedIn=false;
  changeLoaded(value){
    lodedIn=value;
    notifyListeners();
  }

  LoginModel userInfo;

  loginFunction(context,loginScaffoldKey) async {
    changeLoaded(true);
    try {
      await _loginServices.registerMethod(
          email,password
      );
      if (_loginServices.loginInfo.statusCode == 200) {
        var jsonData = _loginServices.loginInfo.body;
        userInfo = LoginModel.fromJson(json.decode(jsonData));
        if(userInfo.dateSet!=null){
          MainProvider mainProvider=MainProvider();
          mainProvider.finalNavigation(context, HomeScreen());
          userNameController.clear();
          passwordController.clear();
          token=userInfo.dateSet.token;
          //saveData();
          lodedIn=false;
        }else{
          lodedIn=false;
          loginScaffoldKey.currentState
              .showSnackBar(SnackBar(
            backgroundColor: purple,
            content: CustomText(
              text: userInfo.responseMessage,
            ),
          ));

        }
        notifyListeners();
      } else {
        lodedIn=false;
        print("errorsss");
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }


// get data from sharedPreferance
  getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if (_pref.getString("token") != null &&
        _pref.getString("token").isNotEmpty) {
      token = _pref.getString("token");
    } else {
      token = "";
    }
    notifyListeners();
  }

// save data from sharedPreferance
  saveData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    _pref.setString("token", userInfo.dateSet.token);

    notifyListeners();
  }

}