import 'package:flutter/material.dart';
import 'package:wasteagram/share_location_screen.dart';
import 'package:wasteagram/screens/detail_view.dart';
import 'package:wasteagram/screens/log_form.dart';
import 'package:wasteagram/screens/post_log.dart';
import 'package:wasteagram/screens/upload_photo.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final routes = {
    MyHomePage.routeName: (context) => MyHomePage(),
    PostLog.routeName: (context) => PostLog(),
    // DetailView.routeName: (context) => DetailView(),
    LogForm.routeName: (context) => LogForm(),
    CameraScreen.routeName: (context) => CameraScreen()
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
        routes: routes
        // MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  static const routeName = '/';

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //display stuff
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pushCameraScreen(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

//Route to push to log form
void pushLogForm(BuildContext context, File image) async {
  Navigator.of(context).pushNamed('log_form', arguments: {'image': image});
}

//Route to push to camera screen
void pushCameraScreen(BuildContext context) async {
  Navigator.of(context).pushNamed('camera_screen');
}

//Route to push to detail view
void pushDetailView(BuildContext context) async {
  Navigator.of(context).pushNamed('detail_view');
}

//Route to push to detail view
void pushPostLog(BuildContext context) async {
  Navigator.of(context).pushNamed('post_log');
}
