import 'package:clean/features/starwars/domain/entities/informacoes.dart';

class InformacoesModel extends Informacoes{
  InformacoesModel({
    required int id,
    required String name,
    required String gender,
  }) : super(id: id, name: name, gender: gender,);

  factory InformacoesModel.fromJson(Map<String, dynamic> json){
    return InformacoesModel(
        id: (json['id']).toInt(),
        name: json['name'],
        gender: json['gender']
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'gender': gender};
  }
}