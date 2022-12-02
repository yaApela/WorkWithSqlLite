import 'dart:io';

import 'package:flatter_test_projact/data/model/user.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../../common/data_base_request.dart';
import '../../data/model/bicycle.dart';
import '../../data/model/client.dart';
import '../../data/model/employee.dart';
import '../../data/model/mark.dart';
import '../../data/model/model.dart';
import '../../data/model/period.dart';
import '../../data/model/receipt.dart';
import '../../data/model/receiptFinal.dart';
import '../../data/model/role.dart';
import '../../domain/entity/model.dart';
import '../../domain/entity/period.dart';
import '../../domain/entity/role.dart';
class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();
  DataBaseHelper._instance();
  final int _version = 2;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  Future<void> init() async {
    _appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'Prakticheskay3_bd.db');

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
            onCreate: (db, version) => onCreateTable(db),
          ));
    } else {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
        onCreate: (db, version) => onCreateTable(db),
      );
    }
  }
  Future<void> onInitTable(Database db) async {
    try {
      for (var element in RoleEnum.values) {
        db.insert(DataBaseRequest.tableRole, Role(role: element.name).toMap());
      }
      for (var element in PeriodEnum.values) {
        db.insert(DataBaseRequest.tablePeriod,
            Period(period: element.period).toMap());
      }
      for (var element in ModelEnum.values) {
        db.insert(
            DataBaseRequest.tableModel, Model(model: element.model).toMap());
      }
      db.insert(
          DataBaseRequest.tableUser,
          User(
              login: 'Apela1234!',
              idRole: RoleEnum.admin,
              password: 'Apela1234!')
              .toMap());

      db.insert(DataBaseRequest.tableClient,
          Client(surname: 'Lolkin', name: 'Kiril', middlename: 'Pavlovich').toMap());

      db.insert(DataBaseRequest.tableMark,
          Mark(maker: 'Decathlon', idModel: ModelEnum.model1).toMap());
      db.insert(DataBaseRequest.tableMark,
          Mark(maker: 'Forward', idModel: ModelEnum.model2).toMap());
      db.insert(DataBaseRequest.tableMark,
          Mark(maker: 'GTBicycles', idModel: ModelEnum.model3).toMap());
      db.insert(DataBaseRequest.tableMark,
          Mark(maker: 'Pirelli', idModel: ModelEnum.model4).toMap());
      db.insert(DataBaseRequest.tableMark,
          Mark(maker: 'Stark', idModel: ModelEnum.model5).toMap());
      db.insert(
          DataBaseRequest.tableBicycle,
          Bicycle(
            number: '4325121',
            year: '2022',
            idClient: 1,
            idMark: 1,
          ).toMap());
      db.insert(
          DataBaseRequest.tableReceipt,
          Receipt(
            idSotr: 1,
            idBicycle: 1,
          ).toMap());

      db.insert(
          DataBaseRequest.tableReceiptFinal,
          ReceiptFinal(
            idReceipt: 1,
            idPeriod: PeriodEnum.time1,
          ).toMap());
      db.insert(
          DataBaseRequest.tableReceiptFinal,
          ReceiptFinal(
            idReceipt: 1,
            idPeriod: PeriodEnum.time2,
          ).toMap());
      db.insert(
          DataBaseRequest.tableReceiptFinal,
          ReceiptFinal(
            idReceipt: 1,
            idPeriod: PeriodEnum.time3,
          ).toMap());
    } on DatabaseException catch (error) {
      print(error.result);
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }
    await onInitTable(db);
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    await onCreateTable(db);
  }

  Future<void> onDropDataBse() async {
    await database.close();

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
