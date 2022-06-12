import 'package:clean/core/error/failure.dart';
import 'package:clean/core/usecases/usecase.dart';
import 'package:clean/features/starwars/domain/entities/informacoes.dart';
import 'package:clean/features/starwars/domain/repositories/informacoes_repository.dart';
import 'package:clean/features/starwars/domain/usecases/get_num_informacoes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_concrete_informacao_test.dart';

void main() {
  GetNumInformacoes usecase;
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

    usecase = GetNumInformacoes(mockInformacoesRepository);

    final result = await usecase.call(NoParams());
    expect(result, Right(informeEx));
    verify(mockInformacoesRepository.getConcreteInformacoes(number));
    verifyNoMoreInteractions(mockInformacoesRepository);
  });
}