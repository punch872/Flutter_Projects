import 'dart:convert';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
Map _data;
List _features;
void main () async{

  _data = await getQuakes();
  _features = _data['features'];
  //print (_data['features'][0]['properties']);

  runApp(new MaterialApp(
    title: "Quakes",
    home: new Quakes(),
  ));

}
class Quakes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Quakes'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Center(
        child: new ListView.builder(
            itemCount: _features.length ,
            padding: const EdgeInsets.all(15.0),
            itemBuilder: (BuildContext context,int position){
              if (position.isOdd) return new Divider();
              var format = new DateFormat.yMMMMd("en_US");
              final index = position ~/2;
              //var dateString = format.format(date);

              // times 1000 for the sorting to milisecond in current time to past
              var date = format.format(DateTime.fromMicrosecondsSinceEpoch(_features[index]['properties']['time']*1000,isUtc:true));
              return new ListTile(
                title: new Text("$date",style: new TextStyle(
                    fontSize: 15.5,color:
                Colors.orange,fontWeight: FontWeight.w800),),
                subtitle: new Text("Mag ${_features[index]['properties']['place']}",
                  style:new TextStyle(fontSize: 13.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),),

                //create an avatar
                leading: new CircleAvatar(
                  backgroundColor: Colors.green,
                  child: new Text("${_features[index]['properties']['mag']}",
                    style: new TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontStyle: FontStyle.normal
                    ),),
                ),
                onTap: () {_showAleartMessage(context,"${_features[index]['properties']['title']}");},
              );
            }
        ),
      ),
    );
  }
}

void _showAleartMessage(BuildContext context, String message) {
  var alert = new AlertDialog(
    title: new Text('Quakes'),
    content: new Text(message),
    actions: <Widget>[
      new FlatButton(onPressed: ()
      {
        Navigator.pop(context);
      },
          child:
          new Text("Okay"))
    ],
  );
  showDialog(context:context, builder:(context) => alert);

}



Future<Map> getQuakes() async {

  String apiUrl = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
  //create respons and acknowledge using get method

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body); //

}

