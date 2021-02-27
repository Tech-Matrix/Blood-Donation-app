import 'package:firebase_auth/firebase_auth.dart';
import 'package:blood_donation/Login.dart';
import 'package:blood_donation/SignUp.dart';
import 'package:blood_donation/Start.dart';
// import 'package:blood_donation/load.dart';
import 'package:blood_donation/screens/add_new_medicine/add_new_medicine.dart';
import 'package:blood_donation/screens/home/home.dart';
import 'package:blood_donation/show_details.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData(primaryColor: Colors.red),
        theme: ThemeData(
            fontFamily: "Popins",
            primaryColor: Colors.red,
            textTheme: TextTheme(
                headline1: ThemeData.light().textTheme.headline1.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 38.0,
                      fontFamily: "Popins",
                    ),
                headline5: ThemeData.light().textTheme.headline1.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0,
                      fontFamily: "Popins",
                    ),
                headline3: ThemeData.light().textTheme.headline3.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      fontFamily: "Popins",
                    ))),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: <String, WidgetBuilder>{
          // "/": (context) => HomePage(),
          "Login": (BuildContext context) => Login(),
          "SignUp": (BuildContext context) => SignUp(),
          "start": (BuildContext context) => Start(),
          "/home": (BuildContext context) => Home(),
          "/add_new_medicine": (BuildContext context) => AddNewMedicine(),
          "dets": (BuildContext context) => UserDets(),
        });
  }
}

// _signInWithGoogle() {
// Future login() async {
//    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
//    final GoogleSignInAuthentication googleAuth =
//        await googleUser.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(
//        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
//     await firebaseAuth.signInWithCredential(credential);
//     // onPressed: () async{ how to call
//     //           login();
//     //         },
//  }
// // }
