import 'token_entity.dart';
import 'user_entity.dart';

class LoginResponseEntity {
  final bool success;
  final String message;
  final TokenEntity token;
  final UserEntity user;

  LoginResponseEntity({
    required this.success,
    required this.message,
    required this.token,
    required this.user,
  });
}