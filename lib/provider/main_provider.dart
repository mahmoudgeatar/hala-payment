import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hala/ui/home_screen.dart';
import 'package:hala/ui/login_Screen.dart';

class MainProvider extends ChangeNotifier{


//handel navigation
  navigationFunction(context, Widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Widget;
      }),
    );
  }

//handel replacement navigation
  finalNavigation(context, Widget) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Widget),
            (Route<dynamic> route) => false);
  }


}