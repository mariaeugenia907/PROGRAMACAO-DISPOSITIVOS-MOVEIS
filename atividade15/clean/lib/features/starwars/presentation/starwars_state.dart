import 'package:equatable/equatable.dart';

abstract class StarWarsState extends Equatable {
  const StarWarsState();

  @override
  List<Object> get props => [];
}

class Empty extends StarWarsState {}