import 'package:spira/feature/domain/entities/patient_entity.dart';

class PatientResponseEntity {
  final bool success;
  final String message;
  final PatientEntity? data;
  final bool authenticated;

  PatientResponseEntity({
    required this.success,
    required this.message,
    this.data,
    this.authenticated = true,
  });
}
