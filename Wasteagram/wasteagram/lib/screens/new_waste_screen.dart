import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:intl/intl.dart';
import '../screens/waste_list_screen.dart';
import '../services/location_services.dart';
import '../services/photo_storage_service.dart';

class NewWasteScreen extends StatefulWidget {
  const NewWasteScreen({Key? key}) : super(key: key);

  @override
  State<NewWasteScreen> createState() => _NewWasteScreenState();
}

class _NewWasteScreenState extends State<NewWasteScreen> {
  // variables to be stored within Firebase
  var locationService;
  LocationData? location;
  File? image;
  String? imageURL;
  final datetime = DateTime.now();
  TextEditingController items = new TextEditingController();

  // variables that help run the class
  final picker = ImagePicker();
  Reference? storageReference;
  UploadTask? uploadTask;


  void initState() {
    super.initState();
    getImageDetails();
  }

  // Gets both the image and the details of its location
  void getImageDetails() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    storageReference = FirebaseStorage.instance
        .ref()
        .child(DateFormat("yyyy-MM-dd hh:mm:ss").format(datetime));
    uploadTask = storageReference!.putFile(image!);
    

    locationService = Location();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
          appBar: AppBar(
            title: const Text('New Post'),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Image.file(image!, height: 300),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
                  child: TextField(
                    controller: items,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: 'Number of Wasted Items',
                      hintStyle: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
              color: Colors.blueGrey,
              child: SizedBox(
                  height: 60,
                  child: Semantics(
                    button: true,
                    enabled: true,
                    onTap: () {
                      print('Upload Post to Wasteagram!');
                    },
                    child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                      ),
                      child: Icon(Icons.cloud_upload, size: 40),
                      onPressed: () {
                        sendData();
                        Navigator.of(context).pop();
                        setState(() {
                          
                        });
                      },
                    )))));
    }
  }

  void sendData() async {
    location = await locationService.getLocation();
    await uploadTask;
    imageURL = await storageReference!.getDownloadURL();

    // Logging output for testing purposes
    // print(imageURL);
    // print("Location: ${location!.latitude}, ${location!.longitude}");
    // print(items.text);
    // print(DateFormat('EEEE').format(datetime) + ', '+ DateFormat('MMMM dd, yyyy').format(datetime));
    // print(DateFormat('E').format(datetime) + ', '+ DateFormat('MMM dd, yyyy').format(datetime));

    FirebaseFirestore.instance
            .collection('wasteposts')
            .add({
              'longdate': DateFormat('EEEE').format(datetime) + ', '+ DateFormat('MMMM dd, yyyy').format(datetime),
              'shortdate': DateFormat('E').format(datetime) + ', '+ DateFormat('MMM dd, yyyy').format(datetime),
              'imageURL': imageURL,
              'items': items.text,
              'latitude': location!.latitude,
              'longitude': location!.longitude
            });
  }
}
