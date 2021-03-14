import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

//When user clicks on a journal entry width > maxWidth, details of the journal entry will appear
class DetailView extends StatefulWidget {
  static const routeName = 'detail_view';
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final int indexArgument = arguments['index'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('logs')
              .orderBy('date', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Date
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: Text(
                        DateFormat.yMMMMEEEEd().format(
                            snapshot.data.docs[indexArgument]['date'].toDate()),
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                    )),
                //Picture
                Expanded(
                  flex: 3,
                  child:
                      Image.network(snapshot.data.docs[indexArgument]['photo']),
                ),
                //Number of Items
                Expanded(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Text(
                        snapshot.data.docs[indexArgument]['numberOfItems']
                                .toString() +
                            " items",
                        style: Theme.of(context).textTheme.headline5,
                      )),
                ),
                //Latitude and longitude
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                          "Location: (" +
                              snapshot.data.docs[indexArgument]['coordinates']
                                  .latitude
                                  .toString() +
                              ", " +
                              snapshot.data.docs[indexArgument]['coordinates']
                                  .longitude
                                  .toString() +
                              ")",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center),
                    )),
              ],
            ));
          }),
    );
  }
}
