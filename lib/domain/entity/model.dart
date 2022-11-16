class ModelEntity {
  late int id;
  final String model;
  ModelEntity({required this.model});
}
enum ModelEnum {
  model1(id: 1, model: 'bb163'),
  model2(id: 2, model: 'gh516'),
  model3(id: 3, model: 'pm33'),
  model4(id: 4, model: 'gl584'),
  model5(id: 4, model: 'pr14');
  const ModelEnum({
    required this.id,
    required this.model,
  });
  final String model;
  final int id;
}