import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffc5cae9),
          primarySwatch: Colors.purple,
        ),
      home: Scaffold(
        appBar: AppBar(title: Text('App Maria Eugênia'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Container(
                width: 400,
                height: 400,
                child: Image.asset('assets/images/Maria.png'),
              ),
              Card (
                child: ListTile(
                  title: Text('Programação para dispositivos móveis'),
                  subtitle: Text('Ely Miranda'),
                ),
              )
            ],
          ) ,
        ),
      )
    )
  );
}

