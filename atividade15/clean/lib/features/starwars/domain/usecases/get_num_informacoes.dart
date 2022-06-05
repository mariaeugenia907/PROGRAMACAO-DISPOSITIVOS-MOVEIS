import 'package:clean/core/error/failure.dart';
import 'package:clean/core/usecases/usecase.dart';
import 'package:clean/features/starwars/domain/entities/informacoes.dart';
import 'package:clean/features/starwars/domain/repositories/informacoes_repository.dart';
import 'package:dartz/dartz.dart';


class GetNumInformacoes implements UseCase<Informacoes, NoParams>{
  final InformacoesRepository repository;

  GetNumInformacoes(this.repository);

  @override
  Future<Either<Failure, Informacoes>?> call(NoParams noParams) async {
    return await repository.getNumInformacoes();
  }
}