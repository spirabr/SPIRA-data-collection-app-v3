
import 'package:spira/feature/domain/entities/smoking_cessation_entity.dart';

class CessationTimeModel {
  final int id;
  final String time;

  CessationTimeModel({
    required this.id,
    required this.time,
  });

  factory CessationTimeModel.fromJson(Map<String, dynamic> json) {
    return CessationTimeModel(
      id: json['id'],
      time: json['name'] ?? json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time,
    };
  }

  SmokingCessationEntity toEntity() {
    return SmokingCessationEntity(
      id: id,
      name: time,
    );
  }

  static CessationTimeModel fromEntity(SmokingCessationEntity entity) {
    return CessationTimeModel(
      id: entity.id,
      time: entity.name,
    );
  }
}

class CessationTimesResponseModel {
  final bool success;
  final String message;
  final List<CessationTimeModel> data;

  CessationTimesResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CessationTimesResponseModel.fromJson(Map<String, dynamic> json) {
    return CessationTimesResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => CessationTimeModel.fromJson(item))
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

  List<SmokingCessationEntity> toEntity() {
    return data.map((item) => item.toEntity()).toList();
  }
}