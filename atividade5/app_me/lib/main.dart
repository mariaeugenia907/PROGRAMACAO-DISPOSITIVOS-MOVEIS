import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app_me',
      theme: ThemeData(
        scaffoldBackgroundColor:  Color(0xffc5cae9),
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'APP Maria Eugênia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 400,
                height: 400,
                child: Image.asset('assets/images/Maria.png')),
            Card(
                child: ListTile(
              title: Text('Programação para Aplicativos Moveis'),
              subtitle: Text('Prof: Ely Miranda'),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
