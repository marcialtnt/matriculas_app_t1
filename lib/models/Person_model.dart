class Person {
  String name;
  String address;
  String phone;
  String? dni;

  Person(
      {required this.name,
      required this.address,
      required this.phone,
      this.dni});
}
