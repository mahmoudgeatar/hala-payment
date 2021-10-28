import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hala/model/role_model.dart';
import 'package:hala/provider/main_provider.dart';
import 'package:hala/services/register_services.dart';
import 'package:hala/statics/color.dart';
import 'package:hala/ui/login_Screen.dart';
import 'package:hala/widgets/custom_text.dart';

class RegisterProvider extends ChangeNotifier{


  RegisterProvider(){
    this.fetchRoles();
  }

  RegisterServices _registerServices =RegisterServices();




  TextEditingController get userNameController => _userNameController; //logIn textfeild controller
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String name,emial,password;

  changeName(value){
    name=value;
  }
  changeEmail(value){
    emial=value;
  }
  changepassword(value){
    password=value;
  }


 RoleModel roles;
  List<String> roleList = [];
  String dropDownIntValue;

  dropDownChanger(String value){
    dropDownIntValue=value;
    notifyListeners();
  }


  fetchRoles() async {
    await _registerServices.getRoles();
    if (_registerServices.roles.statusCode == 200) {
      var jsonData = _registerServices.roles.body;
      roles = RoleModel.fromJson(json.decode(jsonData));
      for(var role in roles.dateSet)
        roleList.add(role);
      dropDownIntValue=roleList[0];
      notifyListeners();
    } else {
      print("Failed to load Data");
      notifyListeners();
    }
    notifyListeners();
  }

  RoleModel registerstionInfo;

  bool registred=false;
  changeRegistred(value){
    registred=value;
    notifyListeners();
  }



  registerFunction(context,registerScaffoldKey) async {
    changeRegistred(true);
    try {
      await _registerServices.registerMethod(
          name,emial,password,dropDownIntValue
      );
      if (_registerServices.register.statusCode == 200) {
        var jsonData = _registerServices.register.body;
        registerstionInfo = RoleModel.fromJson(json.decode(jsonData));
        if(registerstionInfo.dateSet==null){
        MainProvider mainProvider=MainProvider();
        mainProvider.finalNavigation(context, LogInScreen());
        userNameController.clear();
        emailController.clear();
        passwordController.clear();
        registred=false;
        }else{
          registred=false;
          registerScaffoldKey.currentState
              .showSnackBar(SnackBar(
            backgroundColor: purple,
            content: CustomText(
              text: registerstionInfo.dateSet[0],
            ),
          ));
        }
        notifyListeners();
      } else {
        print("errorsss");
        registred=false;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }


}