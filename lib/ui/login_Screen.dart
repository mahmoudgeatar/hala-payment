import 'package:flutter/material.dart';
import 'package:hala/provider/login_provider.dart';
import 'package:hala/provider/main_provider.dart';
import 'package:hala/statics/color.dart';
import 'package:hala/ui/register_screen.dart';
import 'package:hala/widgets/custom_button.dart';
import 'package:hala/widgets/logo.dart';
import 'package:hala/widgets/text_feild.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../statics/color.dart';

class LogInScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _loginScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _loginGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LogInProvider>(context, listen: true);
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      key: _loginScaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: loginProvider.lodedIn,
        color: purple,
        child: Form(
          key: _loginGlobalKey,
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .15,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Logo(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      Container(
                          width: double.infinity,
                          child: Text(
                            "البريد الإلكتروني",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 16, color: darkGray),
                          )),
                      CusomTextFeild(
                        hintText: "mail@gmail.com",
                        password: false,
                        controller: loginProvider.userNameController,
                        changed: (value){
                          loginProvider.changeEmail(value);
                        },
                      ),
                      SizedBox(height: 14),
                      Container(
                          width: double.infinity,
                          child: Text(
                            "كلمة المرور",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 16, color: darkGray),
                          )),
                      CusomTextFeild(
                        hintText: "*********************",
                        password: true,
                        controller: loginProvider.passwordController,
                        changed: (value){
                          loginProvider.changePassword(value);
                        },
                      ),
                      SizedBox(height: 30),
                      CustomButton(
                        text: "دخول",
                        callback: () {
                          if(_loginGlobalKey.currentState.validate()){
                            loginProvider.loginFunction(context,_loginScaffoldKey);
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        text: "تسجيل حساب جديد",
                        callback: () {
                          mainProvider.navigationFunction(
                              context, RegisterScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
