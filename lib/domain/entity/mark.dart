import 'model.dart';

class MarkEntity {
  late int id;
  final String maker;
  final ModelEnum idModel;

  MarkEntity({
    this.id = 0,
    required this.maker,
    required this.idModel,
  });
}