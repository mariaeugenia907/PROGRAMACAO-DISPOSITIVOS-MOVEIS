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
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController umController = new TextEditingController();
  TextEditingController doisController = new TextEditingController();
  TextEditingController tresController = new TextEditingController();

  late FocusNode myFocusNode;

  String _msg = '';

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode =FocusNode();
  }

@override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Home Page')),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  autofocus: true,
                  controller: umController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Enter nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: doisController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tresController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Enter senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(onPressed: (){
                  FocusScope.of(context).requestFocus(myFocusNode);
                  var um = umController.text;
                  var dois = doisController.text;
                  var tres = tresController.text;
                  setState(() {
                    _msg = "Nome : $um\nEmail : $dois\nSenha : $tres";
                  });
                },
                    child: Text('enter')),
              ),
              Padding(padding: const EdgeInsets.all(8),
                child: Text(_msg),
              ),

            ],
          ),
        ),
    );
  }
}

