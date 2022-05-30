
import 'package:dartz/dartz.dart';
import 'package:star/core/error/failure.dart';
import 'package:star/features/starwars/domain/entities/informacoes.dart';

abstract class InformacoesRepository {
  Future<Either<Failure, List<Informacoes>>> getConcreteInformacoes();
  Future<Either<Failure, Informacoes>> getNumCharacter(int mass);
}
