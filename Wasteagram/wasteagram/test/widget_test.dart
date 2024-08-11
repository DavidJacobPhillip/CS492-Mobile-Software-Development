import 'package:test/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/services/platform_channel.dart';

import '../lib/models/food_waste_post.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  test('Post created should have appropriate property values', () {
    String shortdate = "DATE";
    String imageURL = "URL";
    String items = "5";
    double latitude = 1.0;
    double longitude = 2.0;

    var wasteEntry = WasteEntry(
      shortdate: shortdate,
      imageURL: imageURL,
      items: items,
      latitude: latitude,
      longitude: longitude,
    );

    expect(shortdate, wasteEntry.shortdate);
    expect(imageURL, wasteEntry.imageURL);
    expect(items, wasteEntry.items);
    expect(latitude, wasteEntry.latitude);
    expect(longitude, wasteEntry.longitude);
  });

  test('Post created should have more appropriate property values', () {
    String shortdate = "DATE TWO";
    String imageURL = "URL2";
    String items = "5";
    double latitude = 6.0;
    double longitude = -1.0;

    var wasteEntry = WasteEntry(
      shortdate: shortdate,
      imageURL: imageURL,
      items: items,
      latitude: latitude,
      longitude: longitude,
    );

    expect(shortdate, wasteEntry.shortdate);
    expect(imageURL, wasteEntry.imageURL);
    expect(items, wasteEntry.items);
    expect(latitude, wasteEntry.latitude);
    expect(longitude, wasteEntry.longitude);
  });

  
}
