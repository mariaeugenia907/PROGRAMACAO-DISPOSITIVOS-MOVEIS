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
  bool loading = false, allLoaded = false;
  final ScrollController _scrollController = ScrollController();

  Fetch() async {
    if (allLoaded) {
      return;
    }

    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    List<String> newData = album.length >=100?[]: List.generate(20, (index) => 'album ${index + album.length}');
    if (newData.isNotEmpty) {
      album.addAll(newData);
    }
    setState(() {
      loading = false;
      allLoaded = newData.isEmpty;
    });
  }

  void initState(){
    super.initState();
    Fetch();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !loading) {
        Fetch();
      }
    });
  }
  void dispose(){
    super.dispose();
    _scrollController.dispose();
  }
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
        title: Text('Lista de álbuns com infinite scrolling'),
      ),
      body: listaAlbuns(),
    );
  }
  listaAlbuns() {
    if (album.isNotEmpty) {
      return ListView.builder(
          controller: _scrollController,
          itemCount: album.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                album[index].title,
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('ÁLBUM ${album[index].title} CLICADO!')
                  ),
                );
              },
            );
          }

      );
    }
  }
}

