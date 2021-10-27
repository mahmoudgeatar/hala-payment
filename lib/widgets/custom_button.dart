import 'package:flutter/material.dart';
import 'package:hala/statics/color.dart';


class CustomButton extends StatelessWidget {
  String text;
  final VoidCallback callback;
  CustomButton({@required this.text, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)),
          color: purple,
          splashColor:Theme.of(context).scaffoldBackgroundColor,
          onPressed:
          callback,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: white),
              ),
            ],
          )),
    );
  }
}
