class NewUserBody {
  final String email;
  final String password;
  final String fullName;
  final List<int> roleIds;

  NewUserBody({
    required this.email,
    required this.password,
    required this.fullName,
    required this.roleIds,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'roleIds': roleIds,
    };
  }

  factory NewUserBody.fromJson(Map<String, dynamic> json) {
    return NewUserBody(
      email: json['email'],
      password: json['password'],
      fullName: json['fullName'],
      roleIds: List<int>.from(json['roleIds']),
    );
  }
}
