import '../../domain/entity/bicycle.dart';

class Bicycle extends BicycleEntity {
  Bicycle({
    super.id = 0,
    required super.number,
    required super.year,
    required super.idClient,
    required super.idMark,
  });
  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'year': year,
      'id_client': idClient,
      'id_mark': idMark,
    };
  }
  factory Bicycle.toFromMap(Map<String, dynamic> json) {
    return Bicycle(
      id: json['id'] as int,
      number: json['number'],
      year: json['year'],
      idClient: json['id_client'] as int,
      idMark: json['id_mark'] as int,
    );
  }
}