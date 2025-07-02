class EditUserBody {
  final String? email;
  final String? password;
  final String? fullName;
  final List<int>? roleIds;
  final bool? active;

  EditUserBody({
    this.active,
    this.email,
    this.password,
    this.fullName,
    this.roleIds,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'roleIds': roleIds,
      'active': active,
    };
  }

  factory EditUserBody.fromJson(Map<String, dynamic> json) {
    return EditUserBody(
      email: json['email'],
      password: json['password'],
      fullName: json['fullName'],
      roleIds: List<int>.from(json['roleIds']),
      active: json['active'],
    );
  }
}
