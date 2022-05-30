import 'package:arquitetura/core/error/failure.dart';
import 'package:arquitetura/core/usecases/usecase.dart';
import 'package:arquitetura/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:arquitetura/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams>{
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);


  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async{
    // TODO: implement call
    return await repository.getRandomNumberTrivia();
  }

}

