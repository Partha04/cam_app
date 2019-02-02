import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(new MaterialApp(
      title: "Furniture",
      debugShowCheckedModeBanner: false,
      home: new Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
 File _image;

 Future getImage() async{
   var image=await ImagePicker.pickImage(source: ImageSource.camera,maxHeight: 500.0,maxWidth: 300.0);
   setState(() {
    _image=image; 
   });
 }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: new Center(
        child: _image==null?new Text("no image"):new Image.file(_image),
      ),
      
      floatingActionButton:new FloatingActionButton(onPressed: getImage,tooltip: 'pick image',child: Icon(Icons.camera),),
     
    );
  }
}

