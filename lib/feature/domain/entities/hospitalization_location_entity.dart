class HospitalizationLocationEntity {
  final int id;
  final String name;

  HospitalizationLocationEntity({required this.id, required this.name});

  @override
  // ignore: non_nullable_equals_parameter
  bool operator ==(dynamic other) =>
      other != null &&
      other is HospitalizationLocationEntity &&
      id == other.id &&
      name == other.name;

  @override
  // ignore: unnecessary_overrides
  int get hashCode => super.hashCode;
}
