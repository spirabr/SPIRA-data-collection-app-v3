import 'package:spira/feature/domain/entities/comorbidity_entity.dart';

class ComorbidityModel {
  final int id;
  final String name;

  ComorbidityModel({
    required this.id,
    required this.name,
  });

  factory ComorbidityModel.fromJson(Map<String, dynamic> json) {
    return ComorbidityModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  ComorbidityEntity toEntity() {
    return ComorbidityEntity(
      id: id,
      name: name,
    );
  }

  static ComorbidityModel fromEntity(ComorbidityEntity entity) {
    return ComorbidityModel(
      id: entity.id,
      name: entity.name,
    );
  }
}

class ComorbiditiesResponseModel {
  final bool success;
  final String message;
  final List<ComorbidityModel> data;

  ComorbiditiesResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ComorbiditiesResponseModel.fromJson(Map<String, dynamic> json) {
    return ComorbiditiesResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => ComorbidityModel.fromJson(item))
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

  List<ComorbidityEntity> toEntity() {
    return data.map((item) => item.toEntity()).toList();
  }
}