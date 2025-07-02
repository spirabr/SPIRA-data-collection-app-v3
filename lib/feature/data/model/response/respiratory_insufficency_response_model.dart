import 'package:spira/feature/domain/entities/respiratory_failure_entity.dart';

class RespiratoryInsufficiencyModel {
  final int id;
  final String type;

  RespiratoryInsufficiencyModel({
    required this.id,
    required this.type,
  });

  factory RespiratoryInsufficiencyModel.fromJson(Map<String, dynamic> json) {
    return RespiratoryInsufficiencyModel(
      id: json['id'],
      type: json['name'] ?? json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
    };
  }

  RespiratoryFailureEntity toEntity() {
    return RespiratoryFailureEntity(
      id: id,
      name: type,
    );
  }

  static RespiratoryInsufficiencyModel fromEntity(
      RespiratoryFailureEntity entity) {
    return RespiratoryInsufficiencyModel(
      id: entity.id,
      type: entity.name,
    );
  }
}

class RespiratoryInsufficienciesResponseModel {
  final bool success;
  final String message;
  final List<RespiratoryInsufficiencyModel> data;

  RespiratoryInsufficienciesResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RespiratoryInsufficienciesResponseModel.fromJson(
      Map<String, dynamic> json) {
    return RespiratoryInsufficienciesResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => RespiratoryInsufficiencyModel.fromJson(item))
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

  List<RespiratoryFailureEntity> toEntity() {
    return data.map((item) => item.toEntity()).toList();
  }
}
