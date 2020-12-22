import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylife/main.dart';
import 'package:mylife/views/challanges/challanges.dart';
import 'package:mylife/views/friends/friends.dart';
import 'package:mylife/views/gifts/gifts.dart';
import 'package:mylife/views/home/CenterButton.dart';
import 'package:mylife/views/map/friendsmap.dart';
import 'package:mylife/views/meet/meet.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyLife'),
        backgroundColor: HexColor('AD6B07'),
      ),
      body: Container(
          padding: new EdgeInsets.all(40.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill)),
          child: new Stack(children: [
            CenterButton('Geschenke',Alignment.topLeft, Gifts(), Icons.wallet_giftcard),
            CenterButton('Karte', Alignment.topRight, Friendsmap(), Icons.map_outlined),
            CenterButton('Freunde', Alignment.center, Friends(),Icons.emoji_people),
            CenterButton('Treffen', Alignment.bottomLeft, Meet(),Icons.meeting_room),
            CenterButton('Challanges', Alignment.bottomRight,Challanges(),Icons.track_changes),
          ])
      ),
    );
  }
}
