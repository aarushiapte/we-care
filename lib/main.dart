import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_care/AuthService.dart';
import 'package:we_care/LoginPage.dart';
import 'package:we_care/SignUpMember.dart';
import 'package:we_care/SplashScreen.dart';

import 'HomePage.dart';
import 'SignUpVolunteer.dart';

class WeCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: AuthService().handleAuth(),
      //   //Scaffold(
      // //   appBar: AppBar(
      // //     title: Text('We Care'),
      // //   ),
      // //   body: Center(
      // //     child: Container(
      // //       child: Text('Home Page'),
      // //     ),
      // //   ),
      // // ),
      // initialRoute: SplashScreen.id,
      // routes: {
      //   SplashScreen.id: (context) => SplashScreen(),
      //   LoginPage.id: (context) => LoginPage(),
      //   'SignUpMember': (context) => SignUpMember(),
      //   'SignUpVolunteer': (context) => SignUpVolunteer(),
      //   'HomePage': (context) => HomePage()
      // },
    );
  }
}
