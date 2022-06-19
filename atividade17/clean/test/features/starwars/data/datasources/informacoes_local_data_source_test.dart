import 'dart:convert';

import 'package:clean/core/error/exceptions.dart';
import 'package:clean/features/starwars/data/models/informacoes_model.dart';
import 'package:clean/features/starwars/datasources/informacoes_local_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences{}

void main(){
  late InformacoesLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

setUp((){
  mockSharedPreferences = MockSharedPreferences();
  dataSource = InformacoesLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences);
});

  group('getLastInformacoes', () {
    final informeModel =
    InformacoesModel.fromJson(json.decode(fixture('informe_cached.json')));
    test(
        'should return Informacoes from SharedPreferences when there is one in the cache',
            () async {
          //arrange
          when(mockSharedPreferences.getString(' '))
              .thenReturn(fixture('informe_cached.json'));
          //act
          final result = await dataSource.getLastInformacoes();
          //assert
          verify(mockSharedPreferences.getString(CACHED_INFORMACOES));
          expect(result, equals(informeModel));
        });
    test('should throw a CacheException when there is not a cached value',
            () async {
          //arrange
          when(mockSharedPreferences.getString(' ')).thenReturn(null);
          //act
          final call = dataSource.getLastInformacoes;
          //assert
          expect(() => call(), throwsA(TypeMatcher<CacheException>()));
        });
  });

  group('cacheInformacoes', () {
    final informeModel =
    InformacoesModel( id: 1, name: 'teste', gender: 'teste',);
    test('should call SharedPreferences to cache the data', () async {
      //act
      dataSource.cacheInformacoes(informeModel);
      //assert
      final expectedJsonString = json.encode(informeModel.toJson());
      verify(mockSharedPreferences.setString(
          CACHED_INFORMACOES, expectedJsonString));
    });
  });
  }

