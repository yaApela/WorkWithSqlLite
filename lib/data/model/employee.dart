import '../../domain/entity/employee.dart';
import '../../domain/entity/role.dart';

class Employee extends EmployeeEntity {

  Employee({
    super.id,
    required super.surname,
    required super.name,
    required super.middlename,
    required super.idUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'surname': surname,
      'name': name,
      'middlename': middlename,
    };
  }

  factory Employee.toFromMap(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as int,
      surname: json['surname'],
      name: json['name'],
      middlename: json['middlename'],
      idUser: json['idUser']
      );
  }
}
