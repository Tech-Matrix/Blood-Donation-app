import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllSingleDets extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String value;
  AllSingleDets({this.value});
  // print(value)
  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    // final FirebaseAuth auth = FirebaseAuth.instance;
    // final String uid = auth.currentUser.uid.toString();

    return snapshot.data.documents.map<Widget>((document) {
      if ((document["uid"].toString() == value)) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                child: Text(
                  "Donor Details",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),
              SizedBox(height: 150),
              Container(
                child: Text(
                  "Name: " + document["displayName"],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  "Age: " + document["age"],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  "Location: " + document["location"],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  "Blood Group: " + document["bloodType"],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  "Contact number: " + document["ph_num"],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  "E-mail: " + document["email"],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      }
      return Text("");
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, "all"),
        ),
        title: Text('Profile'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: firestore.collection("Users").snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                return ListView(
                  children: makeListWidget(snapshot),
                );
            }
          },
        ),
      ),
    );
  }
}
