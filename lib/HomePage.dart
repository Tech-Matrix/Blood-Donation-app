import 'package:blood_donation/allDonors.dart';
import 'package:blood_donation/screens/add_new_medicine/add_new_medicine.dart';
import 'package:blood_donation/user_show_details.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        Navigator.pushReplacementNamed(
            context, "start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser =  _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

<<<<<<< Updated upstream
=======
  navigateToMed() async {
    Navigator.pushReplacementNamed(context, "/home");
  }

  navigateToAll() async {
    Navigator.pushReplacementNamed(context, "all");
  }

  navigateToDets() async {
    Navigator.pushReplacementNamed(context, "dets");
  }

>>>>>>> Stashed changes
  signOut() async {
    _auth.signOut();
  }

  int currentTab = 0;

  UserDets four;
  Alldets two;
  HomePage one;
  AddNewMedicine three;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    this.checkAuthentication();
    this.getUser();

    one = HomePage();
    two = Alldets();
    four = UserDets();
    three = AddNewMedicine();
    pages = [one, two, three, four];
    currentPage = one;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
<<<<<<< Updated upstream
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('Blood Donation'),
          ),
          body: Center(
            child: Container(
            child: !isloggedin? CircularProgressIndicator(): Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 400,
                      child: Image(
                      image: AssetImage("images/hello.jpeg"),
                      fit: BoxFit.contain,
                ),
                    ),
                    Container(
                      child: Text(
                        "Hello ${user.displayName} you are logged in",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    )
                  ],
                ),
      ),
          )),
=======
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
                          "Hello ${user.displayName} you are logged in!!!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 25),

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
                      SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          text: 'Starve a Vampire, save a human life.',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: 'A simple app to let you reach out',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'to people willing to donate',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'blood when in need',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: 'With an extra healthcare',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'feature:',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'A Medicine Reminder',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                      ),
                      SizedBox(height: 8),

                      RichText(
                        text: TextSpan(
                          text:
                              'Never forget to take your important medicines again.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 30.0),
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

                      // RaisedButton(
                      //   padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      //   onPressed: navigateToMed,
                      //   child: Text(
                      //     'Medicine Reminder',
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      //   color: Colors.red,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      // ),
                      // RaisedButton(
                      //   padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      //   onPressed: navigateToDets,
                      //   child: Text(
                      //     'dets',
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      //   color: Colors.red,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      // ),
                      // RaisedButton(
                      //   padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      //   onPressed: navigateToAll,
                      //   child: Text(
                      //     'ALL',
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      //   color: Colors.red,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      // ),
                    ],
                  ),
          ),
        ),
        // currentPage,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentTab,
          onTap: (int index) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => pages[index]),
              // setState(() {

              //   // currentTab = index;
              //   // currentPage = pages[index];
              // }
            );
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              // backgroundColor: Colors.red,
              icon: Icon(Icons.home),

              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.red,
              icon: Icon(Icons.list),
              title: Text("All Donors"),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.red,
              icon: Icon(Icons.medical_services_rounded),
              title: Text("Medicine Reminder"),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.red,
              icon: Icon(Icons.person),
              title: Text("Profile"),
            ),
          ],
        ),
      ),
>>>>>>> Stashed changes
    );
  }
}
