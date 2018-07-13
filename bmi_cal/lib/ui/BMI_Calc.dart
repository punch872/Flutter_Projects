import 'package:flutter/material.dart';

class BMI extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BMIState();
  }
}

class BMIState extends State<BMI>{
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double result = 0.0;
  String ReadText = "";
  String _finalResults="";

  void _calcBMI(){
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);
      double meter = height/100;
      if (_ageController.text.isNotEmpty || age > 0
          && _heightController.text.isNotEmpty || height > 0
          && _weightController.text.isNotEmpty || weight > 0) {
        result = (weight) / (meter * meter);
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          ReadText = "You're Under Weights";
          print(ReadText);
        }
        else if(double.parse(result.toStringAsFixed(1)) >18.5
            && double.parse(result.toStringAsFixed(1)) < 25.0 ){
          ReadText = "You're In good Shape";
          print(ReadText);
        }
        else if(double.parse(result.toStringAsFixed(1)) >=25.0
            && double.parse(result.toStringAsFixed(1)) <= 30.0 ){

          ReadText = "You're Over Weights";
          print(ReadText);
        }
      }
      else {
        return "Please complete the form";
      }
    });
    _finalResults = "Your BMI: ${result.toStringAsFixed(1)}";
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(backgroundColor: Colors.pinkAccent,
        title: new Text('BMI'),
        centerTitle: true,),
      backgroundColor: Colors.white,
      body:new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              height: 100.0,
              width: 100.0,
            ),
            new Container(
              height: 250.0,
              width: 300.0,
              color: Colors.black12,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,keyboardType: TextInputType.number,
                    decoration: new InputDecoration(labelText: "Age",
                        hintText: "Enter your age",
                        icon: new Icon(Icons.person)
                    ),
                  ),
                  new TextField(
                    controller: _heightController,keyboardType: TextInputType.number,
                    decoration: new InputDecoration(labelText: "Height",
                        hintText: "Enter your Height",
                        icon: new Icon(Icons.show_chart)
                    ),
                  ),
                  new TextField(
                    controller: _weightController,keyboardType: TextInputType.number,
                    decoration: new InputDecoration(labelText: "Weight",
                        hintText: "Enter your Weight",
                        icon: new Icon(Icons.reorder)
                    ),
                  ),

                  new Padding(padding: new EdgeInsets.all(10.5)),

                  new Center(
                    child: new Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          child: new RaisedButton(
                            onPressed: _calcBMI /*bmi results*/,
                            color: Colors.pinkAccent,
                            child: new Text("Calculate",
                              style: TextStyle(color: Colors.white),) ,),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(10.5)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("YourBMI: $result ",style: new TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500
                ),),
                new Text("$ReadText",style: new TextStyle(
                    color: Colors.red,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500
                ),)
              ],
            )
          ],
        ),
      ),




    );
  }

}