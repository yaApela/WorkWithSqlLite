import '../../domain/entity/employee.dart';
import '../../domain/entity/role.dart';

class Employee extends EmployeeEntity {
  final String password;
  Employee({
    super.id = 0,
    required super.surname,
    required super.name,
    required super.middlename,
    required super.login,
    required this.password,
    required super.idRole,
  });

  Map<String, dynamic> toMap() {
    return {
      'surname': surname,
      'name': name,
      'middlename': middlename,
      'login': login,
      'password': password,
      'id_role': idRole.id,
    };
  }

  factory Employee.toFromMap(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as int,
      surname: json['surname'],
      name: json['name'],
      middlename: json['middlename'],
      login: json['login'],
      password: json['password'],
      idRole: RoleEnum.values
          .firstWhere((element) => element.id == (json['id_role'] as int)),
    );
  }
}
