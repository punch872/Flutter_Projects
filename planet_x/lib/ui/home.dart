import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<Home>{

  final TextEditingController _weightController =  new TextEditingController();
  int radioValue = 0 ;
  double _finalResult = 0.0;
  String _formatText = "";


  void handleRadioValueChange(int value){
    setState((){
      radioValue = value;

      switch (radioValue){
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formatText= "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formatText= "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formatText= "Your weight on Venys is ${_finalResult.toStringAsFixed(1)}";
          break;
          break;
      }

      print(radioValue);
    });
  }
  @override
  // TODO: implement build
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(4.0),
          children: <Widget>[
            new Image.asset('images/planet.png',
              height: 200.0,
              width: 200.0,),

            //Text Field section
            new Container(
              margin:const EdgeInsets.all (3.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your weight on Earth",
                      hintText:'In Pounds',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),

                  //three Radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //ratio buttons
                      new Radio<int>(activeColor: Colors.brown,
                          value: 0, groupValue: radioValue, onChanged: handleRadioValueChange
                      ),
                      new Text("Pluto",
                        style: new TextStyle(
                            color: Colors.white70
                        ), ),

                      new Radio<int>(
                          activeColor: Colors.redAccent,
                          value: 1, groupValue: radioValue, onChanged: handleRadioValueChange),
                      new Text("Mars",
                        style: new TextStyle(
                            color: Colors.white70
                        ),),
                      new Radio<int>
                        (value: 2, groupValue: radioValue, onChanged: handleRadioValueChange),
                      new Text("Venus",
                        style: new TextStyle(
                            color: Colors.orangeAccent
                        ),),
                      //result text
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Text('$_formatText lbs',
                    style: new TextStyle(color: Colors.white,fontSize: 19.4,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
double calculateWeight(String weight,double multiplier){

  if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
    return int.parse((weight)) * multiplier;
  }else{
    print("Wrong");
    return int.parse("180") * 0.38;
  }

}

class test extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }

}