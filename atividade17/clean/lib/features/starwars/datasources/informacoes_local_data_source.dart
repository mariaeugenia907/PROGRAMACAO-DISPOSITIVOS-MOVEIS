import 'dart:convert';

import 'package:clean/core/error/exceptions.dart';
import 'package:clean/features/starwars/data/models/informacoes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class InformacoesLocalDataSource{
  Future<InformacoesModel>? getLastInformacoes();
  Future<void>? cacheInformacoes(InformacoesModel informeToCache);
}

const CACHED_INFORMACOES = 'CACHED_INFORMACOES';

class InformacoesLocalDataSourceImpl implements InformacoesLocalDataSource{
  final SharedPreferences sharedPreferences;

  InformacoesLocalDataSourceImpl({
      required this.sharedPreferences});

  @override
  Future<InformacoesModel>? getLastInformacoes() {
    final jsonString = sharedPreferences.getString(CACHED_INFORMACOES);
    if (jsonString != null) {
    return Future.value(InformacoesModel.fromJson(json.decode(jsonString)));
  } else{
    throw CacheException();
    }
  }

  @override
  Future<void>? cacheInformacoes(InformacoesModel informeToCache) {
    // TODO: implement cacheInformacoes
    return sharedPreferences.setString(
        CACHED_INFORMACOES, json.encode(informeToCache.toJson()));
  }


  
}