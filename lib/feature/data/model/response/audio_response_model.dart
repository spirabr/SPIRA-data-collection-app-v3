import 'package:spira/feature/domain/entities/Audio_response_entity.dart';

class AudioResponseModel {
  final bool success;
  final String message;
  final bool authenticated;

  AudioResponseModel({
    required this.success,
    required this.message,
    this.authenticated = true,
  });

  factory AudioResponseModel.fromJson(Map<String, dynamic> json) {
    return AudioResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }

  AudioResponseModel copyWith({
    bool? success,
    String? message,
    bool? authenticated,
  }) {
    return AudioResponseModel(
      success: success ?? this.success,
      message: message ?? this.message,
      authenticated: authenticated ?? this.authenticated,
    );
  }

  AudioResponseEntity toEntity() {
    return AudioResponseEntity(
      success: success,
      message: message,
    );
  }

  factory AudioResponseModel.fromEntity(AudioResponseEntity entity) {
    return AudioResponseModel(
      success: entity.success,
      message: entity.message,
    );
  }
}
