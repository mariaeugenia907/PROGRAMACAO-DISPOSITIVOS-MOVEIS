import 'package:clean/core/error/failure.dart';
import 'package:clean/core/usecases/usecase.dart';
import 'package:clean/features/starwars/domain/entities/informacoes.dart';
import 'package:clean/features/starwars/domain/repositories/informacoes_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


class GetConcreteInformacoes implements UseCase<Informacoes, Params>{
  final InformacoesRepository repository;

  GetConcreteInformacoes(this.repository);

  @override
  Future<Either<Failure, Informacoes>?> call(
      Params params) async {
    return await repository.getConcreteInformacoes(params.number);
  }
}
class Params extends Equatable {
  final int number;

  Params({required this.number});

  @override
  List<Object?> get props => [number];
}