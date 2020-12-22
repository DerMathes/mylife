import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylife/Database/databasehelper.dart';

import '../../main.dart';

class Friends extends StatefulWidget {
  FriendsPage createState() => FriendsPage();
}

class FriendsPage extends State<Friends> {
  final myController = TextEditingController();
  List<String> friendsName = [];

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Freunde"),
        backgroundColor: HexColor('AD6B07'),

      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill)),
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: friendsName.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: HexColor('AD6B07'),
              child: Center(
                child: Text('${friendsName[index]}', style: TextStyle(color: Colors.white),),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Neue/r Freund/in'),
                content: Row(children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: myController,
                      decoration: InputDecoration(labelText: 'Name eingeben'),
                    ),
                  ),
                  TextButton(
                    child: Text('Speichern'),
                    onPressed: () {
                      _save();
                      _read();
                      friendsName.add("${myController.text}");
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                  ),
                ],
              ),
              );
            },
          );
        },
        child: Icon(Icons.plus_one),
        backgroundColor: HexColor('AD6B07'),
      ),
    );
  }
  _save() async {
    MyFriends newFriend = MyFriends();
    newFriend.name = 'Testname';
    newFriend.lastname = 'TestNachname';
    newFriend.birthday = DateTime.now().toString();
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insert(newFriend);
    print('inserted row: $id');
  }

  _read() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    int rowId = 1;
    MyFriends myfriends = await helper.queryMyFriends(rowId);
    if (myfriends == null) {
      print('read row $rowId: empty');
    } else {
      print('read row $rowId: ${myfriends.name} ${myfriends.lastname} ${myfriends.birthday}');
    }
  }
}
