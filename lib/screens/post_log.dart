import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

//Journal Entry Form
class PostLog extends StatefulWidget {
  static const routeName = 'post_log';

  @override
  _PostLogState createState() => _PostLogState();
}

//Fill in Journal Entries
class _PostLogState extends State<PostLog> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              DateFormat.yMMMMEEEEd().format(document['date'].toDate()),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                // color: Color(0xffddddff),
                ),
            // padding: const EdgeInsets.all(10.0),
            child: Text(
              document['numberOfItems'].toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
      onTap: () {
        print("should display detail view");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New posts!'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('logs').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading');
            return ListView.builder(
                itemExtent: 80.0,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data.docs[index]));
          }),
    );
  }
}
