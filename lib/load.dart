import 'dart:async';

// import 'package:blood_donation/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class load extends StatefulWidget {
  @override
  _loadState createState() => _loadState();
}

class _loadState extends State<load> {

  @override
  void initState(){
    super.initState();

    Timer(
      Duration(seconds: 2),()=>
      Navigator.pushReplacementNamed(context, "/"),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.redAccent

          ),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitWave(
                itemBuilder: (BuildContext context, int index){
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven? Colors.white : Colors.redAccent
                    ), 
                  );
                },
              ),
            ],
          ),
        ],
      ),
      
    );
  }
}