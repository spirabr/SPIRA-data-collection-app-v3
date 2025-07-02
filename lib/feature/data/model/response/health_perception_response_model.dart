import 'package:spira/feature/domain/entities/health_perception_entity.dart';

class HealthPerceptionModel {
  final int id;
  final String perception;

  HealthPerceptionModel({
    required this.id,
    required this.perception,
  });

  factory HealthPerceptionModel.fromJson(Map<String, dynamic> json) {
    return HealthPerceptionModel(
      id: json['id'],
      perception: json['name'] ?? json['perception'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'perception': perception,
    };
  }

  HealthPerceptionEntity toEntity() {
    return HealthPerceptionEntity(
      id: id,
      name: perception,
    );
  }

  static HealthPerceptionModel fromEntity(HealthPerceptionEntity entity) {
    return HealthPerceptionModel(
      id: entity.id,
      perception: entity.name,
    );
  }
}

class HealthPerceptionsResponseModel {
  final bool success;
  final String message;
  final List<HealthPerceptionModel> data;

  HealthPerceptionsResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory HealthPerceptionsResponseModel.fromJson(Map<String, dynamic> json) {
    return HealthPerceptionsResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => HealthPerceptionModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }

  List<HealthPerceptionEntity> toEntity() {
    return data.map((item) => item.toEntity()).toList();
  }
}