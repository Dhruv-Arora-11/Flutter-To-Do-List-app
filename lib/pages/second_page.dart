import 'package:dhruv_travel_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class secondpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar:  AppBar(
          title: const Text("2nd page"),
          leading: IconButton(
              onPressed: () {
            Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => HomePage(),),);
          }, icon: Icon(Icons.arrow_back_outlined),),

    ),
    )
    );
  }
}

