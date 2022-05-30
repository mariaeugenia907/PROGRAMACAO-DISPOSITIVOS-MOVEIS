
import 'package:dartz/dartz.dart';
import 'package:star/core/error/failure.dart';
import 'package:star/features/starwars/domain/entities/informacoes.dart';
import 'package:star/features/starwars/domain/repositories/informacoes_repository.dart';

class GetConcreteInformacoes{
  final InformacoesRepository repository;

  GetConcreteInformacoes(this.repository);

  @override
  Future<Either<Failure, List<Informacoes>>?> call() async {
    return await repository.getConcreteInformacoes();
  }
}