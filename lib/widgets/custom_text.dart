import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final String text;
  final TextAlign align;
  final double size;
  final Color color;
  final FontWeight wight;
  final String fontFamily;
  CustomText({this.text,this.align=TextAlign.center,this.size,this.color,this.wight=FontWeight.normal,this.fontFamily="din"});

  @override
  Widget build(BuildContext context) {


    return Text(
      text,
      textAlign: align,
      style: TextStyle(fontSize: size, color: color,fontWeight: wight,fontFamily: fontFamily),
    );
  }
}
