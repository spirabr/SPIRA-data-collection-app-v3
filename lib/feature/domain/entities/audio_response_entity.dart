class AudioResponseEntity {
  final bool success;
  final String message;
  final bool authenticated;

  AudioResponseEntity({
    required this.success,
    required this.message,
    this.authenticated = true,
  });
}
