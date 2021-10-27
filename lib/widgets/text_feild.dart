import 'package:flutter/material.dart';
import 'package:hala/provider/login_provider.dart';
import 'package:hala/statics/color.dart';
import 'package:provider/provider.dart';

class CusomTextFeild extends StatelessWidget {
  String hintText;
  TextInputType ketBoardType;
  TextEditingController controller;
  Function changed;
  IconData icon;
  bool password;
  CusomTextFeild({
    this.hintText,
    this.icon,
    this.password,
    this.ketBoardType,
    this.controller,
    this.changed,
  });

  String errorName(String str) {
    switch (hintText) {
      case "mail@gmail.com":
        return "Enter userName";
      case "*********************":
        return "Enter Password";
      case "fullName":
        return "Enter $hintText";
      case "usermail@gmail.com":
        return "Enter $hintText";
      case "password":
        return "Enter $hintText";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        child: Consumer<LogInProvider>(
          builder: (context, state, widget) {
            return TextFormField(
              showCursor: true,
              cursorColor: purple,
              onChanged: changed,
              controller: controller,
              validator: (value) {
                if (value.isEmpty) {
                  return errorName(hintText);
                }
                return null;
              },
              keyboardType: ketBoardType,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: darkGray),
              decoration: InputDecoration(

                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: purple,
                    width: 1.0,
                  ),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: purple,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: purple,
                    width: 1.0,
                  ),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: lightGray,
                ),
                suffixIcon: password == false ? null : obscureButton(state),
              ),
              obscureText:
                  hintText == "*********************" ? state.obscurePassword : false,
            );
          },
        ),
      ),
    );
  }

  GestureDetector obscureButton(LogInProvider state) {
    return GestureDetector(
      onTap: () {
        state.showPassword();
      },
      child: Icon(
        state.obscurePassword
            ? Icons.remove_red_eye
            : Icons.remove_red_eye_outlined,
        color: purple,
      ),
    );
  }
}
