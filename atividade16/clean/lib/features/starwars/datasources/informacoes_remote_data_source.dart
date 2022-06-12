
import 'package:clean/features/starwars/data/models/informacoes_model.dart';
import 'package:dartz/dartz.dart';

abstract class InformacoesRemoteDataSource {
  Future<InformacoesModel>? getConcreteInformacoes(int number);
  Future<InformacoesModel> getNumInformacoes();
}