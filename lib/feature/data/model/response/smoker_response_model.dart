import 'package:spira/feature/domain/entities/smoker_entity.dart';

class SmokerStatusModel {
  final int id;
  final String status;

  SmokerStatusModel({
    required this.id,
    required this.status,
  });

  factory SmokerStatusModel.fromJson(Map<String, dynamic> json) {
    return SmokerStatusModel(
      id: json['id'],
      status: json['name'] ?? json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
    };
  }

  SmokerEntity toEntity() {
    return SmokerEntity(
      id: id,
      name: status,
    );
  }

  static SmokerStatusModel fromEntity(SmokerEntity entity) {
    return SmokerStatusModel(
      id: entity.id,
      status: entity.name,
    );
  }
}

class SmokerStatusesResponseModel {
  final bool success;
  final String message;
  final List<SmokerStatusModel> data;

  SmokerStatusesResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SmokerStatusesResponseModel.fromJson(Map<String, dynamic> json) {
    return SmokerStatusesResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => SmokerStatusModel.fromJson(item))
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

  List<SmokerEntity> toEntity() {
    return data.map((item) => item.toEntity()).toList();
  }
}
