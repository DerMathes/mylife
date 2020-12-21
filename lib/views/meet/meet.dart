import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylife/views/home/homescreen.dart';
import '../../main.dart';

class Meet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Treffen"),
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