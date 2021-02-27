import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
// import 'HomePage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _password, _name, _btype, _location, _age, _phno;
  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  Future<void> userData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    users.add({
      'displayName': _name,
      'uid': uid,
      'age': _age.toString(),
      'location': _location,
      'bloodType': _btype,
      'ph_num': _phno.toString(),
    });
    return;
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: _email, password: _password);
        if (userCredential.user != null) {
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          // user.updateProfile(updateuser);
          await _auth.currentUser.updateProfile(displayName: _name);
          userData();
        }
      } on FirebaseAuthException catch (e) {
        print(e.message);
        // print(userCredential);
        // return null;
        showError(e.code);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('ERROR'),
              content: Text(errormessage),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'))
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, "/"),
        ),
        title: Text('Blood Donation'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  height: 300,
                  child: Image(
                    image: AssetImage("images/signin.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                              // ignore: missing_return
                              validator: (input) {
                                if (input.isEmpty) return 'Enter your name';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Name',
                                  prefixIcon: Icon(Icons.person)),
                              onSaved: (input) => _name = input),
                        ),
                        Container(
                          child: TextFormField(
                              // ignore: missing_return
                              validator: (input) {
                                if (input.isEmpty) return 'Enter the email';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email)),
                              onSaved: (input) => _email = input),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: DropDownFormField(
                            titleText: 'Blood Group',
                            hintText: 'Please choose one',
                            value: _btype,
                            onSaved: (value) {
                              setState(() {
                                _btype = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                _btype = value;
                              });
                            },
                            dataSource: [
                              {
                                "display": "A+",
                                "value": "A+",
                              },
                              {
                                "display": "O+",
                                "value": "O+",
                              },
                              {
                                "display": "B+",
                                "value": "B+",
                              },
                              {
                                "display": "AB+",
                                "value": "AB+",
                              },
                              {
                                "display": "A-",
                                "value": "A-",
                              },
                              {
                                "display": "O-",
                                "value": "O-",
                              },
                              {
                                "display": "B-",
                                "value": "B-",
                              },
                              {
                                "display": "AB-",
                                "value": "AB-",
                              },
                            ],
                            textField: 'display',
                            valueField: 'value',
                          ),
                        ),
                        // Container(
                        //   child: TextFormField(
                        //       validator: (input) {
                        //         if (input.isEmpty)
                        //           return 'Enter your blood type';
                        //       },
                        //       decoration: InputDecoration(
                        //           labelText: 'Blood Group',
                        //           prefixIcon: Icon(Icons.person)),
                        //       onSaved: (input) => _btype = input),
                        // ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty)
                                  return 'Enter your phone number';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  prefixIcon: Icon(Icons.phone)),
                              onSaved: (input) => _phno = input),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) return 'Enter your location';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Location',
                                  prefixIcon: Icon(Icons.pin_drop)),
                              onSaved: (input) => _location = input),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) return 'Enter your age';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Age',
                                  prefixIcon: Icon(Icons.calendar_today)),
                              onSaved: (input) => _age = input),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input.length < 6)
                                  return 'Enter a minimum of 6 characters';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock)),
                              obscureText: true,
                              onSaved: (input) => _password = input),
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed: signUp,
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





// Container(
//                 padding: EdgeInsets.all(16),
//                 child: DropDownFormField(
//                   titleText: 'Blood Group',
//                   hintText: 'Please choose one',
//                   value: _btype,
//                   onSaved: (value) {
//                     setState(() {
//                       _btype = value;
//                     });
//                   },
//                   onChanged: (value) {
//                     setState(() {
//                       _btype = value;
//                     });
//                   },
//                   dataSource: [
//                     {
//                       "display": "A+",
//                       "value": "A+",
//                     },
//                     {
//                       "display": "O+",
//                       "value": "O+",
//                     },
//                     {
//                       "display": "B+",
//                       "value": "B+",
//                     },
//                     {
//                       "display": "AB+",
//                       "value": "AB+",
//                     },
//                     {
//                       "display": "A-",
//                       "value": "A-",
//                     },
//                     {
//                       "display": "O-",
//                       "value": "O-",
//                     },
//                     {
//                       "display": "B-",
//                       "value": "B-",
//                     },
//                     {
//                       "display": "AB-",
//                       "value": "AB-",
//                     },
//                   ],
//                   textField: 'display',
//                   valueField: 'value',
//                 ),
//               ),