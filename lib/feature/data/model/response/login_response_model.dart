import 'package:spira/feature/data/model/response/token_model.dart';
import 'package:spira/feature/data/model/response/user_model.dart';
import 'package:spira/feature/domain/entities/login_response_entity.dart';

class LoginResponseModel {
  final bool success;
  final String message;
  final TokenModel token;
  final UserModel user;

  LoginResponseModel({
    required this.success,
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'],
      message: json['message'],
      token: TokenModel.fromJson(json['data']),
      user: UserModel.fromJson(json['data']['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': {
        'token': token.toJson(),
        'user': user.toJson(),
      },
    };
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      'token': token.token,
      'userId': user.id,
    };
  }

  LoginResponseEntity toEntity() {
    return LoginResponseEntity(
      success: success,
      message: message,
      token: token.toEntity(),
      user: user.toEntity(),
    );
  }

  static LoginResponseModel fromEntity(LoginResponseEntity entity) {
    return LoginResponseModel(
      success: entity.success,
      message: entity.message,
      token: TokenModel.fromEntity(entity.token),
      user: UserModel.fromEntity(entity.user),
    );
  }
}
