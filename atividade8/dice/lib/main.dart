import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.blueAccent,
        ),
        body: DicePage(),
      )
  )
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
  }


class _DicePageState extends State<DicePage> {
  int DiceNumber = 1;
  int DiceNumber2 =1;

  void DiceFace() {
    setState((){
      DiceNumber = Random().nextInt(8) + 1;
      DiceNumber2 = Random().nextInt(8) + 1;
      assert(DiceNumber != DiceNumber2);
    }
    );
  }
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Center (
        child: Row(
          children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                  DiceFace();
              },
              child: Image.asset('images/octaedro$DiceNumber.png'),
            ),
        ),
          Expanded(
              child: TextButton(
                onPressed: () {
                  DiceFace();
                },
                child: Image.asset('images/octaedro$DiceNumber2.png'),
              ),
            ),
      ],
    ),
    );
  }

}

