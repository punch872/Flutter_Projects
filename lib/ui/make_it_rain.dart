import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 0;

  void _rainMoney(){
    setState((){
      //important - setState is called each time to update the UI
      _moneyCounter = _moneyCounter+100;

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Make It Rain!"),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text(
                "Get Rich",
                style: new TextStyle(color: Colors.grey, fontSize: 30.3),
              ),
            ),

            new Expanded(
                child: new Center(
                  child: new Text('\$ $_moneyCounter',
                    style: new TextStyle(
                        color: Colors.green,
                        fontSize: 46.9,
                        fontWeight: FontWeight.w800),
                  ),
                )),
            new Expanded(
              child: new Center(
                  child: new FlatButton(
                    color: Colors.lightGreen,
                    onPressed: _rainMoney,
                    child: new Text(
                      "Let It Rain",
                      style: new TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 19.9),
                    ),
                  )),
            )
            // ignore: expected_token
          ],
        ),
      ),
    );
  }
}
