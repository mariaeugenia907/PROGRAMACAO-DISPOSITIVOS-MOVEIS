import 'package:clean/features/starwars/data/models/informacoes_model.dart';

abstract class InformacoesLocalDataSource{
  Future<InformacoesModel>? getLastInformacoes();
  Future<void>? cacheInformacoes(InformacoesModel informeToCache);
}