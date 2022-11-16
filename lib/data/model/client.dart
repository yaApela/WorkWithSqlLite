import '../../domain/entity/client.dart';

class Client extends ClientEntity {
  Client({
    super.id = 0,
    required super.surname,
    required super.name,
    required super.middlename,
  });

  Map<String, dynamic> toMap() {
    return {
      'surname': surname,
      'name': name,
      'middlename': middlename,
    };
  }

  factory Client.toFromMap(Map<String, dynamic> json) {
    return Client(
      id: json['id'] as int,
      surname: json['surname'],
      name: json['name'],
      middlename: json['middlename'],
    );
  }
}