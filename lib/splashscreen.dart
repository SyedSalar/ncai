import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ncai/signup.dart';

import 'home.dart';

class MySplashScreen extends StatefulWidget {
  static String id = 'splashscreen';

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  late StreamSubscription<User?> user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
        Timer(
            Duration(seconds: 3),
            () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MySignUp())));
      } else {
        print('User is signed in!');
        Timer(
            Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MyHomePage())));
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? MySignUp.id
          : MyHomePage.id,
      home: Container(
          color: Colors.white,
          child: Image.asset("myimages/ncai.jpg")) // return (Container(
      //   width: double.infinity,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage("myimages/ncai.jpg"),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   // color: Colors.white,
      // ));
      ,
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
    ));
  }
}
