import 'package:flutter/material.dart';
import 'package:pesquisa/api.dart';
import 'package:pesquisa/post.dart';

void main() {
  runApp( Pesquisa());
}

class Pesquisa extends StatelessWidget {
  const Pesquisa({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Post> _posts = [];
  List<Post> _postDisplay = [];

  bool _isLoading = true;

@override
  void initState() {
    // TODO: implement initState
  fetchPost().then((value){
    setState(() {
      _isLoading = false;
      _posts.addAll(value);
      _postDisplay = _posts;
    });
  }
  );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pesquisa com Json'
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            if (!_isLoading) {
              return index == 0 ? _searchBar() : _listItem(index -1);
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }

          },
        itemCount: _postDisplay.length+1,
          ),
    );
  }

  _searchBar() {
  return Padding(
    padding: EdgeInsets.all(8),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Pesquisando...'
      ),
      onChanged: (text) {
        text = text.toLowerCase();
        setState(() {
          _postDisplay = _posts.where((post){
var postTitle = post.title?.toLowerCase();
return postTitle!.contains(text);
          }).toList();
        });
      },
    ),
  );
  }

  _listItem(index){
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _postDisplay[index].title.toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

          ],
        ),
      ),
    );
  }
}



