import 'package:spira/feature/domain/entities/gender_entity.dart';

class GenderModel {
  final int id;
  final String gender;

  GenderModel({
    required this.id,
    required this.gender,
  });

  factory GenderModel.fromJson(Map<String, dynamic> json) {
    return GenderModel(
      id: json['id'],
      gender: json['gender'] ?? json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gender': gender,
    };
  }

  GenderEntity toEntity() {
    return GenderEntity(
      id: id,
      name: gender,
    );
  }

  static GenderModel fromEntity(GenderEntity entity) {
    return GenderModel(
      id: entity.id,
      gender: entity.name,
    );
  }
}

class GendersResponseModel {
  final bool success;
  final String message;
  final List<GenderModel> data;

  GendersResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GendersResponseModel.fromJson(Map<String, dynamic> json) {
    return GendersResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => GenderModel.fromJson(item))
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

  List<GenderEntity> toEntity() {
    return data.map((item) => item.toEntity()).toList();
  }
}
