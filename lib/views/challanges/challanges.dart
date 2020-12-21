import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylife/views/home/homescreen.dart';
import '../../main.dart';

class Challanges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Herausforderungen"),
        backgroundColor: HexColor('AD6B07'),
      ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"), fit: BoxFit.fill)),
        )
    );
  }
}