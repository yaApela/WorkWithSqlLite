class ClientEntity {
  late int id;
  final String surname;
  final String name;
  final String middlename;

  ClientEntity({
    this.id = 0,
    required this.surname,
    required this.name,
    required this.middlename,
  });
}
