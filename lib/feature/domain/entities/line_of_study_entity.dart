class LineOfStudyEntity {
  final int id;
  final String name;

  LineOfStudyEntity({required this.id, required this.name});

  @override
  // ignore: non_nullable_equals_parameter
  bool operator ==(dynamic other) =>
      other != null &&
      other is LineOfStudyEntity &&
      id == other.id &&
      name == other.name;

  @override
  // ignore: unnecessary_overrides
  int get hashCode => super.hashCode;
}
