<<<<<<< Updated upstream
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:blood_donation/Login.dart';
import 'package:blood_donation/SignUp.dart';
import 'package:blood_donation/Start.dart';
import 'package:blood_donation/load.dart';
=======
import 'package:blood_donation/DonorDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blood_donation/Login.dart';
import 'package:blood_donation/SignUp.dart';
import 'package:blood_donation/Start.dart';
import 'package:blood_donation/screens/add_new_medicine/add_new_medicine.dart';
import 'package:blood_donation/screens/home/home.dart';
import 'package:blood_donation/user_show_details.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'allDonors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.red),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: <String, WidgetBuilder>{
          "Login": (BuildContext context) => Login(),
          "SignUp": (BuildContext context) => SignUp(),
          "start": (BuildContext context) => Start(),
<<<<<<< Updated upstream
=======
          "/home": (BuildContext context) => Home(),
          "/add_new_medicine": (BuildContext context) => AddNewMedicine(),
          "dets": (BuildContext context) => UserDets(),
          "all": (BuildContext context) => Alldets(),
          "donor": (BuildContext context) => AllSingleDets(),
>>>>>>> Stashed changes
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
