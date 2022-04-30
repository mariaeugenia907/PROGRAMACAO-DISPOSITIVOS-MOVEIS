import 'package:flutter/material.dart';

import 'database.dart';
import 'livros.dart';

class LeituraForm extends StatefulWidget {

  @override
  State<LeituraForm> createState() => _LeituraFormState();
}

class _LeituraFormState extends State<LeituraForm> {
  final TextEditingController _livroController = TextEditingController();

  final TextEditingController _situacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo livro para ler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _livroController,
              decoration: InputDecoration(
                labelText: 'Nome do Livro'
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            TextField(
              controller: _situacaoController,
              decoration: InputDecoration(
                  labelText: 'Situação de leitura'
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            ElevatedButton(
              onPressed: (){
                final String livro = _livroController.text;
                final String situacao = _situacaoController.text;
                final Livros newLivro = Livros(0, livro, situacao);
                save(newLivro).then((id)=> Navigator.pop(context));
                },
                child: Text('Adicionar livro',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
