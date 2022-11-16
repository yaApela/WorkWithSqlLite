import '../../domain/entity/receipt.dart';
class Receipt extends ReceiptEntity {
  Receipt({
    super.id = 0,
    required super.idSotr,
    required super.idBicycle,
  });
  Map<String, dynamic> toMap() {
    return {
      'id_sotr': idSotr,
      'id_bicycle': idBicycle,
    };
  }
  factory Receipt.toFromMap(Map<String, dynamic> json) {
    return Receipt(
      id: json['id'] as int,
      idSotr: json['id_sotr'] as int,
      idBicycle: json['id_bicycle'] as int,
    );
  }
}

