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

  List<bool> isSelected = List.generate(3, (_)=> false);
  String textFormat = 'Azar de quem não tem gato preto';

  bool negrito =false;
  bool italico = false;
  bool sublinhado =false;

  void format(int index){
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        if (index == 0) {
          negrito = !negrito;
        } else if (index == 1) {
          italico = !italico;
        } else if (index == 2) {
          sublinhado = !sublinhado;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Formatando')
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                children: [
                  Icon(Icons.format_bold),
                  Icon(Icons.format_italic),
                  Icon(Icons.format_underline),
                ],
                isSelected: isSelected,
                onPressed: (int index){
                  setState(() {
                    isSelected[index] = !isSelected[index];
                    format(index);
                  }
                  );
                },
              ),
              SizedBox(height: 25,),
              Center(
                child: Container(
                  child: Text(
                    textFormat,
                    style: TextStyle(
                      fontWeight: negrito ? FontWeight.bold : FontWeight.normal,
                      fontStyle: italico ?FontStyle.italic: FontStyle.normal,
                      decoration: sublinhado ? TextDecoration.underline : TextDecoration.none,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


