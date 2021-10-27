
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hala/provider/login_provider.dart';
import 'package:hala/provider/main_provider.dart';
import 'package:hala/statics/color.dart';
import 'package:hala/widgets/logo.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';
import 'login_Screen.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final mainProvider=Provider.of<MainProvider>(context,listen: false);
      final loginProvider=Provider.of<LogInProvider>(context,listen: false);
      loginProvider.getData();
      Timer(
          Duration(seconds: 3),
              () => mainProvider.finalNavigation(context,
                  loginProvider.token==null?LogInScreen():HomeScreen()
          ));
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10)),
              child: Logo(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width / 2.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
