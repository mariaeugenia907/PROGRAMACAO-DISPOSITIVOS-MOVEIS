import 'dart:convert';

import 'package:clean/core/error/exceptions.dart';
import 'package:clean/features/starwars/data/models/informacoes_model.dart';
import 'package:clean/features/starwars/datasources/informacoes_local_data_source.dart';
import 'package:clean/features/starwars/datasources/informacoes_remote_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../fixtures/fixtures_reader.dart';

class MockHttpClient extends Mock implements http.Client{}

void main(){
 late InformacoesRemoteDataSourceImpl dataSource;
 late MockHttpClient mockHttpClient;

 setUp((){
   mockHttpClient = MockHttpClient();
   dataSource = InformacoesRemoteDataSourceImpl(client: mockHttpClient);
 });
 
 group('getConcreteNumberTrivia', () {
   final number = 1;

   test('should perform a GET request on a URL',
         () async {
       when(mockHttpClient.get(any, headers: anyNamed('headers')))
           .thenAnswer((_) async => http.Response(fixture('informe.json'), 5));

       dataSource.getConcreteInformacoes(number);

       verify(mockHttpClient.get('https://swapi.dev/api/people/$number',
           headers: {
             'Content-Type': 'aplication/json',
           }
       ));
     },
   );
 });
}