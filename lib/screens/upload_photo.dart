import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:wasteagram/main.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CameraScreen extends StatefulWidget {
  static const routeName = 'camera_screen';

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  //add error handing, don't allow permission
  String url;
  File image;
  final picker = ImagePicker();

  //Capture photo & get url
  void receiveImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    image = File(pickedFile.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('Photo' + '${DateTime.now()}' + '.jpg');
    UploadTask uploadTask = ref.putFile(image);
    uploadTask.whenComplete(() async {
      url = await ref.getDownloadURL();
      setState(() {});
      pushLogForm(context, url);
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void initState() {
    receiveImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return SizedBox(
          child: CircularProgressIndicator(), height: 10.0, width: 10.0);
    } else {
      return SizedBox();
    }
  }
}
