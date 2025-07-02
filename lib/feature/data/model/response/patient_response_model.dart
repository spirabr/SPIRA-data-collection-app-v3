import 'package:spira/feature/data/model/request/patient_model.dart';
import 'package:spira/feature/domain/entities/patient_response_entity.dart';

class PatientResponseModel {
  final bool success;
  final String message;
  final PatientModel? data;
  final bool authenticated;

  PatientResponseModel({
    required this.success,
    required this.message,
    required this.data,
    this.authenticated = true,
  });

  factory PatientResponseModel.fromJson(Map<String, dynamic> json) {
    return PatientResponseModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? PatientModel.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }

  PatientResponseModel copyWith({
    bool? success,
    String? message,
    PatientModel? data,
    bool? authenticated,
  }) {
    return PatientResponseModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
      authenticated: authenticated ?? this.authenticated,
    );
  }

  PatientResponseEntity toEntity() {
    return PatientResponseEntity(
      success: success,
      message: message,
      data: data?.toEntity(),
      authenticated: authenticated,
    );
  }

  factory PatientResponseModel.fromEntity(PatientResponseEntity entity) {
    return PatientResponseModel(
      success: entity.success,
      message: entity.message,
      data: entity.data != null ? PatientModel.fromEntity(entity.data!) : null,
      authenticated: entity.authenticated,
    );
  }
}
