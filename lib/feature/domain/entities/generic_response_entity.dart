class GenericResponseEntity {
  final bool success;
  final String message;
  final bool authenticated;

  GenericResponseEntity({
    required this.success,
    required this.message,
    this.authenticated = true,
  });
}
