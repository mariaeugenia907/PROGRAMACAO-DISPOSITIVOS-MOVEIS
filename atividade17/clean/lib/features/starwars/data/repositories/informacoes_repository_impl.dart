import 'package:clean/core/error/exceptions.dart';
import 'package:clean/core/error/failure.dart';
import 'package:clean/core/network/network_info.dart';
import 'package:clean/features/starwars/data/models/informacoes_model.dart';
import 'package:clean/features/starwars/datasources/informacoes_local_data_source.dart';
import 'package:clean/features/starwars/datasources/informacoes_remote_data_source.dart';
import 'package:clean/features/starwars/domain/entities/informacoes.dart';
import 'package:clean/features/starwars/domain/repositories/informacoes_repository.dart';
import 'package:dartz/dartz.dart';

typedef Future<InformacoesModel> _ConcreteOrNumChooser();

class InformacoesRepositoryImpl implements InformacoesRepository{
  final InformacoesRemoteDataSource remoteDataSource;
  final InformacoesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  InformacoesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, Informacoes>> getConcreteInformacoes(
      int number,
      ) async {
    return await _getInforme(() {
      return remoteDataSource.getConcreteInformacoes(number)!;
    });
  }

  @override
  Future<Either<Failure, Informacoes>> getNumInformacoes() async {
    return await _getInforme(() {
      return remoteDataSource.getNumInformacoes();
    });
  }

  Future<Either<Failure, Informacoes>> _getInforme(
      _ConcreteOrNumChooser getConcreteOrNum) async {
    if (await networkInfo.isConnected) {
      try{
        final remoteinforme = await getConcreteOrNum();
        localDataSource.cacheInformacoes(remoteinforme!);
        return Right(remoteinforme);
      } on ServerException{
        return Left(ServerFailure());
      }
    } else{
      try{
        final localInforme = await localDataSource.getLastInformacoes();
        return Right (localInforme!);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}