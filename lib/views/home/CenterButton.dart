import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../main.dart';

// ignore: must_be_immutable
class CenterButton extends StatelessWidget {
  String text;
  Alignment align;
  var link;
  var icon;

  CenterButton(this.text,this.align,this.link, this.icon);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: align,
        child: ElevatedButton.icon(
          label: Text(text),
          icon: Icon(icon),
          style: ElevatedButton.styleFrom(
            primary: HexColor('AD6B07'),
            onPrimary: Colors.white,
            onSurface: Colors.grey,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => link),
            );
          },
        ),
      ),
    );
  }
}
