import 'package:spira/feature/data/model/response/user_model.dart';
import 'package:spira/feature/domain/entities/users_response_entity.dart';

class UsersResponseModel {
  final bool success;
  final String message;
  final List<UserModel>? data;
  final bool authenticated;

  UsersResponseModel({
    required this.success,
    required this.message,
    this.data,
    this.authenticated = true,
  });

  UsersResponseModel copyWith({
    bool? success,
    String? message,
    List<UserModel>? data,
    bool? authenticated,
  }) {
    return UsersResponseModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
      authenticated: authenticated ?? this.authenticated,
    );
  }

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) {
    return UsersResponseModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data']['content'] as List)
              .map((item) => UserModel.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }

  UsersResponseEntity toEntity() {
    return UsersResponseEntity(
      success: success,
      message: message,
      data: data?.map((item) => item.toEntity()).toList(),
      authenticated: authenticated,
    );
  }

  factory UsersResponseModel.fromEntity(UsersResponseEntity entity) {
    return UsersResponseModel(
      success: entity.success,
      message: entity.message,
      data: entity.data?.map((item) => UserModel.fromEntity(item)).toList(),
      authenticated: entity.authenticated,
    );
  }
}
