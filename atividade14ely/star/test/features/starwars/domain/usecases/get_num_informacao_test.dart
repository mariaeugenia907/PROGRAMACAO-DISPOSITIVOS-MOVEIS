
import 'package:dartz/dartz.dart';
import 'package:star/core/error/failure.dart';
import 'package:star/features/starwars/domain/entities/informacoes.dart';
import 'package:star/features/starwars/domain/repositories/informacoes_repository.dart';

class GetNumInformacoes {
  final InformacoesRepository informacoesRepository;

  GetNumInformacoes(this.informacoesRepository);


  Future<Either<Failure, Informacoes>?> call(int id) async {
    return await informacoesRepository.getNumInformacoes(id);
  }
}