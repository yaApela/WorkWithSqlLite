import 'package:flatter_test_projact/domain/entity/role.dart';

class EmployeeEntity {
  late int id;
  final String surname;
  final String name;
  final String middlename;
  final int idUser;

  EmployeeEntity({
    this.id = 0,
    required this.surname,
    required this.name,
    required this.middlename,
    required this.idUser
  });
}
