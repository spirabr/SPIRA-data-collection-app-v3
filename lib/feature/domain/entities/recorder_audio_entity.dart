class RecordedAudioEntity {
  final int duration;
  final String path;

  RecordedAudioEntity({required this.duration, required this.path});

  @override
  // ignore: non_nullable_equals_parameter
  bool operator ==(dynamic other) =>
      other != null &&
      other is RecordedAudioEntity &&
      duration == other.duration &&
      path == other.path;

  @override
  // ignore: unnecessary_overrides
  int get hashCode => super.hashCode;
}
