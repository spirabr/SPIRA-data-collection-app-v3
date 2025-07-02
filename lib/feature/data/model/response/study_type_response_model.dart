import 'package:spira/feature/domain/entities/line_of_study_entity.dart';

class StudyTypeModel {
  final int id;
  final String name;

  StudyTypeModel({
    required this.id,
    required this.name,
  });

  factory StudyTypeModel.fromJson(Map<String, dynamic> json) {
    return StudyTypeModel(
      id: json['id'],
      name: json['name'] ?? json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  LineOfStudyEntity toEntity() {
    return LineOfStudyEntity(
      id: id,
      name: name,
    );
  }

  static StudyTypeModel fromEntity(LineOfStudyEntity entity) {
    return StudyTypeModel(
      id: entity.id,
      name: entity.name,
    );
  }
}

class StudyTypesResponseModel {
  final bool success;
  final String message;
  final List<StudyTypeModel> data;

  StudyTypesResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory StudyTypesResponseModel.fromJson(Map<String, dynamic> json) {
    return StudyTypesResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => StudyTypeModel.fromJson(item))
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

  List<LineOfStudyEntity> toEntity() {
    return data.map((item) => item.toEntity()).toList();
  }
}