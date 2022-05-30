
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:star/features/starwars/domain/entities/informacoes.dart';
import 'package:star/features/starwars/domain/repositories/informacoes_repository.dart';
import 'package:star/features/starwars/domain/usecases/get_concrete_informacoes.dart';

class MockInformacoesRepository extends Mock implements InformacoesRepository {}

void main() {
  GetConcreteInformacoes usecase;
  MockInformacoesRepository mockInformacoesRepository;

  final informeEx = Informacoes(
    id: 1,
    name: 'Luke Skywalker',
    gender: 'male',
  );

  test('should return informacoes', () async {
    mockInformacoesRepository = MockInformacoesRepository();

    when(mockInformacoesRepository.getConcreteInformacoes())
        .thenAnswer((_) async => Right(informeEx));

    usecase = GetConcreteInformacoes(mockInformacoesRepository);

    final result = await usecase.call();
    expect(result, Right(informeEx));

    verify(mockInformacoesRepository.getConcreteInformacoes());
    verifyNoMoreInteractions(mockInformacoesRepository);
  });
}
