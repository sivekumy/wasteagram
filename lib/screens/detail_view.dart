import 'package:flutter/material.dart';

//When user clicks on a journal entry width > maxWidth, details of the journal entry will appear
class DetailView extends StatefulWidget {
  static const routeName = 'detail_view';
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  // Journal journal;

  // @override
  // void initState() {
  //   super.initState();
  //   getJournalEntries();
  // }

  // //Retrieves journal entries
  // Future<List> getJournalEntries() async {
  //   Future<List> result = DatabaseHelper().loadJournal();
  //   List journalEntries = await result;

  //   setState(() {
  //     journal = Journal(entries: journalEntries);
  //   });

  //   return result;
  // }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final int indexArgument = arguments['index'];
    //Displays details of each journal entry when tapped
    //Details include journal entry #, title, body, date, and rating
    // return FutureBuilder<List>(
    //     future: getJournalEntries(),
    //     builder: (context, AsyncSnapshot<List> snapshot) {
    //       if (snapshot.hasData) {
    //         return Scaffold(
    //             appBar: AppBar(
    //               title: Row(children: <Widget>[
    //                 IconButton(
    //                   icon: Icon(Icons.arrow_back),
    //                   onPressed: () {
    //                     Navigator.of(context).pop();
    //                   },
    //                 ),
    //                 Expanded(child: Text('Journal Entry ${indexArgument + 1}')),
    //               ]),
    //             ),
    //             endDrawer: Drawer(
    //               child: ListView(
    //                 padding: EdgeInsets.zero,
    //                 children: <Widget>[
    //                   Container(
    //                       height: 90,
    //                       child: DrawerHeader(
    //                         decoration: BoxDecoration(color: Colors.blue),
    //                         child: Text(
    //                           'Settings',
    //                           style: TextStyle(
    //                             color: Colors.white,
    //                             fontSize: 20,
    //                           ),
    //                         ),
    //                       )),
    //                   SwitchListTile(
    //                     title: Text('Dark Mode'),
    //                     value: MyApp.of(context).darkTheme,
    //                     onChanged: MyApp.of(context).toggleTheme,
    //                     // value: notifier.darkTheme,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             body: SingleChildScrollView(
    //                 child: Column(mainAxisSize: MainAxisSize.min, children: [
    //               ListTile(
    //                 title: Text('Title: ${snapshot.data[indexArgument].title}'),
    //                 subtitle:
    //                     Text('Body: ${snapshot.data[indexArgument].body}\n'
    //                         'Date: ${snapshot.data[indexArgument].date}\n'
    //                         'Rating: ${snapshot.data[indexArgument].rating}'),
    //               )
    //             ])));
    //       } else {
    //         //if data not received, circular progress indicator is displayed
    //         return CircularProgressIndicator();
    //       }
    //     }

    // );
  }
}
