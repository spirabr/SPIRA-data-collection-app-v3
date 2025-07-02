import 'package:spira/feature/domain/entities/role_entity.dart';

class RoleModel {
  final int id;
  final String authority;

  RoleModel({required this.id, required this.authority});

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'],
      authority: json['authority'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authority': authority,
    };
  }

  RoleEntity toEntity() {
    return RoleEntity(id: id, authority: authority);
  }

  static RoleModel fromEntity(RoleEntity entity) {
    return RoleModel(id: entity.id, authority: entity.authority);
  }
}
