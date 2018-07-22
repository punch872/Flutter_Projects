import 'package:flutter/material.dart';

class NoDoItem extends StatelessWidget {
  String _itemName;
  String _dataCreated;
  int _id;

  //Maping

  NoDoItem(this._itemName,this._dataCreated);

  NoDoItem.map(dynamic obj){
    this._itemName = obj["itemName"];
    this._dataCreated = obj["dataCreated"];
    this._id= obj["id"];
  }

  String get itemName => _itemName;
  String get dateCreated => _dataCreated;
  int get id => _id;

  Map<String,dynamic> toMap(){
    var map = new Map<String,dynamic>();
    map["itemName"] = _itemName;
    map["dataCreated"] = _dataCreated;
    map["id"] = _id;

    if(id != null){
      map["id"] = _id;
    }
    return map;
  }
  //from the obj from the map in line 10-15
  NoDoItem.fromMap(Map<String,dynamic> map ){
    this._itemName = map["itemName"];
    this._dataCreated = map["itemName"];
    this._id = map["id"];

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(_itemName,
            style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.9
            ),),
          new Container(
            margin: const EdgeInsets.only(top: 5.0) ,
            child: new Text("Created on: $_dataCreated",  style:new TextStyle(
                color: Colors.white70,
                fontStyle: FontStyle.italic
            ),),
          )
        ],
      ),
    );
  }
}
