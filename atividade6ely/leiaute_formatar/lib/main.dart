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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget> [
                  buildContainer('Container 1',Colors.white ),
                  buildContainer('Container 2',Colors.red ),
                  buildContainer('Container 3',Colors.blue ),
                 ],

          )
          ),
        )
    );
  }
  Container buildContainer( String text, Color color) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      child: Text(text),
    );
  }

  }

