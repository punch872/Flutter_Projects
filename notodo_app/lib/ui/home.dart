import 'package:flutter/material.dart';
import '../ui/notodo_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("NoToDo"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: new NotodoScreen(),
    );
  }
}
