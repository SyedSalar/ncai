import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ncai/viewimage.dart';

import 'home.dart';

class MySignUp extends StatefulWidget {
  static String id = 'signup';

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool otpVisibility = false;
  String verificationID = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Login'),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("myimages/agriculture_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        //
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                    labelText: "Phone number",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                child: TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                      labelText: '6-Digit OTP',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  keyboardType: TextInputType.number,
                ),
                visible: otpVisibility,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (otpVisibility) {
                      //ToDo: signIn
                      signIn();
                    } else {
                      //Todo: verify
                      verifyPhone();
                    }
                  },
                  child: Text(otpVisibility ? "Verify" : "Login")),
            ],
          ),
        ),
      ),
    );
  }

  void verifyPhone() async {
    await auth.verifyPhoneNumber(
      timeout: const Duration(minutes: 2),
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
          Fluttertoast.showToast(
              msg: "You are logged in successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyHomePage()));
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        Fluttertoast.showToast(
            msg: "Login Failed! Please enter number like +923331234567",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void signIn() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) {
      print("You are logged in successfully");
      Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }
}
