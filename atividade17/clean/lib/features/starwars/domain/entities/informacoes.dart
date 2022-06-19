import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Informacoes extends Equatable {
  final int id;
  final String name;
  final String gender;

  Informacoes({
    required this.id,
    required this.name,
    required this.gender,

  });


  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender": gender,

  };
  @override
  List<Object?> get props => [id, name, gender];
}