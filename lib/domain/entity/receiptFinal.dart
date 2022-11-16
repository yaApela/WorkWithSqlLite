import 'package:flatter_test_projact/domain/entity/period.dart';

class ReceiptFinalEntity {
  late int id;
  final int idReceipt;
  final PeriodEnum idPeriod;

  ReceiptFinalEntity({
    this.id = 0,
    required this.idReceipt,
    required this.idPeriod,
  });
}