import 'package:flutter/material.dart';
import 'package:hala/provider/login_provider.dart';
import 'package:hala/provider/main_provider.dart';
import 'package:hala/provider/register_provider.dart';
import 'package:hala/ui/login_Screen.dart';
import 'package:hala/ui/register_screen.dart';
import 'package:provider/provider.dart';

import 'provider/home_provider.dart';
import 'ui/home_screen.dart';
import 'ui/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
        ChangeNotifierProvider(create: (_) => LogInProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hala Payment',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Splash(),
      ),
    );
  }
}
