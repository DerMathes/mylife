import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "MyFriendsDatabase.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 5;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE MyFriends (
                id INTEGER PRIMARY KEY,
                name TEXT,
                lastname TEXT,
                birthday TEXT)
              ''');
  }

  // Database helper methods:

  Future<MyFriends> queryMyFriends(int id) async {
    Database db = await database;
    List<Map> maps = await db.query('MyFriends',
        columns: ['id', 'name' , 'lastname',
        'birthday'],
        where: '$id = ?',
        whereArgs: [id]);
    return MyFriends().fromMap(maps[(id - 1)]);
  }

  Future<int> insert(MyFriends myfriends) async {
    Database db = await database;
    int id = await db.insert('MyFriends', myfriends.toMap());
    return id;
  }

// TODO: queryAllMYFriends()
// TODO: delete(int id)
// TODO: update(MyFriends myfriends)
}

class MyFriends {
  int id;
  String name;
  String lastname;
  String birthday;

  MyFriends();

  MyFriends fromMap(Map<String, dynamic> maps) {
    MyFriends newFriend = MyFriends();
    newFriend.id = maps['id'];
    newFriend.name = maps['name'];
    newFriend.lastname = maps['lastname'];
    newFriend.birthday = maps['birthday'];
    return newFriend;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'lastname': lastname,
      'birthday': birthday,
    };
    if (id != null) {
      map['id'] = 1;
    }
    return map;
  }
}


