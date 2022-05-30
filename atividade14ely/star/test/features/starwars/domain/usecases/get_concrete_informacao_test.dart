
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:star/features/starwars/domain/entities/informacoes.dart';
import 'package:star/features/starwars/domain/repositories/informacoes_repository.dart';
import 'package:star/features/starwars/domain/usecases/get_concrete_informacoes.dart';

@GenerateMocks([InformacoesRepository])
void main() {
  final mockInformacoesRepository = MockInformacoesRepository;
  late GetConcreteInformacoes usecase;

  setUp(() {
    usecase = GetConcreteInformacoes(mockInformacoesRepository);

  });

  final Informacao = Informacoes(
    name: 'name',
    url: 'url', mass: 1,

  );

final mass =1;

  test('Shoul return a single character', () async {
    when(() => mockInformacoesRepository.getNumCharacter(mass))
        .thenAnswer((_) async => Right(mass));

    final result = await usecase.call(mass);

    expect(result, Right(mass));

    verify(() => mockInformacoesRepository.getNumCharacter(mass));
    verifyNoMoreInteractions(mockInformacoesRepository);
  });
}
