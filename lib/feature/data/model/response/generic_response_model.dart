import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class GenericResponseModel {
  final bool success;
  final String message;
  final bool authenticated;

  GenericResponseModel({
    required this.success,
    required this.message,
    this.authenticated = true,
  });

  GenericResponseModel copyWith({
    bool? success,
    String? message,
    bool? authenticated,
  }) {
    return GenericResponseModel(
      success: success ?? this.success,
      message: message ?? this.message,
      authenticated: authenticated ?? this.authenticated,
    );
  }

  factory GenericResponseModel.fromJson(Map<String, dynamic> json) {
    return GenericResponseModel(
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }

  GenericResponseEntity toEntity() {
    return GenericResponseEntity(
      success: success,
      message: message,
      authenticated: authenticated,
    );
  }

  factory GenericResponseModel.fromEntity(GenericResponseEntity entity) {
    return GenericResponseModel(
      success: entity.success,
      message: entity.message,
      authenticated: entity.authenticated,
    );
  }
}
