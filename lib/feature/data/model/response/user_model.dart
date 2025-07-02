import 'package:spira/feature/domain/entities/user_entity.dart';

import 'role_model.dart';

class UserModel {
  final int id;
  final String email;
  final String fullName;
  final bool active;
  List<RoleModel> roles;

  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.active,
    required this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      active: json['active'],
      roles: json['roles'] != null
          ? (json['roles'] as List)
              .map((roleJson) => RoleModel.fromJson(roleJson))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'active': active,
      'roles': roles.map((role) => role.toJson()).toList(),
    };
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'active': active ? 1 : 0,
      'roles': roles.map((role) => role.toJson()).toList().toString(),
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      fullName: fullName,
      active: active,
      roles: roles.map((role) => role.toEntity()).toList(),
    );
  }

  static UserModel fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      fullName: entity.fullName,
      active: entity.active,
      roles: entity.roles.map((role) => RoleModel.fromEntity(role)).toList(),
    );
  }
}
