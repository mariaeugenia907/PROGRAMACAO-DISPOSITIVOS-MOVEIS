import 'package:clean/core/network/network_info.dart';
import 'package:clean/features/starwars/data/models/informacoes_model.dart';
import 'package:clean/features/starwars/data/repositories/informacoes_repository_impl.dart';
import 'package:clean/features/starwars/datasources/informacoes_local_data_source.dart';
import 'package:clean/features/starwars/datasources/informacoes_remote_data_source.dart';
import 'package:clean/features/starwars/domain/entities/informacoes.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteDataSource extends Mock implements InformacoesRemoteDataSource{

}

class MockLocalDataSource extends Mock implements InformacoesLocalDataSource{

}

class MockNetworkInfo extends Mock implements NetworkInfo{

}

void main(){
  late InformacoesRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late  MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;


  setUp((){
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = InformacoesRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }
  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }
  group('getConcreteInformacoes', () {
    final number = 1;
    final InformeModel =
    InformacoesModel(id: 1,
        name: 'Luke Skywalker',
        gender: 'male');
    final Informacoes informeEx = InformeModel;
    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      repository.getConcreteInformacoes(number);
      //assert
      verify(mockNetworkInfo.isConnected);
    });
    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
              () async {
            //arrange
            when(mockRemoteDataSource.getConcreteInformacoes(number))
                .thenAnswer((_) async => InformeModel);
            //act
            final result = await repository.getConcreteInformacoes(number);
            //assert
            verify(mockRemoteDataSource.getConcreteInformacoes(number));
            expect(result, equals(Right(informeEx)));
          });

      runTestsOffline(() {
        test(
            'should return last locally cached data when the cached data is present',
                () async {
              //arrange
              when(mockLocalDataSource.getLastInformacoes())
                  .thenAnswer((_) async => InformeModel);
              //act
              final result = await repository.getConcreteInformacoes(number);
              //assert
              verifyZeroInteractions(mockRemoteDataSource);
              verify(mockLocalDataSource.getLastInformacoes());
              expect(result, equals(Right(informeEx)));
            });
      }
      );
    }
    );
  }
  );
}