class BicycleEntity {
  late int id;
  final String number;
  final String year;
  final int idClient;
  final int idMark;

  BicycleEntity({
    this.id = 0,
    required this.number,
    required this.year,
    required this.idClient,
    required this.idMark,
  });
}
