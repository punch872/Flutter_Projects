import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
    // TODO: implement createState
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcome = " ";
  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();

    });


  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.blueGrey,
// Person picture
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.greenAccent,
            ),
            new Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white,


              child: new Column(
                children: <Widget>[  new TextField(
                  controller: _userController,
                  decoration: new InputDecoration(
                      hintText: 'Username',
                      icon: new Icon(Icons.person)
                  ),
                ),new TextField(
                  controller: _passwordController,
                  decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: new Icon(Icons.lock)
                  ),
                  obscureText: true,
                ),
                new Padding(padding: new EdgeInsets.all(10.5)),
                new Center(
                  child: new Row(
                    children: <Widget>[

                      new Container (
                        margin: const EdgeInsets.only(left:38.0),
                        child: new RaisedButton(onPressed: _showWelcome,
                          color: Colors.greenAccent,
                          child: new Text("Login",style: new TextStyle(
                              color: Colors.white)
                          ),),
                      ),

                      new Container (
                        margin: const EdgeInsets.only(left:120.0),
                        child: new RaisedButton(onPressed: _erase,
                          color: Colors.greenAccent,
                          child: new Text("clear",style: new TextStyle(
                              color: Colors.white)
                          ),),
                      )
                    ],
                  ),
                )
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(10.5)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Welcome\$ $_welcome",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500),)
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _showWelcome(){
    setState(() {
      if (_userController.text.isNotEmpty && _passwordController.text.isNotEmpty){
        _welcome= _userController.text;
      }
      else {
        _welcome="nothing";
      }
    });
  }
}
