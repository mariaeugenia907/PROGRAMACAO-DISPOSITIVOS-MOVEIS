import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:leitura/user.dart';
import 'api.dart';

class List_amigos extends StatelessWidget {
  const List_amigos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildListView();
  }
}

class BuildListView extends StatefulWidget {
  const BuildListView({Key? key}) : super(key: key);

  @override
  State<BuildListView> createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  var users = [];

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        users = lista.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  _BuildListViewState() {
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicite o livro que deseja'),
      ),
      body: listaUsuarios(),
    );
  }

  listaUsuarios() {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
             backgroundImage: NetworkImage(
               'https://png.pngtree.com/element_origin_min_pic/00/00/06/12575cb97a22f0f.jpg'
             ),
            ),
            title: Text(
                users[index].name,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            subtitle: Text(
              users[index].email
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Amigo ${users[index].name} é seu contato!')
                ),

              );
            },
          );
        }
    );
  }
}