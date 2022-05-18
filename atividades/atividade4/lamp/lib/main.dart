import 'package:flutter/material.dart';

void main() {
  runApp(const MyLamp());
}

class MyLamp extends StatefulWidget {
  const MyLamp({Key? key}) : super(key: key);

  @override
  State<MyLamp> createState() => _MyLampState();
}

class _MyLampState extends State<MyLamp> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lâmpada')
        ),
        body: Center(
          child: Column(
            children: [
              Spacer(),
              Text('Lâmpada',
              style: TextStyle(fontSize: 30),
              ),
              Image.asset(
                value ? 'images/on.jpg' : 'images/off.jpg',
              height: 250,
              ),
             Spacer(),
              const SizedBox(height: 12),
              Switch(
                  value: value,
                  onChanged: (newValue) {
                    setState(() {
                      value = newValue;
                    });
                  }
              ),
            ]
          ),
        ),
      ),
    );
  }
}

