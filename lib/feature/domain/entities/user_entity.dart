import 'role_entity.dart';

class UserEntity {
  final int id;
  final String email;
  final String fullName;
  final bool active;
  final List<RoleEntity> roles;

  UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.active,
    required this.roles,
  });
}