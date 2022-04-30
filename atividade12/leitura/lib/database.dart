import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'livros.dart';

Future<Database> createDatabase(){
  return getDatabasesPath().then((dbPath){
    final String path = join(dbPath, 'leitura.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE leitura('
          'id INTEGER PRIMARY KEY, '
          'livro TEXT, '
          'situacao TEXT)'
      );
    }, version: 1,
     onDowngrade: onDatabaseDowngradeDelete,
    );
  }
  );
}

Future<int> save(Livros livros){
  return createDatabase().then((db){
    final Map<String, dynamic> livrosMap = Map();
    livrosMap['livro'] = livros.livro;
    livrosMap['situacao'] = livros.situacao;
    return db.insert('leitura', livrosMap);
  });
}

Future<List<Livros>> findAll(){
  return createDatabase().then((db) {
   return db.query('leitura').then((maps) {
      final List<Livros> livros = [];
      for(Map<String, dynamic> map in maps){
        final Livros livro = Livros(
            map['id'],
            map['livro'],
            map['situacao']
        );
        livros.add(livro);
      }
      return livros;
    });
  });
}