import 'package:flutter/material.dart';
import 'package:users_listing/screens/initial_screen.dart';
import 'dart:async';
import 'package:users_listing/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                InitialScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffe4effb),
        child:SizedBox(
            height: 150.0,
            width: 150.0,
            child: Image.asset("assets/images/users_logo.jpg",),),
    );
  }
}

