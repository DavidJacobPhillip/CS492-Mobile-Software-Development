import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'new_waste_screen.dart';
import '../services/location_services.dart';
import '../services/photo_storage_service.dart';
import '../screens/waste_detail_screen.dart';
import '../models/food_waste_post.dart';

class WasteListScreen extends StatefulWidget {
  const WasteListScreen({Key? key}) : super(key: key);

  @override
  State<WasteListScreen> createState() => _WasteListScreenState();
}

class _WasteListScreenState extends State<WasteListScreen> {

  
  var wasteEntry;
  int itemCount = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wasteagram - ${itemCount}'),
        ),
        body: SafeArea(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('wasteposts')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData &&
                      snapshot.data!.docs != null &&
                      snapshot.data!.docs.length > 0) {
                    itemCount = 0;
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var post = snapshot.data!.docs[index];
                          addEntries(post);
                          itemCount =
                              itemCount + int.parse(wasteEntry.getitems());
                          return ListTile(
                              title: Text(post['longdate']),
                              trailing: Text(post['items'],
                                  style: TextStyle(fontSize: 18)),
                              onTap: () {
                                Semantics(
                                  button: true,
                                  enabled: true,
                                  onTap: () {
                                    print('Select this Wasteagram Post!');
                                  },
                                );
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => WasteScreenDetail(
                                          shortdate: wasteEntry.getshortdate(),
                                          imageURL: wasteEntry.getimageURL(),
                                          items: wasteEntry.getitems(),
                                          latitude: wasteEntry.getlatitude(),
                                          longitude: wasteEntry.getlongitude(),
                                        )));
                              });
                        });
                        
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })
          ),
        floatingActionButton: addPhotoButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  Widget addPhotoButton(BuildContext context) {
    return Semantics(
        button: true,
        enabled: true,
        onTap: () {
          print('Add photo button!');
        },
        child: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => NewWasteScreen()))
                .then((_) {});
          },
        ));
  }

  void addEntries(post) {
    wasteEntry = WasteEntry(
      shortdate: post['shortdate'],
      imageURL: post['imageURL'],
      items: post['items'],
      latitude: post['latitude'],
      longitude: post['longitude'],
    );
  }
}
