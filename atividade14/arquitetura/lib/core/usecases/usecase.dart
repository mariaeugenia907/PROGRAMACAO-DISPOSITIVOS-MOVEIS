import 'package:arquitetura/core/error/failure.dart';
import 'package:arquitetura/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}