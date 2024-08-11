import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/waste_list_screen.dart';

/*

IGNORE THIS FILE: USED SIMPLY FOR TESTING CAMERA SERVICES

*/

class WastePhoto extends StatefulWidget {
  
  WastePhoto({Key? key}) : super(key: key);

  @override
  State<WastePhoto> createState() => _WastePhotoState();
}

class _WastePhotoState extends State<WastePhoto> {
  File? image;
  final picker = ImagePicker();

  

  void getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Center(
          child: ElevatedButton(
              child: Text("Selected Photo"),
              onPressed: () {
                getImage();
              }));
    } else {
      return Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Image.file(image!),
        SizedBox(height: 40),
        ElevatedButton(
          child: Text('Post It!'),
          onPressed: () {
            Navigator.of(context)
                .push(
                    MaterialPageRoute(builder: (context) => WasteListScreen()))
                .then((_) {});
          },
        )
      ]));
    }
  }
}
