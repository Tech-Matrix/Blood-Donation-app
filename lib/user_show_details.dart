import 'package:blood_donation/HomePage.dart';
import 'package:blood_donation/allDonors.dart';
import 'package:blood_donation/screens/add_new_medicine/add_new_medicine.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDets extends StatefulWidget {
  @override
  _UserDetsState createState() => _UserDetsState();
}

class _UserDetsState extends State<UserDets> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final String uid = auth.currentUser.uid.toString();

    return snapshot.data.documents.map<Widget>((document) {
      if ((document["uid"].toString() == uid)) {
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

  int currentTab = 3;

  UserDets four;
  Alldets two;
  HomePage one;
  AddNewMedicine three;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        //   onPressed: () => Navigator.pushReplacementNamed(context, "/"),
        // ),
        title: Text('Profile'),
      ),
      body: Scaffold(
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
    );
  }
}
  






































































// class UserDets extends StatelessWidget {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   List<Widget> makeListWidget(AsyncSnapshot snapshot) {
//     final FirebaseAuth auth = FirebaseAuth.instance;
//     final String uid = auth.currentUser.uid.toString();

//     return snapshot.data.documents.map<Widget>((document) {
//       if ((document["uid"].toString() == uid)) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 25.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(height: 20),
//               Container(
//                 child: Text(
//                   "Donor Details",
//                   style: TextStyle(
//                       decoration: TextDecoration.underline,
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.redAccent),
//                 ),
//               ),
//               SizedBox(height: 150),
//               Container(
//                 child: Text(
//                   "Name: " + document["displayName"],
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 child: Text(
//                   "Age: " + document["age"],
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 child: Text(
//                   "Location: " + document["location"],
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 child: Text(
//                   "Blood Group: " + document["bloodType"],
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 child: Text(
//                   "Contact number: " + document["ph_num"],
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 child: Text(
//                   "E-mail: " + document["email"],
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         );
//       }
//       return Text("");
//     }).toList();
//   }

//   int currentTab = 2;

//   UserDets three;
//   Alldets two;
//   HomePage one;
//   List<Widget> pages;
//   Widget currentPage;

//   @override
//   void initState() {
//     one = HomePage();
//     two = Alldets();
//     three = UserDets();

//     pages = [one, two, three];
//     currentPage = one;
//     // super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () => Navigator.pushReplacementNamed(context, "/"),
//         ),
//         title: Text('Profile'),
//       ),
//       body: Scaffold(
//         body: Container(
//           child: StreamBuilder(
//             stream: firestore.collection("Users").snapshots(),
//             builder: (context, snapshot) {
//               switch (snapshot.connectionState) {
//                 case ConnectionState.waiting:
//                   return CircularProgressIndicator();
//                 default:
//                   return ListView(
//                     children: makeListWidget(snapshot),
//                   );
//               }
//             },
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: currentTab,
//           onTap: (int index) {
//             Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => pages[index]),
//               // setState(() {

//               //   // currentTab = index;
//               //   // currentPage = pages[index];
//               // }
//             );
//           },
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               // backgroundColor: Colors.red,
//               icon: Icon(Icons.home),

//               title: Text("Home"),
//             ),
//             BottomNavigationBarItem(
//               // backgroundColor: Colors.red,
//               icon: Icon(Icons.list),
//               title: Text("All Donors"),
//             ),
//             BottomNavigationBarItem(
//               // backgroundColor: Colors.red,
//               icon: Icon(Icons.person),
//               title: Text("Profile"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
