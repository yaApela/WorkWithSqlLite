import '../../domain/entity/mark.dart';
import '../../domain/entity/model.dart';
class Mark extends MarkEntity {
  Mark({
    super.id = 0,
    required super.maker,
    required super.idModel,
  });
  Map<String, dynamic> toMap() {
    return {
      'maker': maker,
      'id_model': idModel.id,
    };
  }
  factory Mark.toFromMap(Map<String, dynamic> json) {
    return Mark(
      id: json['id'] as int,
      maker: json['maker'],
      idModel: ModelEnum.values
          .firstWhere((element) => element.id == (json['id_model'] as int)),
    );
  }
}