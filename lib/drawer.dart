import 'package:firebase_image/firebase_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ncai/about.dart';
import 'package:ncai/cam1.dart';
import 'package:ncai/contact.dart';
import 'package:ncai/footer.dart';
import 'package:ncai/home.dart';
import 'package:ncai/signup.dart';

String time = '', time1 = '';
List<String> allimg = [], imgpath = [];

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('myimages/agriculture_bg.jpg'),
                opacity: 0.5,
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            ListTile(
              tileColor: Colors.black,
              textColor: Colors.white,
              iconColor: Colors.green,
              onTap: () {
                setState(() {
                  MetaData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ));
                });
              },
              title: Text('Home Page'),
              leading: Icon(
                Icons.home,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              tileColor: Colors.black,
              textColor: Colors.white,
              iconColor: Colors.green,
              onTap: () {
                setState(() {
                  MetaData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCam1(),
                      ));
                });
              },
              title: Text('Camera1'),
              leading: Icon(
                Icons.camera_alt,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              tileColor: Colors.black,
              textColor: Colors.white,
              iconColor: Colors.green,
              onTap: () {
                setState(() {
                  MetaData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCam1(),
                      ));
                });
              },
              title: Text('Camera2'),
              leading: Icon(
                Icons.camera_alt,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              tileColor: Colors.black,
              textColor: Colors.white,
              iconColor: Colors.green,
              onTap: () {
                setState(() {
                  MetaData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCam1(),
                      ));
                });
              },
              title: Text('Camera3'),
              leading: Icon(
                Icons.camera_alt,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              tileColor: Colors.black,
              textColor: Colors.white,
              iconColor: Colors.green,
              title: Text('About'),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyAbout(),
                    ));
              },
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              tileColor: Colors.black,
              textColor: Colors.white,
              iconColor: Colors.green,
              title: Text('Contact Us'),
              leading: Icon(Icons.phone),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyContact(),
                    ));
              },
            ),
            Divider(),
            ListTile(
              tileColor: Colors.black,
              textColor: Colors.white,
              iconColor: Colors.green,
              title: Text('Log Out'),
              leading: Icon(Icons.logout_sharp),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MySignUp(),
                    ));
              },
            )
          ],
        )));
  }
}

MetaData() async {
  final storageRef = FirebaseStorage.instance.ref();
  final forestRef = await storageRef.child("data/").listAll();

  for (var item in forestRef.items) {
    allimg.add(item.toString());
  }

  for (int i = 0; i < allimg.length; allimg.length) {
    imgpath.add(allimg[i].substring(36, 50));

    i++;
  }
  print(imgpath.length);
}

Widget imagebuilder() {
  return ListView.builder(
    itemBuilder: (context, itemcount) {
      return InkWell(
        child: Container(
          height: 500,
          width: 500,
          child: Column(
            children: [
              Image(
                  image: FirebaseImage(
                      'gs://esp32cam-device.appspot.com/${imgpath[itemcount]}'))
            ],
          ),
        ),
      );
    },
    itemCount: imgpath.length,
  );
}
