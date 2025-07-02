// ignore_for_file: hash_and_equals

class RoleEntity {
  final int id;
  final String authority;

  RoleEntity({required this.id, required this.authority});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RoleEntity &&
        other.id == id &&
        other.authority == authority;
  }
}
