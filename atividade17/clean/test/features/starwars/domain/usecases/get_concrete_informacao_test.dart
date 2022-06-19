import 'package:clean/features/starwars/domain/entities/informacoes.dart';
import 'package:clean/features/starwars/domain/repositories/informacoes_repository.dart';
import 'package:clean/features/starwars/domain/usecases/get_concrete_informacoes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


class MockInformacoesRepository extends Mock implements InformacoesRepository {}

void main() {
  GetConcreteInformacoes usecase;
  MockInformacoesRepository mockInformacoesRepository;
  int number = 1;

  final informeEx = Informacoes(
    id: 1,
    name: 'Luke Skywalker',
    gender: 'male',
  );

  test('should return informacoes', () async {
    mockInformacoesRepository = MockInformacoesRepository();

    when(mockInformacoesRepository.getConcreteInformacoes(number))
        .thenAnswer((_) async => Right(informeEx));

    usecase = GetConcreteInformacoes(mockInformacoesRepository);

    final result = await usecase.call(Params(number: number));
    expect(result, Right(informeEx));
    verify(mockInformacoesRepository.getConcreteInformacoes(number));
    verifyNoMoreInteractions(mockInformacoesRepository);
  });
}