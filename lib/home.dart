import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:ncai/drawer.dart';
import 'package:ncai/viewimage.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MyHomePage extends StatefulWidget {
  static String id = 'home';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String a = '';

  @override
  Widget build(BuildContext context) {
    a = 'gs://esp32cam-device.appspot.com/RecentData/recentPhoto.jpg';

// Get metadata properties

    return Scaffold(
        drawer: Drawer(
          child: MyDrawer(),
        ),
        appBar: AppBar(
          title: Text('NCAI APP'),
        ),
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("myimages/splash_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Center(
                  child: Column(children: [
                    SizedBox(
                      height: 300,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.green,
                          ),
                          onPressed: (() {
                            setState(() {
                              Time();
                              String i = '', newimg = '';

                              // for (i in allimg) {
                              //   newimg =
                              //       'gs://esp32cam-device.appspot.com/data/$allimg[i]';
                              // }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyImage(),
                                  ));
                            });
                          }),
                          child: Text('Recent Photos')),
                    ),
                  ]),
                  // Image(
                  //   image: FirebaseImage(a),
                  //   // Works with standard parameters, e.g.
                  //   fit: BoxFit.fitWidth,
                  //   width: 400, height: 400,
                  //   // ... etc.
                  // ),

                  // Text(time)
                )
              ],
            )));
  }

  Future<void> Time() async {
    final storageRef = FirebaseStorage.instance.ref();
    final forestRef = await storageRef.child("data/").listAll();
    final forestRef2 = storageRef.child("RecentData/recentPhoto.jpg");
    final forestRef1 = storageRef.child("data/recentphoto.jpg");
    final metadata = await forestRef2.getMetadata();
    final metadata1 = await forestRef1.getMetadata();

    time = metadata.timeCreated.toString();
    print(time);
    time1 = metadata1.timeCreated.toString();
    print(time1);
  }
}
