import 'package:blood_donation/DonorDetails.dart';
import 'package:blood_donation/HomePage.dart';
import 'package:blood_donation/screens/add_new_medicine/add_new_medicine.dart';
import 'package:blood_donation/user_show_details.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Alldets extends StatefulWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  _AlldetsState createState() => _AlldetsState();
}

class _AlldetsState extends State<Alldets> {
  // navigateToDonor() async {
  //   Navigator.pushReplacementNamed(context, "donor");
  // }
  // String value;
  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.documents.map<Widget>((document) {
      var value = document["uid"];
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3),
        child: Card(
          child: ListTile(
            onTap: () {
              print(value);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AllSingleDets(value: value),
              ));
            },
            title: Text(document["displayName"]),
            subtitle: Text(document["bloodType"]),
          ),
        ),
      );
    }).toList();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  int currentTab = 1;

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, "/"),
        ),
        title: Text('All Available Donors'),
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
    );
  }
}













// class Alldets extends StatelessWidget {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   // navigateToSingle() async {
//   //   Navigator.pushReplacementNamed(context, "/home");
//   // }

//   List<Widget> makeListWidget(AsyncSnapshot snapshot) {
//     return snapshot.data.documents.map<Widget>((document) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3),
//         child: Card(
//           child: ListTile(
//             onTap: () => Navigator.pushReplacementNamed(context, "/"),
//             title: Text(document["displayName"]),
//             subtitle: Text(document["bloodType"]),
//           ),
//         ),
//       );
//     }).toList();
//   }

//   // Context get context2 => context;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () => Navigator.pushReplacementNamed(context, "/"),
//         ),
//         title: Text('All Available Donors'),
//       ),
//       body: Container(
//         child: StreamBuilder(
//           stream: firestore.collection("Users").snapshots(),
//           builder: (context, snapshot) {
//             switch (snapshot.connectionState) {
//               case ConnectionState.waiting:
//                 return CircularProgressIndicator();
//               default:
//                 return ListView(
//                   children: makeListWidget(snapshot),
//                 );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
