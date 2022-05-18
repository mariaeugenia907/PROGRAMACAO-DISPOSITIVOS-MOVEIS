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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   double _width =100;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Imagem Zoom'),
          ),
          body: Center(
            child: Column(
              children: [
                Slider(
                  value: _width,
                  min: 0,
                  max: 300,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blueGrey,
                  divisions: 20,
                  label: _width.round().toString(),
                  onChanged: (_width) => setState(() {
                    this._width = _width;
                  }),

                ),

                Container(
                  width: _width,
                  child: Image.asset('images/gatos.jpg'),
                ),
              ],
            )
          ),
        )
    );
  }
}
