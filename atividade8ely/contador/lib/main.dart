import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Contador',
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _numero = new Random().nextInt(100) ;

  void _incremento() {
   setState(() {
      _numero++;
    });
  }
  void _decremento() {
    setState(() {
      if(_numero>0) {
        _numero--;
      }
      else {
        _numero = 0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.greenAccent,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Text('Numero $_numero',
          style: TextStyle(
              fontSize: 25.0
          )
        ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incremento,
                  child: Icon(Icons.add)),
                SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                    onPressed: _decremento,
                    child: Icon(Icons.remove)),
              ],
            )
    ]
    ),
        ),

    );
  }
}
