import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Informacoes extends Equatable {
  final String name;
  final String url;
  final int mass;

  Informacoes({
  required this.name,
    required this.url,
    required this.mass,
});

factory Informacoes.fromJson(Map<String, dynamic> json) => Informacoes(
name: json["name"],
url: json["url"],
mass: json["mass"],
);

Map<String, dynamic> toJson() => {
  "name": name,
  "url": url,
  "mass": mass,
};
@override
List<Object?> get props => [name, url, mass];
}