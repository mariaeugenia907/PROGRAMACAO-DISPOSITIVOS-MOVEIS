import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post/api.dart';
import 'package:post/user.dart';

class DetailPage extends StatelessWidget {

  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return userDetails();
  }
}

class userDetails extends StatefulWidget {
  const userDetails({Key? key}) : super(key: key);

  @override
  State<userDetails> createState() => _userDetailsState();
}

class _userDetailsState extends State<userDetails> {

  var users2 = [];
  _getUsers2(){
    API2.getUsers2().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        users2 = lista.map((model) => User2.fromJson(model)).toList();
      });
    });
  }

  _userDetailsState(){
    _getUsers2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova lista'),
      ),
      body: listaDetalhes(),
    );
  }
  listaDetalhes(){
    return ListView.builder(
        itemCount: users2.length,
        itemBuilder: (context, index){
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
'https://jbs.com.br/wp-content/uploads/2019/10/icon02_contato_jbs.png'
          ),
        ),
          title:
          Text(
          users2[index].name,
          style: TextStyle(
          fontSize: 16.0,
          color: Colors.black
      ),
    ),
        subtitle:
        Text(
            users2[index].email,
          style: TextStyle(
              fontSize: 12.0,
              color: Colors.black
          ),
        ),
  );
},
);
}
}

