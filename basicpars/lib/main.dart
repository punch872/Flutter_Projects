import 'package:flutter/material.dart';
//use to fetch data for remote API
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {

  List _data = await getJson();
  String _body = "";
  for (int i=0 ; i<_data.length;i++){
    print("Title: ${_data[i]['title']}");
    print("Body: ${_data[i]['body']}");

  }

  _body = _data[0]['body'];

  runApp(new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("JSON Parse"),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,),
        body: new Center(
            child: new ListView.builder(
                itemCount:_data.length,
                padding: const EdgeInsets.all(14.5),// count all data,
                itemBuilder:(BuildContext context, int position){
                  return Column(
                    children: <Widget>[
                      new Divider(
                        height: 5.5,
                      ),
                      new ListTile(
                        title: Text("${_data[position]['title']}",
                          style: new TextStyle(fontSize: 17.9
                              ,color: Colors.blue),
                        ),

                        subtitle: Text("${_data[position]['body']}",
                            style: new TextStyle(fontSize: 13.9,
                                color: Colors.grey,fontStyle: FontStyle.italic
                            )),

                        leading: new CircleAvatar(
                          backgroundColor: Colors.lightGreenAccent,
                          child: Text("${_data[position]['body'][0]}".toUpperCase(), style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 19.4,
                              color: Colors.orangeAccent )),
                        ),
                        //Tap On the list
                        onTap: ()=> _showTopMessage(context,_data[position]['body']),
                      ),
                    ],
                  );
                })
          // new Text('Body... \n $_body'),
        ),
      )
  ));
}
void _showTopMessage(BuildContext context, String message){
  var  alert = new AlertDialog(
      title: Text("My App"),
      content:Text(message),
      actions:<Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ]
  );

  showDialog(context:context, builder: (context) => alert);
}
//Getting HTTP API
Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);

}

