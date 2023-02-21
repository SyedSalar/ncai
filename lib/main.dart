import 'dart:async';
import 'package:flutter_launcher_icons/android.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ncai/home.dart';
import 'package:ncai/signup.dart';
import 'package:ncai/splashscreen.dart';
import 'package:ncai/viewimage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   );
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
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
    return MaterialApp(
      // initialRoute: FirebaseAuth.instance.currentUser == null
      //     ? MySplashScreen.id
      //     : MySplashScreen.id,
      routes: {
        MySplashScreen.id: (context) => MySplashScreen(),
        MySignUp.id: (context) => MySignUp(),
        MyHomePage.id: (context) => MyHomePage(),
        MyImage.id: (context) => MyImage(),
      },
      title: 'NCAI APP',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MySplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
