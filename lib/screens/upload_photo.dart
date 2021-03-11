import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:wasteagram/main.dart';

class CameraScreen extends StatefulWidget {
  static const routeName = 'camera_screen';

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  //add error handing, don't allow permission
  File image;
  final picker = ImagePicker();

  //Capture photo
  void receiveImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);
    setState(() {});
    pushLogForm(context, image);
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
