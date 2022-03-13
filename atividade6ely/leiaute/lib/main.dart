import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               buildContainer(Colors.red),
              buildContainer2(Colors.amber, Colors.green),
               buildContainer(Colors.blue),
            ],

          ),

        ),
      ),
    );
  }

  Container buildContainer( Color color){
    return Container(
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: color,
          ),
        ],
      ),
    );
  }

  Container buildContainer2(Color color1, Color color2){
    return Container(
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: color1,
          ),
          Container(
            width: 100,
            height: 100,
            color: color2,
          ),
        ],
      ),
    );
  }

}

