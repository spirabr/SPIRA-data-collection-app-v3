import 'package:spira/feature/domain/entities/token_entity.dart';

class TokenModel {
  final String token;

  TokenModel({required this.token});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }

  TokenEntity toEntity() {
    return TokenEntity(token: token);
  }

  static TokenModel fromEntity(TokenEntity entity) {
    return TokenModel(token: entity.token);
  }
}
