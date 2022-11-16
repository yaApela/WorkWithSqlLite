import '../../domain/entity/period.dart';
import '../../domain/entity/receiptFinal.dart';
class ReceiptFinal extends ReceiptFinalEntity {
  ReceiptFinal({
    super.id = 0,
    required super.idReceipt,
    required super.idPeriod,
  });
  Map<String, dynamic> toMap() {
    return {
      'id_receipt': idReceipt,
      'id_period': idPeriod.id,
    };
  }
  factory ReceiptFinal.toFromMap(Map<String, dynamic> json) {
    return ReceiptFinal(
      id: json['id'] as int,
      idReceipt: json['id_receipt'],
      idPeriod: PeriodEnum.values
          .firstWhere((element) => element.id == (json['id_period'] as int)),
    );
  }
}