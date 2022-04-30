// @dart=2.9
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HorizontalList.dart';
import 'list_amigos.dart';
import 'list_leitura.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom( backgroundColor: Colors.tealAccent)
      )),
      home: HomePage(),
    )
    );
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final loading = ValueNotifier(false);
  final List<String> images = [
    'images/01.jpg',
    'images/02.jpg',
    'images/03.jpg',
    'images/04.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.teal,
        title: Text('Ler+'),
      ),
      body: ListView(
        children:[ CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: false,
            enableInfiniteScroll: false,
            autoPlay: true,
          ),
          items: images.map((e) =>
              ClipRect(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(e,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,)
                  ],
                ),
              )).toList(),
        ),
          SizedBox(
            height: 10,
          ),
          new Padding(padding: const EdgeInsets.all(8.0),
            child: Text('Aqui você pode encontrar histórias de',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'IndieFlower-Regular',
              ),
          ),
          ),
          SizedBox(
             height: 5,
           ),
           HorizontalList(),
          SizedBox(
            height: 5,
          ),
          new Padding(padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text('Solicite um exemplar com nossos leitores-amigos e controle suas leituras...',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'IndieFlower-Regular',
              ),
            ),
          ),
          ),
         new Padding(padding: const EdgeInsets.all(8.0),

           child: SizedBox(

            child: ElevatedButton(

              child:AnimatedBuilder(
                animation: loading,
                builder: (context, _){
                  return loading.value
                  ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(),

                  )
                  : Text('Amigos-leitores',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black),
                  );
                }

              ),
                onPressed: () async {
                  loading.value = !loading.value;
                  await Duration(milliseconds: 500);
                  print('ir para listajson');
                Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => List_amigos()
                ),
                );
                },
    ),
    ),
    ),
      new Padding(padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child:ElevatedButton(
              onPressed: (){
                print('ir para lista');
                Navigator.push(context,
                    MaterialPageRoute(
                    builder: (context) => List_leitura()
                    ),
                );
              }, child: Text('Lista de leituras',
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.black),
          ),
    ),
    ),
      ),
]
      ),

    );
  }

}

