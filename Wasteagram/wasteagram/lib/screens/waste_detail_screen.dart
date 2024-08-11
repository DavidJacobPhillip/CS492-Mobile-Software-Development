import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../services/location_services.dart';


class WasteScreenDetail extends StatelessWidget {
  String? shortdate;
  String? imageURL;
  String? items;
  double? latitude;
  double? longitude;

  WasteScreenDetail({Key? key, 
    required this.shortdate, 
    required this.imageURL,
    required this.items,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wastegram'),
      ),
      body: Center(child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 80),
            child: Text(shortdate!, style: TextStyle(fontSize: 25)) 
          ),
          Image.network(
            imageURL!,
            fit: BoxFit.fitWidth,
            height: 300
          ),
          Padding(
            padding: EdgeInsets.only(top: 80, bottom: 130),
            child: Text("Items: ${items!}", style: TextStyle(fontSize: 30)) 
          ),
          Text("Location: (${latitude}, ${longitude})", style: TextStyle(fontSize: 13)),

        ],
      ),
    ));
  }
}
