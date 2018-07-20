import 'package:flutter/material.dart';
import 'package:flutter_sqlite_database/models/user.dart';
import 'package:flutter_sqlite_database/utils/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


List _users;

void main() async{
  var db = new DatabaseHelper();

  //Add user
  int saveuser = await db.saveUser(new User("Olala","rackba"));

  //Count
  int count = await db.getCount();

  print("Count: $count");

  //Retrieving a user

  User ana = await db.getUser(1);
  User anaUpdate = User.fromMap({
    "username": "UpdateAna",
    "password":"updatedPassword",
    "id":1,

  });

  //Update
  await db.updateUser(anaUpdate);


  //Delete

  // int userDeleted = await db.deleteUser(5);
  //print("Delete User: $userDeleted");

  //Get all Users;
  _users = await db.getAllUser();
  for (int i=0;i<_users.length;i++){
    User user = User.map(_users[i]);
    print("Username: ${user.username},UserId:${user.id}");

  }
  runApp(new MaterialApp(
    title: "Database",
    home: new Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new ListView.builder(
          itemCount: _users.length ,
          itemBuilder: (_,int position)
          {
            return new Card(
              color: Colors.white,
              //allow to see the shadow of card
              elevation:2.0,
              child: new ListTile(
                leading: new CircleAvatar(
                  child: new Text(
                "${User.fromMap(_users[position]).username.substring(0,1)}"
                  ),
                ),
                title
                    : new Text(
                    "User: ${User.fromMap(_users[position]).username}"
                ),
                subtitle: new Text("Id: ${User.fromMap(_users[position]).id}"),
                onTap: ()=>debugPrint("password: ${User.fromMap(_users[position]).password}"),
              ),
            );
          }),
    );
  }
}
