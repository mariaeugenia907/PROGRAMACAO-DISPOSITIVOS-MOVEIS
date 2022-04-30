import 'package:flutter/material.dart';
import 'database.dart';
import 'leitura_form.dart';
import 'livros.dart';

class List_leitura extends StatelessWidget {
  const List_leitura({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listaitens();
  }
}

class listaitens extends StatefulWidget {
  const listaitens({Key? key}) : super(key: key);
  @override
  State<listaitens> createState() => _listaitensState();
}

class _listaitensState extends State<listaitens> {
final livros = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de leituras'),
      ),
      body: FutureBuilder<List<Livros>>(
        initialData: [],
        future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
        builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
                case ConnectionState.waiting:
        return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              CircularProgressIndicator(),
                  Text('Carregando...')
    ],
    ),
    );
    break;
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            final List<Livros> livros = snapshot.data as List<Livros>;
        return  ListView.builder(
        itemBuilder: (context, index){
         final livro = livros[index];
          return _LeituraItem(livro);
        },
        itemCount: livros.length,
      );
      break;
    }
            return Text('Erro identificado');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => LeituraForm(),
          ),
          );
        },
        child: Icon(Icons.add_comment_outlined),
      ),
    );
  }
}

class _LeituraItem extends StatelessWidget {

final Livros livros;
const _LeituraItem(this.livros);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          livros.livro,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          livros.situacao,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

