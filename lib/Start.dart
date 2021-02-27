import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:blood_donation/Login.dart';
import 'SignUp.dart';
=======
>>>>>>> Stashed changes

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  // final googleSignIn = GoogleSignIn();
  // final firebaseAuth: FirebaseAuth.instance;

  // Future glogin() async {
  //   final googleUser = await googleSignIn.signIn();
  //   final googleAuth = await googleUser.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //   await firebaseAuth.signInWithCredential(credential);
  //   // onPressed: () async{ how to call
  //   //           login();
  //   //         },
  // }

  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Blood Donation'),
      ),
      body: Container(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              SizedBox(height: 100.0),
              Container(
                width: 300,
                height: 400,
                child: Image(
                    image: AssetImage("images/start.jpg"), fit: BoxFit.fill),
              ),
              SizedBox(height: 30.0),
              RichText(
                text: TextSpan(
                  text: 'Welcome to the ',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Blood Donation App',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      onPressed: navigateToLogin,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.red),
                  SizedBox(width: 20),
                  RaisedButton(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      onPressed: navigateToRegister,
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.red),
                ],
              ),
              SizedBox(height: 15),
              // SignInButton(
              //   Buttons.Google,
              //   text: "Sign up with Google",
              //   onPressed: () async {
              //     glogin();
              //   },
            ],
          ),
        ),
      ),
    );
  }
}
