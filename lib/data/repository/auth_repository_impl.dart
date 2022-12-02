
import 'package:dartz/dartz.dart';
import 'package:flatter_test_projact/common/data_base_request.dart';
import 'package:flatter_test_projact/core/crypto/crypto.dart';
import 'package:flatter_test_projact/core/db/data_base_helper.dart';
import 'package:flatter_test_projact/core/exception/failure.dart';
import 'package:flatter_test_projact/data/model/user.dart';
import 'package:flatter_test_projact/domain/entity/role.dart';
import 'package:flatter_test_projact/domain/repository/auth_repositories.dart';
import 'package:sqflite/sqflite.dart';

class AuthRepositoryImpl implements AuthRepositories {
  final _db = DataBaseHelper.instance.database;

  String table = DataBaseRequest.tableUser;

  @override
  Future<Either<Failure, RoleEnum>> signIn(
      String login, String password) async {
    try {
      var user = await _db.query(table, where: 'login = ?', whereArgs: [login]);

      if (user.isEmpty) {
        return Left(AuthUserEmptyFailure());
      }

      if (user.first['password'] != Crypto.crypto(password)) {
        return Left(AuthPasswordFailure());
      }

      return Right(
        RoleEnum.values.firstWhere(
          (element) => element.id == user.first['id_role'],
        ),
      );
    } on DatabaseException catch (ex) {
      return Left(FailureImpl(ex.getResultCode()!).error);
    }
  }

  @override
  Future<Either<Failure, bool>> signUp(String login, String password) async {
    try {
      await _db.insert(
        table,
        User(login: login, idRole: RoleEnum.user, password: password).toMap(),
      );

      return Right(true);
    } on DatabaseException catch (ex) {
      return Left(FailureImpl(ex.getResultCode()!).error);
    }
  }
}
