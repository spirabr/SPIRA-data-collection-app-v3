import 'package:spira/feature/domain/entities/smoking_entity.dart';

class CigaretteTypeModel {
  final int id;
  final String type;

  CigaretteTypeModel({
    required this.id,
    required this.type,
  });

  factory CigaretteTypeModel.fromJson(Map<String, dynamic> json) {
    return CigaretteTypeModel(
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

  SmokingEntity toEntity() {
    return SmokingEntity(
      id: id,
      name: type,
    );
  }

  static CigaretteTypeModel fromEntity(SmokingEntity entity) {
    return CigaretteTypeModel(
      id: entity.id,
      type: entity.name,
    );
  }
}

class CigaretteTypesResponseModel {
  final bool success;
  final String message;
  final List<CigaretteTypeModel> data;

  CigaretteTypesResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CigaretteTypesResponseModel.fromJson(Map<String, dynamic> json) {
    return CigaretteTypesResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => CigaretteTypeModel.fromJson(item))
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

  List<SmokingEntity> toEntity() {
    return data.map((item) => item.toEntity()).toList();
  }
}
