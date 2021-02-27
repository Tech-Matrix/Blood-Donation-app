// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDets extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final String uid = auth.currentUser.uid.toString();

    return snapshot.data.documents.map<Widget>((document) {
      // if ((document["uid"].toString() == uid)) {
      return ListView.builder(
        itemBuilder:
            // ignore: missing_return
            (context, index) {
          // ignore: unused_label
          // ignore: unnecessary_statements
          // children: <Widget>[
          ListTile(
            title: Text(document["displayName"]),
            // subtitle: Text(document["uid"]),
          );
          ListTile(
            title: Text(document["age"]),
            // subtitle: Text(document["uid"]),
          );
          ListTile(
            title: Text(document["location"]),
            // subtitle: Text(document["uid"]),
          );
          ListTile(
            title: Text(document["bloodType"]),
            // subtitle: Text(document["uid"]),
          );
          ListTile(
            title: Text(document["ph_num"]),
            // subtitle: Text(document["uid"]),
          );
        },
        itemCount: 5,
        shrinkWrap: true,
      );
      // }

      // return Text("fffff");
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Blood Donation'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: firestore.collection("Users").snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                return ListView.builder(
                  // ignore: missing_return
                  itemBuilder: (context, index) {
                    makeListWidget(snapshot);

                    // children: <Widget>[
                    //   ListTile(
                    //     title: Text("displayName"),
                    //     // subtitle: Text(document["uid"]),
                    //   ),
                    //   ListTile(
                    //     title: Text("age"),
                    //     // subtitle: Text(document["uid"]),
                    //   ),
                    //   ListTile(
                    //     title: Text("location"),
                    //     // subtitle: Text(document["uid"]),
                    //   ),
                    //   ListTile(
                    //     title: Text("bloodType"),
                    //     // subtitle: Text(document["uid"]),
                    //   ),
                    //   ListTile(
                    //     title: Text("ph_num"),
                    //     // subtitle: Text(document["uid"]),
                    //   ),
                    // ],
                    // children: makeListWidget(snapshot),
                  },
                  itemCount: 5,
                );
            }
          },
        ),
      ),
    );
  }
}
