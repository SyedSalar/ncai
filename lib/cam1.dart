import 'package:flutter/material.dart';
import 'package:ncai/drawer.dart';

class MyCam1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
        appBar: AppBar(
          title: Text('Camera 1'),
        ),
        drawer: Drawer(child: MyDrawer()),
        body: imagebuilder()));
  }
}
