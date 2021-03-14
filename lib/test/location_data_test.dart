import 'package:wasteagram/models/share_location.dart';
import 'package:test/test.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  //Test for ShareLocation class, verifies if location data is being returned
  WidgetsFlutterBinding.ensureInitialized();

  test('Location is retrieved', () async {
    //Get location information
    LocationData locationInfo;

    //Get location information
    Future<void> getLocation() async {
      Future<LocationData> result = ShareLocation().getLocation();
      locationInfo = await result;
    }

    await getLocation();
    expect(locationInfo, isA<LocationData>());
  });
}
