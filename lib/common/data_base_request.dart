abstract class DataBaseRequest {
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const String tableRole = "role";
  static const String tableModel = "model";
  static const String tablePeriod = "period";
  static const String tableClient = "client";
  static const String tableMark = "mark";
  static const String tableBicycle = "bicycle";
  static const String tableReceipt = "receipt";
  static const String tableReceiptFinal  = "receiptfinal";
  static const String tableEmployee = "employee";

  static const List<String> tableList = [
    tableRole,
    tableModel,
    tablePeriod,
    tableClient,
    tableMark,
    tableBicycle,
    tableEmployee,
    tableReceipt,
    tableReceiptFinal
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableModel,
    _createTablePeriod,
    _createTableClient,
    _createTableMark,
    _createTableBicycle,
    _createTableEmployee,
    _createTableReceipt,
    _createTableReceiptFinal
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Model
  static const String _createTableModel =
      'CREATE TABLE "$tableModel" ("id" INTEGER,"model" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Period
  static const String _createTablePeriod =
      'CREATE TABLE "$tablePeriod" ("id" INTEGER,"dostup" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Client
  static const String _createTableClient =
      'CREATE TABLE "$tableClient" ("id"	INTEGER,"fam" TEXT NOT NULL,"name"	TEXT NOT NULL,"otch"	TEXT NULL, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Mark
  static const String _createTableMark =
      'CREATE TABLE "$tableMark" ("id"	INTEGER,"mark" TEXT NOT NULL,"id_model"	INTEGER,FOREIGN KEY("id_model") REFERENCES "model"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Bicycle
  static const String _createTableBicycle =
      'CREATE TABLE "$tableBicycle" ("id"	INTEGER,"number" TEXT NOT NULL,"year"	TEXT NOT NULL,"id_mark"	INTEGER, "id_client" INTEGER, FOREIGN KEY ("id_client") REFERENCES "client"("id") ON DELETE CASCADE, FOREIGN KEY("id_mark") REFERENCES "mark"("id") ON DELETE CASCADE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Receipt
  static const String _createTableReceipt =
      'CREATE TABLE "$tableReceipt" ("id"	INTEGER,"id_car"	INTEGER,"id_sotr"	INTEGER,FOREIGN KEY("id_sotr") REFERENCES "sotrudnik"("id") ON DELETE CASCADE, FOREIGN KEY("id_car") REFERENCES "car"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы ReceiptFinal
  static const String _createTableReceiptFinal =
      'CREATE TABLE "$tableReceiptFinal" ("id"	INTEGER,"id_dostup"	INTEGER,"id_pass"	INTEGER,FOREIGN KEY("id_pass") REFERENCES "pass"("id") ON DELETE CASCADE,FOREIGN KEY("id_dostup") REFERENCES "dostup"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Employee
  static const String _createTableEmployee =
      'CREATE TABLE "$tableEmployee" ("id"	INTEGER,"fam" TEXT NOT NULL,"name"	TEXT NOT NULL,"otch"	TEXT NULL,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER,FOREIGN KEY("id_role") REFERENCES "role"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';
}
