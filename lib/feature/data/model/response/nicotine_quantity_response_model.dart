import 'package:spira/feature/domain/entities/nicotine_amount_entity.dart';

class NicotineQuantityModel {
  final int id;
  final String amount;

  NicotineQuantityModel({
    required this.id,
    required this.amount,
  });

  factory NicotineQuantityModel.fromJson(Map<String, dynamic> json) {
    return NicotineQuantityModel(
      id: json['id'],
      amount: json['name'] ?? json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
    };
  }

  NicotineAmountEntity toEntity() {
    return NicotineAmountEntity(
      id: id,
      name: amount,
    );
  }

  static NicotineQuantityModel fromEntity(NicotineAmountEntity entity) {
    return NicotineQuantityModel(
      id: entity.id,
      amount: entity.name,
    );
  }
}

class NicotineQuantitiesResponseModel {
  final bool success;
  final String message;
  final List<NicotineQuantityModel> data;

  NicotineQuantitiesResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory NicotineQuantitiesResponseModel.fromJson(Map<String, dynamic> json) {
    return NicotineQuantitiesResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => NicotineQuantityModel.fromJson(item))
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

  List<NicotineAmountEntity> toEntity() {
    return data.map((item) => item.toEntity()).toList();
  }
}
