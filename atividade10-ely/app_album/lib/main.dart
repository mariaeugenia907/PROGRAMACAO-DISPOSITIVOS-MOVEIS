import 'dart:convert';
import 'package:flutter/material.dart';

import 'album.dart';
import 'api.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Http~Json-ListView',
      home: BuildListView(),
    );
  }
}

class BuildListView extends StatefulWidget {
  const BuildListView({Key? key}) : super(key: key);

  @override
  State<BuildListView> createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  var album = [];
  _getUsers(){
    API.getUsers().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        album = lista.map((model) => Album.fromJson(model)).toList();
      });
    });
  }

  _BuildListViewState(){
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de álbuns'),
      ),
      body: listaAlbuns(),
    );
  }
  listaAlbuns() {
    return ListView.builder(
        itemCount: album.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
                album[index].title,
                style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),
              ),
              onTap:(){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('ÁLBUM ${album[index].title} CLICADO!')
                  ),
                );
              }
          );
        }
    );
  }
}

