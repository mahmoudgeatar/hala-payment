import 'package:flutter/material.dart';
import 'package:hala/provider/register_provider.dart';
import 'package:hala/statics/color.dart';
import 'package:hala/widgets/custom_button.dart';
import 'package:hala/widgets/custom_text.dart';
import 'package:hala/widgets/leading_widget.dart';
import 'package:hala/widgets/logo.dart';
import 'package:hala/widgets/text_feild.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<ScaffoldState> _registerScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _registerGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context, listen: true);
    return Scaffold(
    key: _registerScaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: registerProvider.registred,
        color: purple,
        child: Form(
         key: _registerGlobalKey,
          child: ListView(
            children: [
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
                            "الاسم بالكامل",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 16, color: darkGray),
                          )),
                      CusomTextFeild(
                        hintText: "fullName",
                        password: false,
                        controller: registerProvider.userNameController,
                        changed: (value){
                          registerProvider.changeName(value);
                        },
                      ),
                      Container(
                          width: double.infinity,
                          child: Text(
                            "أدخل الايميل",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 16, color: darkGray),
                          )),
                      CusomTextFeild(
                        hintText: "usermail@gmail.com",
                        password: false,
                        controller: registerProvider.emailController,
                        changed: (value){
                          registerProvider.changeEmail(value);
                        },
                      ),
                      Container(
                          width: double.infinity,
                          child: Text(
                            "كلمة المرور",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 16, color: darkGray),
                          )),
                      CusomTextFeild(
                        hintText: "password",
                        password: false,
                        controller: registerProvider.passwordController,
                        changed: (value){
                          registerProvider.changepassword(value);
                        },
                      ),
                      SizedBox(height: 30),
                      Container(
                          width: double.infinity,
                          child: Text(
                            "اختر نوع الحساب",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 16, color: darkGray),
                          )),
                      dropDownReason(context, registerProvider),
                      SizedBox(height: 40),
                      CustomButton(
                        text: "تسجيل حساب جديد",
                        callback: () {

                          if (_registerGlobalKey.currentState
                              .validate()) {
                            registerProvider.registerFunction(context,_registerScaffoldKey);
                          } else {
                            _registerScaffoldKey.currentState
                                .showSnackBar(SnackBar(
                              backgroundColor: purple,
                              content: CustomText(
                                text: "برجاء اكمل البيانات",
                              ),
                            ));
                          }
                        },
                      ),
                      SizedBox(height: 40),
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

  Widget dropDownReason(BuildContext context, RegisterProvider state) {
    return state.roleList.isEmpty
        ? LoadingWidget()
        : Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: purple, width: 1),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: DropdownButton<String>(
                underline: SizedBox(),
                isExpanded: true,
                value: state.dropDownIntValue,
                icon: Icon(Icons.arrow_drop_down_circle_outlined),
                onChanged: (value) {
                  state.dropDownChanger(value);
                },
                items: state.roles.dateSet.map((user) {
                  return DropdownMenuItem<String>(
                    value: user,
                    child: CustomText(
                      text: user,
                    ),
                  );
                }).toList(),
              ),
            ),
          );
  }
}
