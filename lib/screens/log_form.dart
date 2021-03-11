import 'package:flutter/material.dart';
import 'dart:io';
import 'package:wasteagram/main.dart';

//Journal Entry Form
class LogForm extends StatefulWidget {
  static const routeName = 'log_form';
  @override
  _LogFormState createState() => _LogFormState();
}

//Fill in Journal Entries
class _LogFormState extends State<LogForm> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final File image = arguments['image'];

    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Display image
            Expanded(
                flex: 4,
                child: Container(
                    padding: EdgeInsets.all(20.0), child: Image.file(image))),
            //Number of items
            Expanded(
                flex: 1,
                child: Container(
                    margin: const EdgeInsets.only(right: 100, left: 100),
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Number of items',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        // journalEntryFields.title = value;
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
            Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(children: [
                      ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              //Add date information
                              DateTime today = DateTime.now();
                              String currentDate =
                                  "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

                              //Update counter in my app
                              formKey.currentState.save();

                              //Update database

                              //When submitted, go back to previous screen
                              pushPostLog(context);
                            }
                          },
                          child: Text('Save Entry')),
                      ElevatedButton(
                          onPressed: () => pushPostLog(context),
                          child: Text('Cancel'))
                    ])))
          ],
        ),
      ),
    );
  }
}
