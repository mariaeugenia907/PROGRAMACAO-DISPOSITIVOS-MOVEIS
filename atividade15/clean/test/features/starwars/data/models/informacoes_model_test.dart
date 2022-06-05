import 'dart:convert';

import 'package:clean/features/starwars/data/models/informacoes_model.dart';
import 'package:clean/features/starwars/domain/entities/informacoes.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main(){
  final informeModel = InformacoesModel(
    id: 1, name: 'teste', gender: 'teste',
  );
  test('should be a subclass of entity', () async{
  expect(informeModel, isA<Informacoes>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer',
            () async {
          final Map<String, dynamic> jsonMap = json.decode(
              fixture('informe.json'));
          final result = InformacoesModel.fromJson(jsonMap);

          expect(result, equals(informeModel));
        });
  }  );

}