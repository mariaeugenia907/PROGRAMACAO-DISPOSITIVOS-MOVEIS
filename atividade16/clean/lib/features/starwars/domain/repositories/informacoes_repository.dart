import 'package:clean/core/error/failure.dart';
import 'package:clean/features/starwars/domain/entities/informacoes.dart';
import 'package:dartz/dartz.dart';


abstract class InformacoesRepository {
  Future<Either<Failure, Informacoes>> getConcreteInformacoes(int number);
  Future<Either<Failure, Informacoes>> getNumInformacoes();
}