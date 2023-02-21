import 'package:flutter/material.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:ncai/home.dart';

import 'drawer.dart';

class MyImage extends StatelessWidget {
  String a = '', b = '';

  static String id = 'viewimage';
  @override
  Widget build(BuildContext context) {
    a = 'gs://esp32cam-device.appspot.com/RecentData/recentPhoto.jpg';
    b = 'gs://esp32cam-device.appspot.com/data/recentphoto.jpg';
    // TODO: implement build
    return (Scaffold(
        appBar: AppBar(
          title: Text('Recent Photos'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("myimages/splash_bg.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 420,
                        width: 420,
                        child: Column(
                          children: [
                            Image(
                              image: FirebaseImage(a),
                              // Works with standard parameters, e.g.
                              fit: BoxFit.fitWidth,

                              // ... etc.
                            ),
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  time,
                                  style: TextStyle(
                                      backgroundColor: Colors.black,
                                      fontSize: 10,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 420,
                          width: 420,
                          child: Column(children: [
                            Image(image: FirebaseImage(b)
                                // Works with standard parameters, e.g.

                                // ... etc.
                                ),
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  time1,
                                  style: TextStyle(
                                      backgroundColor: Colors.black,
                                      fontSize: 10,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ]))
                    ]))))));
  }
}
