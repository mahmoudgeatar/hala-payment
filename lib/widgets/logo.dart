import 'package:flutter/material.dart';
class Logo extends StatelessWidget {
  final double width,height;
  Logo({this.width,this.height});
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/logo.png",
      height: height,
      width: width,
    );
  }
}
