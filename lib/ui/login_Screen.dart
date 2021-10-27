import 'package:flutter/material.dart';
import 'package:hala/provider/login_provider.dart';
import 'package:hala/provider/main_provider.dart';
import 'package:hala/statics/color.dart';
import 'package:hala/ui/home_screen.dart';
import 'package:hala/ui/register_screen.dart';
import 'package:hala/widgets/custom_button.dart';
import 'package:hala/widgets/custom_text.dart';
import 'package:hala/widgets/leading_widget.dart';
import 'package:hala/widgets/logo.dart';
import 'package:hala/widgets/text_feild.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LogInProvider>(context, listen: false);
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    print(loginProvider.token);
    return Scaffold(
      key: loginProvider.loginScaffoldKey,
      body: Form(
        key: loginProvider.loginGlobalKey,
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
                    ),
                    SizedBox(height: 30),
                  loginProvider.login==false?  CustomButton(
                      text: "دخول",
                      callback: () {
                        if(loginProvider.loginGlobalKey.currentState.validate()){
                          loginProvider.loginFunction(context);
                        }
                      },
                    ):LoadingWidget(),
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
    );
  }
}
