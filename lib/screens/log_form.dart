import 'package:flutter/material.dart';
import 'dart:io';
import 'package:wasteagram/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/post_info.dart';
import 'package:flutter/services.dart';
import 'package:wasteagram/models/share_location.dart';
import 'package:wasteagram/share_location_screen.dart';
import 'package:location/location.dart';
import 'package:firebase_storage/firebase_storage.dart';

//Journal Entry Form
class LogForm extends StatefulWidget {
  static const routeName = 'log_form';
  @override
  _LogFormState createState() => _LogFormState();
}

//Fill in Journal Entries
class _LogFormState extends State<LogForm> {
  final formKey = GlobalKey<FormState>();
  final postFields = PostFields(); //Collects all the fields
  // final location = ShareLocationScreen();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  LocationData locationInfo;
  String url;

  //Get location information
  Future<LocationData> getLocation() async {
    Future<LocationData> result = ShareLocation().getLocation();
    locationInfo = await result;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final String url = arguments['url'];
    print(url);

    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Display image
            Expanded(
                flex: 4,
                child: Container(
                    padding: EdgeInsets.all(20.0), child: Image.network(url))),
            //Number of items
            Expanded(
                flex: 1,
                child: Container(
                    margin: const EdgeInsets.only(right: 50, left: 50),
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'Number of wasted items',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        postFields.numberOfItems = int.parse(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the numbero of items';
                        } else {
                          return null;
                        }
                      },
                    ))),
            // SizedBox(height: 5),
            //Upload button
            Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Column(children: [
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                //Update counter in my app
                                formKey.currentState.save();

                                //Update firebase database
                                FirebaseFirestore.instance
                                    .collection('logs')
                                    .add({
                                  'date': DateTime.now(),
                                  'coordinates': GeoPoint(locationInfo.latitude,
                                      locationInfo.longitude),
                                  'numberOfItems': postFields.numberOfItems,
                                  'photo': url,
                                });

                                //When submitted, go back to previous screen
                                pushPostLog(context);
                              }
                            },
                            child: Icon(Icons.cloud_upload)),
                      )
                    ])))
          ],
        ),
      ),
    );
  }
}
