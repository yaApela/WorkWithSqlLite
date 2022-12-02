import 'package:dartz/dartz.dart';
import 'package:flatter_test_projact/core/exception/failure.dart';
import 'package:flatter_test_projact/domain/entity/role.dart';
import '../entity/user.dart';

abstract class UserRepositories {
  String get table;

  Future<List<UserEntity>> getAll();
  Future<Either<Failure, UserEntity>> insert(
    String login,
    String password,
    RoleEnum idRole,
  );
  Future<Either<Failure, bool>> delete(int id);
}
