import 'package:flutter/material.dart';

class WasteEntry {
  String? shortdate;
  String? imageURL;
  String? items;
  double? latitude;
  double? longitude;

  WasteEntry(
      {required this.shortdate,
      required this.imageURL,
      required this.items,
      required this.latitude,
      required this.longitude});

  String? getshortdate() => shortdate;
  String? getimageURL() => imageURL;
  String? getitems() => items;
  double? getlatitude() => latitude;
  double? getlongitude() => longitude;
}
