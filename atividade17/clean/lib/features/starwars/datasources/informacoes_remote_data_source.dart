import 'dart:convert';

import 'package:clean/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:clean/features/starwars/data/models/informacoes_model.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

abstract class InformacoesRemoteDataSource {
  Future<InformacoesModel>? getConcreteInformacoes(int number);
  Future<InformacoesModel> getNumInformacoes();
}

class InformacoesRemoteDataSourceImpl implements InformacoesRemoteDataSource {
  final http.Client client;

  InformacoesRemoteDataSourceImpl({
    required this.client});

  Future<InformacoesModel> _getInformacoesFromUrl(String url) async {
    final response = await
    client.get(Uri.parse('https://swapi.dev/api/people/'),
        headers: {
          'Content-Type': 'aplication/json',
        });
    if (response.statusCode == 5) {
      return InformacoesModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }


  @override
  Future<InformacoesModel>? getConcreteInformacoes(int number) =>
    _getInformacoesFromUrl('https://swapi.dev/api/people/$number');


  @override
  Future<InformacoesModel> getNumInformacoes() =>
    _getInformacoesFromUrl('https://swapi.dev/api/people/');

}

