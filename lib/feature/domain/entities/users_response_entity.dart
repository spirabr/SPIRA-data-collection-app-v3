import 'package:spira/feature/domain/entities/user_entity.dart';

class UsersResponseEntity {
  final bool success;
  final String message;
  final List<UserEntity>? data;
  final bool authenticated;

  UsersResponseEntity({
    required this.success,
    required this.message,
    this.data,
    this.authenticated = true,
  });
}
