import 'package:flutter/material.dart';
import 'package:footer/footer_view.dart';
import 'package:ncai/drawer.dart';
import 'package:footer/footer.dart';

class MyContact extends StatefulWidget {
  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Contact'),
        ),
        drawer: Drawer(child: MyDrawer()),
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("myimages/splash_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: FooterView(
                children: [
                  Column(children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: 340,
                      color: Colors.green,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ])
                ],
                footer: new Footer(
                  backgroundColor: Colors.green,
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Center(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Container(
                                  height: 45.0,
                                  width: 45.0,
                                  child: Center(
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            25.0), // half of height and width of Image
                                      ),
                                      child: IconButton(
                                        icon: new Icon(
                                          Icons.facebook_outlined,
                                          size: 20.0,
                                        ),
                                        color: Color(0xFF162A49),
                                        onPressed: () {},
                                      ),
                                    ),
                                  )),
                              new Container(
                                  height: 45.0,
                                  width: 45.0,
                                  child: Center(
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            25.0), // half of height and width of Image
                                      ),
                                      child: IconButton(
                                        icon: new Icon(
                                          Icons.whatsapp,
                                          size: 20.0,
                                        ),
                                        color: Color(0xFF162A49),
                                        onPressed: () {},
                                      ),
                                    ),
                                  )),
                              new Container(
                                  height: 45.0,
                                  width: 45.0,
                                  child: Center(
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            25.0), // half of height and width of Image
                                      ),
                                      child: IconButton(
                                        icon: new Icon(
                                          Icons.call,
                                          size: 20.0,
                                        ),
                                        color: Color(0xFF162A49),
                                        onPressed: () {},
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Text(
                          'Copyright ©2022, All Rights Reserved.',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0,
                              color: Color(0xFF162A49)),
                        ),
                        Text(
                          'Powered by NCAI',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0,
                              color: Color(0xFF162A49)),
                        ),
                      ]),
                ))));
  }
}
