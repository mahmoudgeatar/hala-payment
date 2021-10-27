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
  GlobalKey<ScaffoldState> registerScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> registerGlobalKey = GlobalKey<FormState>();



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


  registerFunction(context) async {
    try {
      await _registerServices.registerMethod(
        userNameController.text,emailController.text,passwordController.text,dropDownIntValue
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
        }else{
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
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }


}