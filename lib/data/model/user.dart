import 'package:flatter_test_projact/core/crypto/crypto.dart';
import 'package:flatter_test_projact/domain/entity/user.dart';
import '../../domain/entity/role.dart';
class User extends UserEntity {
  final String password;
  User(
      {
        super.id,
        required super.login,
        required super.idRole,
        required this.password});

  Map<String, dynamic> toMap() {
    return {'login': login, 'password': Crypto.crypto(password), 'id_role': idRole.id};
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
        id: json['id'] as int,
        login: json['login'],
        idRole: RoleEnum.values.firstWhere((element) => element.id == (json['id_role'] as int)),
        password: json['password']);
  }
}