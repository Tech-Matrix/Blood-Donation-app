import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Start.dart';
import 'package:blood_donation/Start.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, "start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  navigateToMed() async {
    Navigator.pushReplacementNamed(context, "/home");
  }

  navigateToDets() async {
    Navigator.pushReplacementNamed(context, "dets");
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  void initState() {
    this.checkAuthentication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('Blood Donation'),
          ),
          body: Center(
            child: Container(
              child: !isloggedin
                  ? CircularProgressIndicator()
                  : Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 300,
                          child: Image(
                            image: AssetImage("images/logo.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          child: Text(
                            "Hello ${user.displayName} you are logged in",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed: signOut,
                          child: Text(
                            'SignOut',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed: navigateToMed,
                          child: Text(
                            'Medicine Reminder',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed: navigateToDets,
                          child: Text(
                            'dets',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
            ),
          )),
    );
  }
}
