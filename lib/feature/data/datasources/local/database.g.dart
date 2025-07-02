// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, email, fullName, active];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String email;
  final String fullName;
  final bool active;
  const User(
      {required this.id,
      required this.email,
      required this.fullName,
      required this.active});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['full_name'] = Variable<String>(fullName);
    map['active'] = Variable<bool>(active);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      email: Value(email),
      fullName: Value(fullName),
      active: Value(active),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      fullName: serializer.fromJson<String>(json['fullName']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'fullName': serializer.toJson<String>(fullName),
      'active': serializer.toJson<bool>(active),
    };
  }

  User copyWith({int? id, String? email, String? fullName, bool? active}) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        active: active ?? this.active,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('fullName: $fullName, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, fullName, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.email == this.email &&
          other.fullName == this.fullName &&
          other.active == this.active);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> fullName;
  final Value<bool> active;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.fullName = const Value.absent(),
    this.active = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String fullName,
    required bool active,
  })  : email = Value(email),
        fullName = Value(fullName),
        active = Value(active);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? fullName,
    Expression<bool>? active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (fullName != null) 'full_name': fullName,
      if (active != null) 'active': active,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? email,
      Value<String>? fullName,
      Value<bool>? active}) {
    return UsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('fullName: $fullName, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $LoginResponsesTable extends LoginResponses
    with TableInfo<$LoginResponsesTable, LoginResponse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoginResponsesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES users(id) NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, token, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'login_responses';
  @override
  VerificationContext validateIntegrity(Insertable<LoginResponse> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoginResponse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoginResponse(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $LoginResponsesTable createAlias(String alias) {
    return $LoginResponsesTable(attachedDatabase, alias);
  }
}

class LoginResponse extends DataClass implements Insertable<LoginResponse> {
  final int id;
  final String token;
  final int userId;
  const LoginResponse(
      {required this.id, required this.token, required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['token'] = Variable<String>(token);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  LoginResponsesCompanion toCompanion(bool nullToAbsent) {
    return LoginResponsesCompanion(
      id: Value(id),
      token: Value(token),
      userId: Value(userId),
    );
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoginResponse(
      id: serializer.fromJson<int>(json['id']),
      token: serializer.fromJson<String>(json['token']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'token': serializer.toJson<String>(token),
      'userId': serializer.toJson<int>(userId),
    };
  }

  LoginResponse copyWith({int? id, String? token, int? userId}) =>
      LoginResponse(
        id: id ?? this.id,
        token: token ?? this.token,
        userId: userId ?? this.userId,
      );
  LoginResponse copyWithCompanion(LoginResponsesCompanion data) {
    return LoginResponse(
      id: data.id.present ? data.id.value : this.id,
      token: data.token.present ? data.token.value : this.token,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoginResponse(')
          ..write('id: $id, ')
          ..write('token: $token, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, token, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginResponse &&
          other.id == this.id &&
          other.token == this.token &&
          other.userId == this.userId);
}

class LoginResponsesCompanion extends UpdateCompanion<LoginResponse> {
  final Value<int> id;
  final Value<String> token;
  final Value<int> userId;
  const LoginResponsesCompanion({
    this.id = const Value.absent(),
    this.token = const Value.absent(),
    this.userId = const Value.absent(),
  });
  LoginResponsesCompanion.insert({
    this.id = const Value.absent(),
    required String token,
    required int userId,
  })  : token = Value(token),
        userId = Value(userId);
  static Insertable<LoginResponse> custom({
    Expression<int>? id,
    Expression<String>? token,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (token != null) 'token': token,
      if (userId != null) 'user_id': userId,
    });
  }

  LoginResponsesCompanion copyWith(
      {Value<int>? id, Value<String>? token, Value<int>? userId}) {
    return LoginResponsesCompanion(
      id: id ?? this.id,
      token: token ?? this.token,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoginResponsesCompanion(')
          ..write('id: $id, ')
          ..write('token: $token, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $RolesTable extends Roles with TableInfo<$RolesTable, Role> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RolesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES users(id) NOT NULL');
  static const VerificationMeta _authorityMeta =
      const VerificationMeta('authority');
  @override
  late final GeneratedColumn<String> authority = GeneratedColumn<String>(
      'authority', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, authority];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roles';
  @override
  VerificationContext validateIntegrity(Insertable<Role> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('authority')) {
      context.handle(_authorityMeta,
          authority.isAcceptableOrUnknown(data['authority']!, _authorityMeta));
    } else if (isInserting) {
      context.missing(_authorityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Role map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Role(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      authority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}authority'])!,
    );
  }

  @override
  $RolesTable createAlias(String alias) {
    return $RolesTable(attachedDatabase, alias);
  }
}

class Role extends DataClass implements Insertable<Role> {
  final int id;
  final int userId;
  final String authority;
  const Role({required this.id, required this.userId, required this.authority});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['authority'] = Variable<String>(authority);
    return map;
  }

  RolesCompanion toCompanion(bool nullToAbsent) {
    return RolesCompanion(
      id: Value(id),
      userId: Value(userId),
      authority: Value(authority),
    );
  }

  factory Role.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Role(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      authority: serializer.fromJson<String>(json['authority']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'authority': serializer.toJson<String>(authority),
    };
  }

  Role copyWith({int? id, int? userId, String? authority}) => Role(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        authority: authority ?? this.authority,
      );
  Role copyWithCompanion(RolesCompanion data) {
    return Role(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      authority: data.authority.present ? data.authority.value : this.authority,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Role(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('authority: $authority')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, authority);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Role &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.authority == this.authority);
}

class RolesCompanion extends UpdateCompanion<Role> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> authority;
  const RolesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.authority = const Value.absent(),
  });
  RolesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String authority,
  })  : userId = Value(userId),
        authority = Value(authority);
  static Insertable<Role> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? authority,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (authority != null) 'authority': authority,
    });
  }

  RolesCompanion copyWith(
      {Value<int>? id, Value<int>? userId, Value<String>? authority}) {
    return RolesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      authority: authority ?? this.authority,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (authority.present) {
      map['authority'] = Variable<String>(authority.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RolesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('authority: $authority')
          ..write(')'))
        .toString();
  }
}

class $GendersTable extends Genders with TableInfo<$GendersTable, Gender> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GendersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'genders';
  @override
  VerificationContext validateIntegrity(Insertable<Gender> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Gender map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Gender(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $GendersTable createAlias(String alias) {
    return $GendersTable(attachedDatabase, alias);
  }
}

class Gender extends DataClass implements Insertable<Gender> {
  final int id;
  final String name;
  const Gender({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  GendersCompanion toCompanion(bool nullToAbsent) {
    return GendersCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Gender.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Gender(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Gender copyWith({int? id, String? name}) => Gender(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Gender copyWithCompanion(GendersCompanion data) {
    return Gender(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Gender(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Gender && other.id == this.id && other.name == this.name);
}

class GendersCompanion extends UpdateCompanion<Gender> {
  final Value<int> id;
  final Value<String> name;
  const GendersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GendersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Gender> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GendersCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return GendersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GendersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ComorbiditiesTable extends Comorbidities
    with TableInfo<$ComorbiditiesTable, Comorbidity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComorbiditiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comorbidities';
  @override
  VerificationContext validateIntegrity(Insertable<Comorbidity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Comorbidity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Comorbidity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $ComorbiditiesTable createAlias(String alias) {
    return $ComorbiditiesTable(attachedDatabase, alias);
  }
}

class Comorbidity extends DataClass implements Insertable<Comorbidity> {
  final int id;
  final String name;
  const Comorbidity({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ComorbiditiesCompanion toCompanion(bool nullToAbsent) {
    return ComorbiditiesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Comorbidity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Comorbidity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Comorbidity copyWith({int? id, String? name}) => Comorbidity(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Comorbidity copyWithCompanion(ComorbiditiesCompanion data) {
    return Comorbidity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Comorbidity(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comorbidity && other.id == this.id && other.name == this.name);
}

class ComorbiditiesCompanion extends UpdateCompanion<Comorbidity> {
  final Value<int> id;
  final Value<String> name;
  const ComorbiditiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ComorbiditiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Comorbidity> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ComorbiditiesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return ComorbiditiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComorbiditiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SmokersTable extends Smokers with TableInfo<$SmokersTable, Smoker> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SmokersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'smokers';
  @override
  VerificationContext validateIntegrity(Insertable<Smoker> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Smoker map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Smoker(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SmokersTable createAlias(String alias) {
    return $SmokersTable(attachedDatabase, alias);
  }
}

class Smoker extends DataClass implements Insertable<Smoker> {
  final int id;
  final String name;
  const Smoker({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  SmokersCompanion toCompanion(bool nullToAbsent) {
    return SmokersCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Smoker.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Smoker(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Smoker copyWith({int? id, String? name}) => Smoker(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Smoker copyWithCompanion(SmokersCompanion data) {
    return Smoker(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Smoker(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Smoker && other.id == this.id && other.name == this.name);
}

class SmokersCompanion extends UpdateCompanion<Smoker> {
  final Value<int> id;
  final Value<String> name;
  const SmokersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SmokersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Smoker> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  SmokersCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return SmokersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SmokersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $StudyLinesTable extends StudyLines
    with TableInfo<$StudyLinesTable, StudyLine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudyLinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_lines';
  @override
  VerificationContext validateIntegrity(Insertable<StudyLine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudyLine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudyLine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $StudyLinesTable createAlias(String alias) {
    return $StudyLinesTable(attachedDatabase, alias);
  }
}

class StudyLine extends DataClass implements Insertable<StudyLine> {
  final int id;
  final String name;
  const StudyLine({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  StudyLinesCompanion toCompanion(bool nullToAbsent) {
    return StudyLinesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory StudyLine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudyLine(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  StudyLine copyWith({int? id, String? name}) => StudyLine(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  StudyLine copyWithCompanion(StudyLinesCompanion data) {
    return StudyLine(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudyLine(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudyLine && other.id == this.id && other.name == this.name);
}

class StudyLinesCompanion extends UpdateCompanion<StudyLine> {
  final Value<int> id;
  final Value<String> name;
  const StudyLinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  StudyLinesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<StudyLine> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  StudyLinesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return StudyLinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudyLinesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SmokingCessationTimesTable extends SmokingCessationTimes
    with TableInfo<$SmokingCessationTimesTable, SmokingCessationTime> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SmokingCessationTimesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'smoking_cessation_times';
  @override
  VerificationContext validateIntegrity(
      Insertable<SmokingCessationTime> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SmokingCessationTime map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SmokingCessationTime(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SmokingCessationTimesTable createAlias(String alias) {
    return $SmokingCessationTimesTable(attachedDatabase, alias);
  }
}

class SmokingCessationTime extends DataClass
    implements Insertable<SmokingCessationTime> {
  final int id;
  final String name;
  const SmokingCessationTime({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  SmokingCessationTimesCompanion toCompanion(bool nullToAbsent) {
    return SmokingCessationTimesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory SmokingCessationTime.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SmokingCessationTime(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  SmokingCessationTime copyWith({int? id, String? name}) =>
      SmokingCessationTime(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  SmokingCessationTime copyWithCompanion(SmokingCessationTimesCompanion data) {
    return SmokingCessationTime(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SmokingCessationTime(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SmokingCessationTime &&
          other.id == this.id &&
          other.name == this.name);
}

class SmokingCessationTimesCompanion
    extends UpdateCompanion<SmokingCessationTime> {
  final Value<int> id;
  final Value<String> name;
  const SmokingCessationTimesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SmokingCessationTimesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<SmokingCessationTime> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  SmokingCessationTimesCompanion copyWith(
      {Value<int>? id, Value<String>? name}) {
    return SmokingCessationTimesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SmokingCessationTimesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SmokingTypesTable extends SmokingTypes
    with TableInfo<$SmokingTypesTable, SmokingType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SmokingTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'smoking_types';
  @override
  VerificationContext validateIntegrity(Insertable<SmokingType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SmokingType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SmokingType(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SmokingTypesTable createAlias(String alias) {
    return $SmokingTypesTable(attachedDatabase, alias);
  }
}

class SmokingType extends DataClass implements Insertable<SmokingType> {
  final int id;
  final String name;
  const SmokingType({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  SmokingTypesCompanion toCompanion(bool nullToAbsent) {
    return SmokingTypesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory SmokingType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SmokingType(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  SmokingType copyWith({int? id, String? name}) => SmokingType(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  SmokingType copyWithCompanion(SmokingTypesCompanion data) {
    return SmokingType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SmokingType(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SmokingType && other.id == this.id && other.name == this.name);
}

class SmokingTypesCompanion extends UpdateCompanion<SmokingType> {
  final Value<int> id;
  final Value<String> name;
  const SmokingTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SmokingTypesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<SmokingType> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  SmokingTypesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return SmokingTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SmokingTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $HealthPerceptionsTable extends HealthPerceptions
    with TableInfo<$HealthPerceptionsTable, HealthPerception> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HealthPerceptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'health_perceptions';
  @override
  VerificationContext validateIntegrity(Insertable<HealthPerception> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HealthPerception map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HealthPerception(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $HealthPerceptionsTable createAlias(String alias) {
    return $HealthPerceptionsTable(attachedDatabase, alias);
  }
}

class HealthPerception extends DataClass
    implements Insertable<HealthPerception> {
  final int id;
  final String name;
  const HealthPerception({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  HealthPerceptionsCompanion toCompanion(bool nullToAbsent) {
    return HealthPerceptionsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory HealthPerception.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HealthPerception(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  HealthPerception copyWith({int? id, String? name}) => HealthPerception(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  HealthPerception copyWithCompanion(HealthPerceptionsCompanion data) {
    return HealthPerception(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HealthPerception(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HealthPerception &&
          other.id == this.id &&
          other.name == this.name);
}

class HealthPerceptionsCompanion extends UpdateCompanion<HealthPerception> {
  final Value<int> id;
  final Value<String> name;
  const HealthPerceptionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  HealthPerceptionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<HealthPerception> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  HealthPerceptionsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return HealthPerceptionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HealthPerceptionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $HospitalizationLocationsTable extends HospitalizationLocations
    with TableInfo<$HospitalizationLocationsTable, HospitalizationLocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HospitalizationLocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hospitalization_locations';
  @override
  VerificationContext validateIntegrity(
      Insertable<HospitalizationLocation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HospitalizationLocation map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HospitalizationLocation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $HospitalizationLocationsTable createAlias(String alias) {
    return $HospitalizationLocationsTable(attachedDatabase, alias);
  }
}

class HospitalizationLocation extends DataClass
    implements Insertable<HospitalizationLocation> {
  final int id;
  final String name;
  const HospitalizationLocation({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  HospitalizationLocationsCompanion toCompanion(bool nullToAbsent) {
    return HospitalizationLocationsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory HospitalizationLocation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HospitalizationLocation(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  HospitalizationLocation copyWith({int? id, String? name}) =>
      HospitalizationLocation(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  HospitalizationLocation copyWithCompanion(
      HospitalizationLocationsCompanion data) {
    return HospitalizationLocation(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HospitalizationLocation(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HospitalizationLocation &&
          other.id == this.id &&
          other.name == this.name);
}

class HospitalizationLocationsCompanion
    extends UpdateCompanion<HospitalizationLocation> {
  final Value<int> id;
  final Value<String> name;
  const HospitalizationLocationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  HospitalizationLocationsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<HospitalizationLocation> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  HospitalizationLocationsCompanion copyWith(
      {Value<int>? id, Value<String>? name}) {
    return HospitalizationLocationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HospitalizationLocationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $NicotineAmountsTable extends NicotineAmounts
    with TableInfo<$NicotineAmountsTable, NicotineAmount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NicotineAmountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nicotine_amounts';
  @override
  VerificationContext validateIntegrity(Insertable<NicotineAmount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NicotineAmount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NicotineAmount(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $NicotineAmountsTable createAlias(String alias) {
    return $NicotineAmountsTable(attachedDatabase, alias);
  }
}

class NicotineAmount extends DataClass implements Insertable<NicotineAmount> {
  final int id;
  final String name;
  const NicotineAmount({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  NicotineAmountsCompanion toCompanion(bool nullToAbsent) {
    return NicotineAmountsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory NicotineAmount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NicotineAmount(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  NicotineAmount copyWith({int? id, String? name}) => NicotineAmount(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  NicotineAmount copyWithCompanion(NicotineAmountsCompanion data) {
    return NicotineAmount(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NicotineAmount(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NicotineAmount &&
          other.id == this.id &&
          other.name == this.name);
}

class NicotineAmountsCompanion extends UpdateCompanion<NicotineAmount> {
  final Value<int> id;
  final Value<String> name;
  const NicotineAmountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  NicotineAmountsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<NicotineAmount> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  NicotineAmountsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return NicotineAmountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NicotineAmountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $RespiratoryFailuresTable extends RespiratoryFailures
    with TableInfo<$RespiratoryFailuresTable, RespiratoryFailure> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RespiratoryFailuresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'respiratory_failures';
  @override
  VerificationContext validateIntegrity(Insertable<RespiratoryFailure> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RespiratoryFailure map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RespiratoryFailure(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $RespiratoryFailuresTable createAlias(String alias) {
    return $RespiratoryFailuresTable(attachedDatabase, alias);
  }
}

class RespiratoryFailure extends DataClass
    implements Insertable<RespiratoryFailure> {
  final int id;
  final String name;
  const RespiratoryFailure({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  RespiratoryFailuresCompanion toCompanion(bool nullToAbsent) {
    return RespiratoryFailuresCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory RespiratoryFailure.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RespiratoryFailure(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  RespiratoryFailure copyWith({int? id, String? name}) => RespiratoryFailure(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  RespiratoryFailure copyWithCompanion(RespiratoryFailuresCompanion data) {
    return RespiratoryFailure(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RespiratoryFailure(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RespiratoryFailure &&
          other.id == this.id &&
          other.name == this.name);
}

class RespiratoryFailuresCompanion extends UpdateCompanion<RespiratoryFailure> {
  final Value<int> id;
  final Value<String> name;
  const RespiratoryFailuresCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  RespiratoryFailuresCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<RespiratoryFailure> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  RespiratoryFailuresCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return RespiratoryFailuresCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RespiratoryFailuresCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PatientsTable extends Patients with TableInfo<$PatientsTable, Patient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _synchronizedMeta =
      const VerificationMeta('synchronized');
  @override
  late final GeneratedColumn<bool> synchronized = GeneratedColumn<bool>(
      'synchronized', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("synchronized" IN (0, 1))'));
  static const VerificationMeta _collectionSiteMeta =
      const VerificationMeta('collectionSite');
  @override
  late final GeneratedColumn<String> collectionSite = GeneratedColumn<String>(
      'collection_site', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _identifierMeta =
      const VerificationMeta('identifier');
  @override
  late final GeneratedColumn<String> identifier = GeneratedColumn<String>(
      'identifier', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _otherComorbiditiesMeta =
      const VerificationMeta('otherComorbidities');
  @override
  late final GeneratedColumn<String> otherComorbidities =
      GeneratedColumn<String>('other_comorbidities', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _smokerIdMeta =
      const VerificationMeta('smokerId');
  @override
  late final GeneratedColumn<int> smokerId = GeneratedColumn<int>(
      'smoker_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _genderIdMeta =
      const VerificationMeta('genderId');
  @override
  late final GeneratedColumn<int> genderId = GeneratedColumn<int>(
      'gender_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
      'height', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _bloodPressureMeta =
      const VerificationMeta('bloodPressure');
  @override
  late final GeneratedColumn<String> bloodPressure = GeneratedColumn<String>(
      'blood_pressure', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _heartRateMeta =
      const VerificationMeta('heartRate');
  @override
  late final GeneratedColumn<int> heartRate = GeneratedColumn<int>(
      'heart_rate', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _respiratoryRateMeta =
      const VerificationMeta('respiratoryRate');
  @override
  late final GeneratedColumn<int> respiratoryRate = GeneratedColumn<int>(
      'respiratory_rate', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _saturationMeta =
      const VerificationMeta('saturation');
  @override
  late final GeneratedColumn<double> saturation = GeneratedColumn<double>(
      'saturation', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _studyTypeIdMeta =
      const VerificationMeta('studyTypeId');
  @override
  late final GeneratedColumn<int> studyTypeId = GeneratedColumn<int>(
      'study_type_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _collectorUserIdMeta =
      const VerificationMeta('collectorUserId');
  @override
  late final GeneratedColumn<int> collectorUserId = GeneratedColumn<int>(
      'collector_user_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _collectionDateMeta =
      const VerificationMeta('collectionDate');
  @override
  late final GeneratedColumn<DateTime> collectionDate =
      GeneratedColumn<DateTime>('collection_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _gasometryPaO2Meta =
      const VerificationMeta('gasometryPaO2');
  @override
  late final GeneratedColumn<double> gasometryPaO2 = GeneratedColumn<double>(
      'gasometry_pa_o2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _gasometryPaCo2Meta =
      const VerificationMeta('gasometryPaCo2');
  @override
  late final GeneratedColumn<double> gasometryPaCo2 = GeneratedColumn<double>(
      'gasometry_pa_co2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _gasometryPHMeta =
      const VerificationMeta('gasometryPH');
  @override
  late final GeneratedColumn<double> gasometryPH = GeneratedColumn<double>(
      'gasometry_p_h', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _hospitalizationDaysMeta =
      const VerificationMeta('hospitalizationDays');
  @override
  late final GeneratedColumn<int> hospitalizationDays = GeneratedColumn<int>(
      'hospitalization_days', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _hospitalizationSiteIdMeta =
      const VerificationMeta('hospitalizationSiteId');
  @override
  late final GeneratedColumn<int> hospitalizationSiteId = GeneratedColumn<int>(
      'hospitalization_site_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _respiratoryInsufficiencyTypeIdMeta =
      const VerificationMeta('respiratoryInsufficiencyTypeId');
  @override
  late final GeneratedColumn<int> respiratoryInsufficiencyTypeId =
      GeneratedColumn<int>(
          'respiratory_insufficiency_type_id', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _hemodynamicAssessmentMeta =
      const VerificationMeta('hemodynamicAssessment');
  @override
  late final GeneratedColumn<String> hemodynamicAssessment =
      GeneratedColumn<String>('hemodynamic_assessment', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _medicalDiagnosisMeta =
      const VerificationMeta('medicalDiagnosis');
  @override
  late final GeneratedColumn<String> medicalDiagnosis = GeneratedColumn<String>(
      'medical_diagnosis', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cigaretteTypeIdMeta =
      const VerificationMeta('cigaretteTypeId');
  @override
  late final GeneratedColumn<int> cigaretteTypeId = GeneratedColumn<int>(
      'cigarette_type_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _carbonMonoxideMeta =
      const VerificationMeta('carbonMonoxide');
  @override
  late final GeneratedColumn<double> carbonMonoxide = GeneratedColumn<double>(
      'carbon_monoxide', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _tobaccoLoadMeta =
      const VerificationMeta('tobaccoLoad');
  @override
  late final GeneratedColumn<double> tobaccoLoad = GeneratedColumn<double>(
      'tobacco_load', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _tobaccoLoadTraditionalMeta =
      const VerificationMeta('tobaccoLoadTraditional');
  @override
  late final GeneratedColumn<double> tobaccoLoadTraditional =
      GeneratedColumn<double>('tobacco_load_traditional', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _tobaccoLoadVapingMeta =
      const VerificationMeta('tobaccoLoadVaping');
  @override
  late final GeneratedColumn<double> tobaccoLoadVaping =
      GeneratedColumn<double>('tobacco_load_vaping', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _consumptionDurationYearsMeta =
      const VerificationMeta('consumptionDurationYears');
  @override
  late final GeneratedColumn<int> consumptionDurationYears =
      GeneratedColumn<int>('consumption_duration_years', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _consumptionDurationMonthsMeta =
      const VerificationMeta('consumptionDurationMonths');
  @override
  late final GeneratedColumn<int> consumptionDurationMonths =
      GeneratedColumn<int>('consumption_duration_months', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nicotineQuantityIdMeta =
      const VerificationMeta('nicotineQuantityId');
  @override
  late final GeneratedColumn<int> nicotineQuantityId = GeneratedColumn<int>(
      'nicotine_quantity_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _consumptionDurationTraditionalYearsMeta =
      const VerificationMeta('consumptionDurationTraditionalYears');
  @override
  late final GeneratedColumn<int> consumptionDurationTraditionalYears =
      GeneratedColumn<int>(
          'consumption_duration_traditional_years', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _consumptionDurationTraditionalMonthsMeta =
      const VerificationMeta('consumptionDurationTraditionalMonths');
  @override
  late final GeneratedColumn<int> consumptionDurationTraditionalMonths =
      GeneratedColumn<int>(
          'consumption_duration_traditional_months', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _consumptionDurationVapingYearsMeta =
      const VerificationMeta('consumptionDurationVapingYears');
  @override
  late final GeneratedColumn<int> consumptionDurationVapingYears =
      GeneratedColumn<int>(
          'consumption_duration_vaping_years', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _consumptionDurationVapingMonthsMeta =
      const VerificationMeta('consumptionDurationVapingMonths');
  @override
  late final GeneratedColumn<int> consumptionDurationVapingMonths =
      GeneratedColumn<int>(
          'consumption_duration_vaping_months', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _cessationTimeTraditionalYearsMeta =
      const VerificationMeta('cessationTimeTraditionalYears');
  @override
  late final GeneratedColumn<int> cessationTimeTraditionalYears =
      GeneratedColumn<int>(
          'cessation_time_traditional_years', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _cessationTimeTraditionalMonthsMeta =
      const VerificationMeta('cessationTimeTraditionalMonths');
  @override
  late final GeneratedColumn<int> cessationTimeTraditionalMonths =
      GeneratedColumn<int>(
          'cessation_time_traditional_months', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _cessationTimeVapingYearsMeta =
      const VerificationMeta('cessationTimeVapingYears');
  @override
  late final GeneratedColumn<int> cessationTimeVapingYears =
      GeneratedColumn<int>('cessation_time_vaping_years', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _cessationTimeVapingMonthsMeta =
      const VerificationMeta('cessationTimeVapingMonths');
  @override
  late final GeneratedColumn<int> cessationTimeVapingMonths =
      GeneratedColumn<int>('cessation_time_vaping_months', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _participationWeekMeta =
      const VerificationMeta('participationWeek');
  @override
  late final GeneratedColumn<int> participationWeek = GeneratedColumn<int>(
      'participation_week', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _cessationTimeIdMeta =
      const VerificationMeta('cessationTimeId');
  @override
  late final GeneratedColumn<int> cessationTimeId = GeneratedColumn<int>(
      'cessation_time_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _healthPerceptionIdMeta =
      const VerificationMeta('healthPerceptionId');
  @override
  late final GeneratedColumn<int> healthPerceptionId = GeneratedColumn<int>(
      'health_perception_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _audioNoisePathMeta =
      const VerificationMeta('audioNoisePath');
  @override
  late final GeneratedColumn<String> audioNoisePath = GeneratedColumn<String>(
      'audio_noise_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _audioNoiseMeta =
      const VerificationMeta('audioNoise');
  @override
  late final GeneratedColumn<Uint8List> audioNoise = GeneratedColumn<Uint8List>(
      'audio_noise', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _audioNoiseSynchronizedMeta =
      const VerificationMeta('audioNoiseSynchronized');
  @override
  late final GeneratedColumn<bool> audioNoiseSynchronized =
      GeneratedColumn<bool>('audio_noise_synchronized', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("audio_noise_synchronized" IN (0, 1))'));
  static const VerificationMeta _audioVocalPathMeta =
      const VerificationMeta('audioVocalPath');
  @override
  late final GeneratedColumn<String> audioVocalPath = GeneratedColumn<String>(
      'audio_vocal_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _audioVocalMeta =
      const VerificationMeta('audioVocal');
  @override
  late final GeneratedColumn<Uint8List> audioVocal = GeneratedColumn<Uint8List>(
      'audio_vocal', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _audioVocalSynchronizedMeta =
      const VerificationMeta('audioVocalSynchronized');
  @override
  late final GeneratedColumn<bool> audioVocalSynchronized =
      GeneratedColumn<bool>('audio_vocal_synchronized', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("audio_vocal_synchronized" IN (0, 1))'));
  static const VerificationMeta _audioSentencePathMeta =
      const VerificationMeta('audioSentencePath');
  @override
  late final GeneratedColumn<String> audioSentencePath =
      GeneratedColumn<String>('audio_sentence_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _audioSentenceMeta =
      const VerificationMeta('audioSentence');
  @override
  late final GeneratedColumn<Uint8List> audioSentence =
      GeneratedColumn<Uint8List>('audio_sentence', aliasedName, true,
          type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _audioSentenceSynchronizedMeta =
      const VerificationMeta('audioSentenceSynchronized');
  @override
  late final GeneratedColumn<bool> audioSentenceSynchronized =
      GeneratedColumn<bool>('audio_sentence_synchronized', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("audio_sentence_synchronized" IN (0, 1))'));
  static const VerificationMeta _audioNurseryRhymePathMeta =
      const VerificationMeta('audioNurseryRhymePath');
  @override
  late final GeneratedColumn<String> audioNurseryRhymePath =
      GeneratedColumn<String>('audio_nursery_rhyme_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _audioNurseryRhymeMeta =
      const VerificationMeta('audioNurseryRhyme');
  @override
  late final GeneratedColumn<Uint8List> audioNurseryRhyme =
      GeneratedColumn<Uint8List>('audio_nursery_rhyme', aliasedName, true,
          type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _audioNurseryRhymeSynchronizedMeta =
      const VerificationMeta('audioNurseryRhymeSynchronized');
  @override
  late final GeneratedColumn<bool> audioNurseryRhymeSynchronized =
      GeneratedColumn<bool>(
          'audio_nursery_rhyme_synchronized', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("audio_nursery_rhyme_synchronized" IN (0, 1))'));
  static const VerificationMeta _comorbidityIdsMeta =
      const VerificationMeta('comorbidityIds');
  @override
  late final GeneratedColumn<String> comorbidityIds = GeneratedColumn<String>(
      'comorbidity_ids', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        synchronized,
        collectionSite,
        identifier,
        otherComorbidities,
        smokerId,
        genderId,
        weight,
        height,
        bloodPressure,
        age,
        heartRate,
        respiratoryRate,
        saturation,
        studyTypeId,
        collectorUserId,
        collectionDate,
        gasometryPaO2,
        gasometryPaCo2,
        gasometryPH,
        hospitalizationDays,
        hospitalizationSiteId,
        respiratoryInsufficiencyTypeId,
        hemodynamicAssessment,
        medicalDiagnosis,
        cigaretteTypeId,
        carbonMonoxide,
        tobaccoLoad,
        tobaccoLoadTraditional,
        tobaccoLoadVaping,
        consumptionDurationYears,
        consumptionDurationMonths,
        nicotineQuantityId,
        consumptionDurationTraditionalYears,
        consumptionDurationTraditionalMonths,
        consumptionDurationVapingYears,
        consumptionDurationVapingMonths,
        cessationTimeTraditionalYears,
        cessationTimeTraditionalMonths,
        cessationTimeVapingYears,
        cessationTimeVapingMonths,
        participationWeek,
        cessationTimeId,
        healthPerceptionId,
        audioNoisePath,
        audioNoise,
        audioNoiseSynchronized,
        audioVocalPath,
        audioVocal,
        audioVocalSynchronized,
        audioSentencePath,
        audioSentence,
        audioSentenceSynchronized,
        audioNurseryRhymePath,
        audioNurseryRhyme,
        audioNurseryRhymeSynchronized,
        comorbidityIds
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patients';
  @override
  VerificationContext validateIntegrity(Insertable<Patient> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('synchronized')) {
      context.handle(
          _synchronizedMeta,
          synchronized.isAcceptableOrUnknown(
              data['synchronized']!, _synchronizedMeta));
    } else if (isInserting) {
      context.missing(_synchronizedMeta);
    }
    if (data.containsKey('collection_site')) {
      context.handle(
          _collectionSiteMeta,
          collectionSite.isAcceptableOrUnknown(
              data['collection_site']!, _collectionSiteMeta));
    }
    if (data.containsKey('identifier')) {
      context.handle(
          _identifierMeta,
          identifier.isAcceptableOrUnknown(
              data['identifier']!, _identifierMeta));
    }
    if (data.containsKey('other_comorbidities')) {
      context.handle(
          _otherComorbiditiesMeta,
          otherComorbidities.isAcceptableOrUnknown(
              data['other_comorbidities']!, _otherComorbiditiesMeta));
    }
    if (data.containsKey('smoker_id')) {
      context.handle(_smokerIdMeta,
          smokerId.isAcceptableOrUnknown(data['smoker_id']!, _smokerIdMeta));
    }
    if (data.containsKey('gender_id')) {
      context.handle(_genderIdMeta,
          genderId.isAcceptableOrUnknown(data['gender_id']!, _genderIdMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    }
    if (data.containsKey('blood_pressure')) {
      context.handle(
          _bloodPressureMeta,
          bloodPressure.isAcceptableOrUnknown(
              data['blood_pressure']!, _bloodPressureMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    if (data.containsKey('heart_rate')) {
      context.handle(_heartRateMeta,
          heartRate.isAcceptableOrUnknown(data['heart_rate']!, _heartRateMeta));
    }
    if (data.containsKey('respiratory_rate')) {
      context.handle(
          _respiratoryRateMeta,
          respiratoryRate.isAcceptableOrUnknown(
              data['respiratory_rate']!, _respiratoryRateMeta));
    }
    if (data.containsKey('saturation')) {
      context.handle(
          _saturationMeta,
          saturation.isAcceptableOrUnknown(
              data['saturation']!, _saturationMeta));
    }
    if (data.containsKey('study_type_id')) {
      context.handle(
          _studyTypeIdMeta,
          studyTypeId.isAcceptableOrUnknown(
              data['study_type_id']!, _studyTypeIdMeta));
    }
    if (data.containsKey('collector_user_id')) {
      context.handle(
          _collectorUserIdMeta,
          collectorUserId.isAcceptableOrUnknown(
              data['collector_user_id']!, _collectorUserIdMeta));
    }
    if (data.containsKey('collection_date')) {
      context.handle(
          _collectionDateMeta,
          collectionDate.isAcceptableOrUnknown(
              data['collection_date']!, _collectionDateMeta));
    }
    if (data.containsKey('gasometry_pa_o2')) {
      context.handle(
          _gasometryPaO2Meta,
          gasometryPaO2.isAcceptableOrUnknown(
              data['gasometry_pa_o2']!, _gasometryPaO2Meta));
    }
    if (data.containsKey('gasometry_pa_co2')) {
      context.handle(
          _gasometryPaCo2Meta,
          gasometryPaCo2.isAcceptableOrUnknown(
              data['gasometry_pa_co2']!, _gasometryPaCo2Meta));
    }
    if (data.containsKey('gasometry_p_h')) {
      context.handle(
          _gasometryPHMeta,
          gasometryPH.isAcceptableOrUnknown(
              data['gasometry_p_h']!, _gasometryPHMeta));
    }
    if (data.containsKey('hospitalization_days')) {
      context.handle(
          _hospitalizationDaysMeta,
          hospitalizationDays.isAcceptableOrUnknown(
              data['hospitalization_days']!, _hospitalizationDaysMeta));
    }
    if (data.containsKey('hospitalization_site_id')) {
      context.handle(
          _hospitalizationSiteIdMeta,
          hospitalizationSiteId.isAcceptableOrUnknown(
              data['hospitalization_site_id']!, _hospitalizationSiteIdMeta));
    }
    if (data.containsKey('respiratory_insufficiency_type_id')) {
      context.handle(
          _respiratoryInsufficiencyTypeIdMeta,
          respiratoryInsufficiencyTypeId.isAcceptableOrUnknown(
              data['respiratory_insufficiency_type_id']!,
              _respiratoryInsufficiencyTypeIdMeta));
    }
    if (data.containsKey('hemodynamic_assessment')) {
      context.handle(
          _hemodynamicAssessmentMeta,
          hemodynamicAssessment.isAcceptableOrUnknown(
              data['hemodynamic_assessment']!, _hemodynamicAssessmentMeta));
    }
    if (data.containsKey('medical_diagnosis')) {
      context.handle(
          _medicalDiagnosisMeta,
          medicalDiagnosis.isAcceptableOrUnknown(
              data['medical_diagnosis']!, _medicalDiagnosisMeta));
    }
    if (data.containsKey('cigarette_type_id')) {
      context.handle(
          _cigaretteTypeIdMeta,
          cigaretteTypeId.isAcceptableOrUnknown(
              data['cigarette_type_id']!, _cigaretteTypeIdMeta));
    }
    if (data.containsKey('carbon_monoxide')) {
      context.handle(
          _carbonMonoxideMeta,
          carbonMonoxide.isAcceptableOrUnknown(
              data['carbon_monoxide']!, _carbonMonoxideMeta));
    }
    if (data.containsKey('tobacco_load')) {
      context.handle(
          _tobaccoLoadMeta,
          tobaccoLoad.isAcceptableOrUnknown(
              data['tobacco_load']!, _tobaccoLoadMeta));
    }
    if (data.containsKey('tobacco_load_traditional')) {
      context.handle(
          _tobaccoLoadTraditionalMeta,
          tobaccoLoadTraditional.isAcceptableOrUnknown(
              data['tobacco_load_traditional']!, _tobaccoLoadTraditionalMeta));
    }
    if (data.containsKey('tobacco_load_vaping')) {
      context.handle(
          _tobaccoLoadVapingMeta,
          tobaccoLoadVaping.isAcceptableOrUnknown(
              data['tobacco_load_vaping']!, _tobaccoLoadVapingMeta));
    }
    if (data.containsKey('consumption_duration_years')) {
      context.handle(
          _consumptionDurationYearsMeta,
          consumptionDurationYears.isAcceptableOrUnknown(
              data['consumption_duration_years']!,
              _consumptionDurationYearsMeta));
    }
    if (data.containsKey('consumption_duration_months')) {
      context.handle(
          _consumptionDurationMonthsMeta,
          consumptionDurationMonths.isAcceptableOrUnknown(
              data['consumption_duration_months']!,
              _consumptionDurationMonthsMeta));
    }
    if (data.containsKey('nicotine_quantity_id')) {
      context.handle(
          _nicotineQuantityIdMeta,
          nicotineQuantityId.isAcceptableOrUnknown(
              data['nicotine_quantity_id']!, _nicotineQuantityIdMeta));
    }
    if (data.containsKey('consumption_duration_traditional_years')) {
      context.handle(
          _consumptionDurationTraditionalYearsMeta,
          consumptionDurationTraditionalYears.isAcceptableOrUnknown(
              data['consumption_duration_traditional_years']!,
              _consumptionDurationTraditionalYearsMeta));
    }
    if (data.containsKey('consumption_duration_traditional_months')) {
      context.handle(
          _consumptionDurationTraditionalMonthsMeta,
          consumptionDurationTraditionalMonths.isAcceptableOrUnknown(
              data['consumption_duration_traditional_months']!,
              _consumptionDurationTraditionalMonthsMeta));
    }
    if (data.containsKey('consumption_duration_vaping_years')) {
      context.handle(
          _consumptionDurationVapingYearsMeta,
          consumptionDurationVapingYears.isAcceptableOrUnknown(
              data['consumption_duration_vaping_years']!,
              _consumptionDurationVapingYearsMeta));
    }
    if (data.containsKey('consumption_duration_vaping_months')) {
      context.handle(
          _consumptionDurationVapingMonthsMeta,
          consumptionDurationVapingMonths.isAcceptableOrUnknown(
              data['consumption_duration_vaping_months']!,
              _consumptionDurationVapingMonthsMeta));
    }
    if (data.containsKey('cessation_time_traditional_years')) {
      context.handle(
          _cessationTimeTraditionalYearsMeta,
          cessationTimeTraditionalYears.isAcceptableOrUnknown(
              data['cessation_time_traditional_years']!,
              _cessationTimeTraditionalYearsMeta));
    }
    if (data.containsKey('cessation_time_traditional_months')) {
      context.handle(
          _cessationTimeTraditionalMonthsMeta,
          cessationTimeTraditionalMonths.isAcceptableOrUnknown(
              data['cessation_time_traditional_months']!,
              _cessationTimeTraditionalMonthsMeta));
    }
    if (data.containsKey('cessation_time_vaping_years')) {
      context.handle(
          _cessationTimeVapingYearsMeta,
          cessationTimeVapingYears.isAcceptableOrUnknown(
              data['cessation_time_vaping_years']!,
              _cessationTimeVapingYearsMeta));
    }
    if (data.containsKey('cessation_time_vaping_months')) {
      context.handle(
          _cessationTimeVapingMonthsMeta,
          cessationTimeVapingMonths.isAcceptableOrUnknown(
              data['cessation_time_vaping_months']!,
              _cessationTimeVapingMonthsMeta));
    }
    if (data.containsKey('participation_week')) {
      context.handle(
          _participationWeekMeta,
          participationWeek.isAcceptableOrUnknown(
              data['participation_week']!, _participationWeekMeta));
    }
    if (data.containsKey('cessation_time_id')) {
      context.handle(
          _cessationTimeIdMeta,
          cessationTimeId.isAcceptableOrUnknown(
              data['cessation_time_id']!, _cessationTimeIdMeta));
    }
    if (data.containsKey('health_perception_id')) {
      context.handle(
          _healthPerceptionIdMeta,
          healthPerceptionId.isAcceptableOrUnknown(
              data['health_perception_id']!, _healthPerceptionIdMeta));
    }
    if (data.containsKey('audio_noise_path')) {
      context.handle(
          _audioNoisePathMeta,
          audioNoisePath.isAcceptableOrUnknown(
              data['audio_noise_path']!, _audioNoisePathMeta));
    }
    if (data.containsKey('audio_noise')) {
      context.handle(
          _audioNoiseMeta,
          audioNoise.isAcceptableOrUnknown(
              data['audio_noise']!, _audioNoiseMeta));
    }
    if (data.containsKey('audio_noise_synchronized')) {
      context.handle(
          _audioNoiseSynchronizedMeta,
          audioNoiseSynchronized.isAcceptableOrUnknown(
              data['audio_noise_synchronized']!, _audioNoiseSynchronizedMeta));
    } else if (isInserting) {
      context.missing(_audioNoiseSynchronizedMeta);
    }
    if (data.containsKey('audio_vocal_path')) {
      context.handle(
          _audioVocalPathMeta,
          audioVocalPath.isAcceptableOrUnknown(
              data['audio_vocal_path']!, _audioVocalPathMeta));
    }
    if (data.containsKey('audio_vocal')) {
      context.handle(
          _audioVocalMeta,
          audioVocal.isAcceptableOrUnknown(
              data['audio_vocal']!, _audioVocalMeta));
    }
    if (data.containsKey('audio_vocal_synchronized')) {
      context.handle(
          _audioVocalSynchronizedMeta,
          audioVocalSynchronized.isAcceptableOrUnknown(
              data['audio_vocal_synchronized']!, _audioVocalSynchronizedMeta));
    } else if (isInserting) {
      context.missing(_audioVocalSynchronizedMeta);
    }
    if (data.containsKey('audio_sentence_path')) {
      context.handle(
          _audioSentencePathMeta,
          audioSentencePath.isAcceptableOrUnknown(
              data['audio_sentence_path']!, _audioSentencePathMeta));
    }
    if (data.containsKey('audio_sentence')) {
      context.handle(
          _audioSentenceMeta,
          audioSentence.isAcceptableOrUnknown(
              data['audio_sentence']!, _audioSentenceMeta));
    }
    if (data.containsKey('audio_sentence_synchronized')) {
      context.handle(
          _audioSentenceSynchronizedMeta,
          audioSentenceSynchronized.isAcceptableOrUnknown(
              data['audio_sentence_synchronized']!,
              _audioSentenceSynchronizedMeta));
    } else if (isInserting) {
      context.missing(_audioSentenceSynchronizedMeta);
    }
    if (data.containsKey('audio_nursery_rhyme_path')) {
      context.handle(
          _audioNurseryRhymePathMeta,
          audioNurseryRhymePath.isAcceptableOrUnknown(
              data['audio_nursery_rhyme_path']!, _audioNurseryRhymePathMeta));
    }
    if (data.containsKey('audio_nursery_rhyme')) {
      context.handle(
          _audioNurseryRhymeMeta,
          audioNurseryRhyme.isAcceptableOrUnknown(
              data['audio_nursery_rhyme']!, _audioNurseryRhymeMeta));
    }
    if (data.containsKey('audio_nursery_rhyme_synchronized')) {
      context.handle(
          _audioNurseryRhymeSynchronizedMeta,
          audioNurseryRhymeSynchronized.isAcceptableOrUnknown(
              data['audio_nursery_rhyme_synchronized']!,
              _audioNurseryRhymeSynchronizedMeta));
    } else if (isInserting) {
      context.missing(_audioNurseryRhymeSynchronizedMeta);
    }
    if (data.containsKey('comorbidity_ids')) {
      context.handle(
          _comorbidityIdsMeta,
          comorbidityIds.isAcceptableOrUnknown(
              data['comorbidity_ids']!, _comorbidityIdsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Patient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Patient(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      synchronized: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synchronized'])!,
      collectionSite: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_site']),
      identifier: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identifier']),
      otherComorbidities: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}other_comorbidities']),
      smokerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}smoker_id']),
      genderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender_id']),
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight']),
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height']),
      bloodPressure: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blood_pressure']),
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
      heartRate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}heart_rate']),
      respiratoryRate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}respiratory_rate']),
      saturation: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}saturation']),
      studyTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}study_type_id']),
      collectorUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}collector_user_id']),
      collectionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}collection_date']),
      gasometryPaO2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}gasometry_pa_o2']),
      gasometryPaCo2: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}gasometry_pa_co2']),
      gasometryPH: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}gasometry_p_h']),
      hospitalizationDays: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}hospitalization_days']),
      hospitalizationSiteId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}hospitalization_site_id']),
      respiratoryInsufficiencyTypeId: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}respiratory_insufficiency_type_id']),
      hemodynamicAssessment: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}hemodynamic_assessment']),
      medicalDiagnosis: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}medical_diagnosis']),
      cigaretteTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cigarette_type_id']),
      carbonMonoxide: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carbon_monoxide']),
      tobaccoLoad: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tobacco_load']),
      tobaccoLoadTraditional: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}tobacco_load_traditional']),
      tobaccoLoadVaping: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}tobacco_load_vaping']),
      consumptionDurationYears: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}consumption_duration_years']),
      consumptionDurationMonths: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}consumption_duration_months']),
      nicotineQuantityId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}nicotine_quantity_id']),
      consumptionDurationTraditionalYears: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}consumption_duration_traditional_years']),
      consumptionDurationTraditionalMonths: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}consumption_duration_traditional_months']),
      consumptionDurationVapingYears: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}consumption_duration_vaping_years']),
      consumptionDurationVapingMonths: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}consumption_duration_vaping_months']),
      cessationTimeTraditionalYears: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}cessation_time_traditional_years']),
      cessationTimeTraditionalMonths: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}cessation_time_traditional_months']),
      cessationTimeVapingYears: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}cessation_time_vaping_years']),
      cessationTimeVapingMonths: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}cessation_time_vaping_months']),
      participationWeek: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}participation_week']),
      cessationTimeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cessation_time_id']),
      healthPerceptionId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}health_perception_id']),
      audioNoisePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audio_noise_path']),
      audioNoise: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}audio_noise']),
      audioNoiseSynchronized: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}audio_noise_synchronized'])!,
      audioVocalPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audio_vocal_path']),
      audioVocal: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}audio_vocal']),
      audioVocalSynchronized: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}audio_vocal_synchronized'])!,
      audioSentencePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audio_sentence_path']),
      audioSentence: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}audio_sentence']),
      audioSentenceSynchronized: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}audio_sentence_synchronized'])!,
      audioNurseryRhymePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}audio_nursery_rhyme_path']),
      audioNurseryRhyme: attachedDatabase.typeMapping.read(
          DriftSqlType.blob, data['${effectivePrefix}audio_nursery_rhyme']),
      audioNurseryRhymeSynchronized: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}audio_nursery_rhyme_synchronized'])!,
      comorbidityIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comorbidity_ids']),
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class Patient extends DataClass implements Insertable<Patient> {
  final int id;
  final bool synchronized;
  final String? collectionSite;
  final String? identifier;
  final String? otherComorbidities;
  final int? smokerId;
  final int? genderId;
  final double? weight;
  final double? height;
  final String? bloodPressure;
  final int? age;
  final int? heartRate;
  final int? respiratoryRate;
  final double? saturation;
  final int? studyTypeId;
  final int? collectorUserId;
  final DateTime? collectionDate;
  final double? gasometryPaO2;
  final double? gasometryPaCo2;
  final double? gasometryPH;
  final int? hospitalizationDays;
  final int? hospitalizationSiteId;
  final int? respiratoryInsufficiencyTypeId;
  final String? hemodynamicAssessment;
  final String? medicalDiagnosis;
  final int? cigaretteTypeId;
  final double? carbonMonoxide;
  final double? tobaccoLoad;
  final double? tobaccoLoadTraditional;
  final double? tobaccoLoadVaping;
  final int? consumptionDurationYears;
  final int? consumptionDurationMonths;
  final int? nicotineQuantityId;
  final int? consumptionDurationTraditionalYears;
  final int? consumptionDurationTraditionalMonths;
  final int? consumptionDurationVapingYears;
  final int? consumptionDurationVapingMonths;
  final int? cessationTimeTraditionalYears;
  final int? cessationTimeTraditionalMonths;
  final int? cessationTimeVapingYears;
  final int? cessationTimeVapingMonths;
  final int? participationWeek;
  final int? cessationTimeId;
  final int? healthPerceptionId;
  final String? audioNoisePath;
  final Uint8List? audioNoise;
  final bool audioNoiseSynchronized;
  final String? audioVocalPath;
  final Uint8List? audioVocal;
  final bool audioVocalSynchronized;
  final String? audioSentencePath;
  final Uint8List? audioSentence;
  final bool audioSentenceSynchronized;
  final String? audioNurseryRhymePath;
  final Uint8List? audioNurseryRhyme;
  final bool audioNurseryRhymeSynchronized;
  final String? comorbidityIds;
  const Patient(
      {required this.id,
      required this.synchronized,
      this.collectionSite,
      this.identifier,
      this.otherComorbidities,
      this.smokerId,
      this.genderId,
      this.weight,
      this.height,
      this.bloodPressure,
      this.age,
      this.heartRate,
      this.respiratoryRate,
      this.saturation,
      this.studyTypeId,
      this.collectorUserId,
      this.collectionDate,
      this.gasometryPaO2,
      this.gasometryPaCo2,
      this.gasometryPH,
      this.hospitalizationDays,
      this.hospitalizationSiteId,
      this.respiratoryInsufficiencyTypeId,
      this.hemodynamicAssessment,
      this.medicalDiagnosis,
      this.cigaretteTypeId,
      this.carbonMonoxide,
      this.tobaccoLoad,
      this.tobaccoLoadTraditional,
      this.tobaccoLoadVaping,
      this.consumptionDurationYears,
      this.consumptionDurationMonths,
      this.nicotineQuantityId,
      this.consumptionDurationTraditionalYears,
      this.consumptionDurationTraditionalMonths,
      this.consumptionDurationVapingYears,
      this.consumptionDurationVapingMonths,
      this.cessationTimeTraditionalYears,
      this.cessationTimeTraditionalMonths,
      this.cessationTimeVapingYears,
      this.cessationTimeVapingMonths,
      this.participationWeek,
      this.cessationTimeId,
      this.healthPerceptionId,
      this.audioNoisePath,
      this.audioNoise,
      required this.audioNoiseSynchronized,
      this.audioVocalPath,
      this.audioVocal,
      required this.audioVocalSynchronized,
      this.audioSentencePath,
      this.audioSentence,
      required this.audioSentenceSynchronized,
      this.audioNurseryRhymePath,
      this.audioNurseryRhyme,
      required this.audioNurseryRhymeSynchronized,
      this.comorbidityIds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['synchronized'] = Variable<bool>(synchronized);
    if (!nullToAbsent || collectionSite != null) {
      map['collection_site'] = Variable<String>(collectionSite);
    }
    if (!nullToAbsent || identifier != null) {
      map['identifier'] = Variable<String>(identifier);
    }
    if (!nullToAbsent || otherComorbidities != null) {
      map['other_comorbidities'] = Variable<String>(otherComorbidities);
    }
    if (!nullToAbsent || smokerId != null) {
      map['smoker_id'] = Variable<int>(smokerId);
    }
    if (!nullToAbsent || genderId != null) {
      map['gender_id'] = Variable<int>(genderId);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    if (!nullToAbsent || bloodPressure != null) {
      map['blood_pressure'] = Variable<String>(bloodPressure);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || heartRate != null) {
      map['heart_rate'] = Variable<int>(heartRate);
    }
    if (!nullToAbsent || respiratoryRate != null) {
      map['respiratory_rate'] = Variable<int>(respiratoryRate);
    }
    if (!nullToAbsent || saturation != null) {
      map['saturation'] = Variable<double>(saturation);
    }
    if (!nullToAbsent || studyTypeId != null) {
      map['study_type_id'] = Variable<int>(studyTypeId);
    }
    if (!nullToAbsent || collectorUserId != null) {
      map['collector_user_id'] = Variable<int>(collectorUserId);
    }
    if (!nullToAbsent || collectionDate != null) {
      map['collection_date'] = Variable<DateTime>(collectionDate);
    }
    if (!nullToAbsent || gasometryPaO2 != null) {
      map['gasometry_pa_o2'] = Variable<double>(gasometryPaO2);
    }
    if (!nullToAbsent || gasometryPaCo2 != null) {
      map['gasometry_pa_co2'] = Variable<double>(gasometryPaCo2);
    }
    if (!nullToAbsent || gasometryPH != null) {
      map['gasometry_p_h'] = Variable<double>(gasometryPH);
    }
    if (!nullToAbsent || hospitalizationDays != null) {
      map['hospitalization_days'] = Variable<int>(hospitalizationDays);
    }
    if (!nullToAbsent || hospitalizationSiteId != null) {
      map['hospitalization_site_id'] = Variable<int>(hospitalizationSiteId);
    }
    if (!nullToAbsent || respiratoryInsufficiencyTypeId != null) {
      map['respiratory_insufficiency_type_id'] =
          Variable<int>(respiratoryInsufficiencyTypeId);
    }
    if (!nullToAbsent || hemodynamicAssessment != null) {
      map['hemodynamic_assessment'] = Variable<String>(hemodynamicAssessment);
    }
    if (!nullToAbsent || medicalDiagnosis != null) {
      map['medical_diagnosis'] = Variable<String>(medicalDiagnosis);
    }
    if (!nullToAbsent || cigaretteTypeId != null) {
      map['cigarette_type_id'] = Variable<int>(cigaretteTypeId);
    }
    if (!nullToAbsent || carbonMonoxide != null) {
      map['carbon_monoxide'] = Variable<double>(carbonMonoxide);
    }
    if (!nullToAbsent || tobaccoLoad != null) {
      map['tobacco_load'] = Variable<double>(tobaccoLoad);
    }
    if (!nullToAbsent || tobaccoLoadTraditional != null) {
      map['tobacco_load_traditional'] =
          Variable<double>(tobaccoLoadTraditional);
    }
    if (!nullToAbsent || tobaccoLoadVaping != null) {
      map['tobacco_load_vaping'] = Variable<double>(tobaccoLoadVaping);
    }
    if (!nullToAbsent || consumptionDurationYears != null) {
      map['consumption_duration_years'] =
          Variable<int>(consumptionDurationYears);
    }
    if (!nullToAbsent || consumptionDurationMonths != null) {
      map['consumption_duration_months'] =
          Variable<int>(consumptionDurationMonths);
    }
    if (!nullToAbsent || nicotineQuantityId != null) {
      map['nicotine_quantity_id'] = Variable<int>(nicotineQuantityId);
    }
    if (!nullToAbsent || consumptionDurationTraditionalYears != null) {
      map['consumption_duration_traditional_years'] =
          Variable<int>(consumptionDurationTraditionalYears);
    }
    if (!nullToAbsent || consumptionDurationTraditionalMonths != null) {
      map['consumption_duration_traditional_months'] =
          Variable<int>(consumptionDurationTraditionalMonths);
    }
    if (!nullToAbsent || consumptionDurationVapingYears != null) {
      map['consumption_duration_vaping_years'] =
          Variable<int>(consumptionDurationVapingYears);
    }
    if (!nullToAbsent || consumptionDurationVapingMonths != null) {
      map['consumption_duration_vaping_months'] =
          Variable<int>(consumptionDurationVapingMonths);
    }
    if (!nullToAbsent || cessationTimeTraditionalYears != null) {
      map['cessation_time_traditional_years'] =
          Variable<int>(cessationTimeTraditionalYears);
    }
    if (!nullToAbsent || cessationTimeTraditionalMonths != null) {
      map['cessation_time_traditional_months'] =
          Variable<int>(cessationTimeTraditionalMonths);
    }
    if (!nullToAbsent || cessationTimeVapingYears != null) {
      map['cessation_time_vaping_years'] =
          Variable<int>(cessationTimeVapingYears);
    }
    if (!nullToAbsent || cessationTimeVapingMonths != null) {
      map['cessation_time_vaping_months'] =
          Variable<int>(cessationTimeVapingMonths);
    }
    if (!nullToAbsent || participationWeek != null) {
      map['participation_week'] = Variable<int>(participationWeek);
    }
    if (!nullToAbsent || cessationTimeId != null) {
      map['cessation_time_id'] = Variable<int>(cessationTimeId);
    }
    if (!nullToAbsent || healthPerceptionId != null) {
      map['health_perception_id'] = Variable<int>(healthPerceptionId);
    }
    if (!nullToAbsent || audioNoisePath != null) {
      map['audio_noise_path'] = Variable<String>(audioNoisePath);
    }
    if (!nullToAbsent || audioNoise != null) {
      map['audio_noise'] = Variable<Uint8List>(audioNoise);
    }
    map['audio_noise_synchronized'] = Variable<bool>(audioNoiseSynchronized);
    if (!nullToAbsent || audioVocalPath != null) {
      map['audio_vocal_path'] = Variable<String>(audioVocalPath);
    }
    if (!nullToAbsent || audioVocal != null) {
      map['audio_vocal'] = Variable<Uint8List>(audioVocal);
    }
    map['audio_vocal_synchronized'] = Variable<bool>(audioVocalSynchronized);
    if (!nullToAbsent || audioSentencePath != null) {
      map['audio_sentence_path'] = Variable<String>(audioSentencePath);
    }
    if (!nullToAbsent || audioSentence != null) {
      map['audio_sentence'] = Variable<Uint8List>(audioSentence);
    }
    map['audio_sentence_synchronized'] =
        Variable<bool>(audioSentenceSynchronized);
    if (!nullToAbsent || audioNurseryRhymePath != null) {
      map['audio_nursery_rhyme_path'] = Variable<String>(audioNurseryRhymePath);
    }
    if (!nullToAbsent || audioNurseryRhyme != null) {
      map['audio_nursery_rhyme'] = Variable<Uint8List>(audioNurseryRhyme);
    }
    map['audio_nursery_rhyme_synchronized'] =
        Variable<bool>(audioNurseryRhymeSynchronized);
    if (!nullToAbsent || comorbidityIds != null) {
      map['comorbidity_ids'] = Variable<String>(comorbidityIds);
    }
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      id: Value(id),
      synchronized: Value(synchronized),
      collectionSite: collectionSite == null && nullToAbsent
          ? const Value.absent()
          : Value(collectionSite),
      identifier: identifier == null && nullToAbsent
          ? const Value.absent()
          : Value(identifier),
      otherComorbidities: otherComorbidities == null && nullToAbsent
          ? const Value.absent()
          : Value(otherComorbidities),
      smokerId: smokerId == null && nullToAbsent
          ? const Value.absent()
          : Value(smokerId),
      genderId: genderId == null && nullToAbsent
          ? const Value.absent()
          : Value(genderId),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      bloodPressure: bloodPressure == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodPressure),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      heartRate: heartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(heartRate),
      respiratoryRate: respiratoryRate == null && nullToAbsent
          ? const Value.absent()
          : Value(respiratoryRate),
      saturation: saturation == null && nullToAbsent
          ? const Value.absent()
          : Value(saturation),
      studyTypeId: studyTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(studyTypeId),
      collectorUserId: collectorUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(collectorUserId),
      collectionDate: collectionDate == null && nullToAbsent
          ? const Value.absent()
          : Value(collectionDate),
      gasometryPaO2: gasometryPaO2 == null && nullToAbsent
          ? const Value.absent()
          : Value(gasometryPaO2),
      gasometryPaCo2: gasometryPaCo2 == null && nullToAbsent
          ? const Value.absent()
          : Value(gasometryPaCo2),
      gasometryPH: gasometryPH == null && nullToAbsent
          ? const Value.absent()
          : Value(gasometryPH),
      hospitalizationDays: hospitalizationDays == null && nullToAbsent
          ? const Value.absent()
          : Value(hospitalizationDays),
      hospitalizationSiteId: hospitalizationSiteId == null && nullToAbsent
          ? const Value.absent()
          : Value(hospitalizationSiteId),
      respiratoryInsufficiencyTypeId:
          respiratoryInsufficiencyTypeId == null && nullToAbsent
              ? const Value.absent()
              : Value(respiratoryInsufficiencyTypeId),
      hemodynamicAssessment: hemodynamicAssessment == null && nullToAbsent
          ? const Value.absent()
          : Value(hemodynamicAssessment),
      medicalDiagnosis: medicalDiagnosis == null && nullToAbsent
          ? const Value.absent()
          : Value(medicalDiagnosis),
      cigaretteTypeId: cigaretteTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(cigaretteTypeId),
      carbonMonoxide: carbonMonoxide == null && nullToAbsent
          ? const Value.absent()
          : Value(carbonMonoxide),
      tobaccoLoad: tobaccoLoad == null && nullToAbsent
          ? const Value.absent()
          : Value(tobaccoLoad),
      tobaccoLoadTraditional: tobaccoLoadTraditional == null && nullToAbsent
          ? const Value.absent()
          : Value(tobaccoLoadTraditional),
      tobaccoLoadVaping: tobaccoLoadVaping == null && nullToAbsent
          ? const Value.absent()
          : Value(tobaccoLoadVaping),
      consumptionDurationYears: consumptionDurationYears == null && nullToAbsent
          ? const Value.absent()
          : Value(consumptionDurationYears),
      consumptionDurationMonths:
          consumptionDurationMonths == null && nullToAbsent
              ? const Value.absent()
              : Value(consumptionDurationMonths),
      nicotineQuantityId: nicotineQuantityId == null && nullToAbsent
          ? const Value.absent()
          : Value(nicotineQuantityId),
      consumptionDurationTraditionalYears:
          consumptionDurationTraditionalYears == null && nullToAbsent
              ? const Value.absent()
              : Value(consumptionDurationTraditionalYears),
      consumptionDurationTraditionalMonths:
          consumptionDurationTraditionalMonths == null && nullToAbsent
              ? const Value.absent()
              : Value(consumptionDurationTraditionalMonths),
      consumptionDurationVapingYears:
          consumptionDurationVapingYears == null && nullToAbsent
              ? const Value.absent()
              : Value(consumptionDurationVapingYears),
      consumptionDurationVapingMonths:
          consumptionDurationVapingMonths == null && nullToAbsent
              ? const Value.absent()
              : Value(consumptionDurationVapingMonths),
      cessationTimeTraditionalYears:
          cessationTimeTraditionalYears == null && nullToAbsent
              ? const Value.absent()
              : Value(cessationTimeTraditionalYears),
      cessationTimeTraditionalMonths:
          cessationTimeTraditionalMonths == null && nullToAbsent
              ? const Value.absent()
              : Value(cessationTimeTraditionalMonths),
      cessationTimeVapingYears: cessationTimeVapingYears == null && nullToAbsent
          ? const Value.absent()
          : Value(cessationTimeVapingYears),
      cessationTimeVapingMonths:
          cessationTimeVapingMonths == null && nullToAbsent
              ? const Value.absent()
              : Value(cessationTimeVapingMonths),
      participationWeek: participationWeek == null && nullToAbsent
          ? const Value.absent()
          : Value(participationWeek),
      cessationTimeId: cessationTimeId == null && nullToAbsent
          ? const Value.absent()
          : Value(cessationTimeId),
      healthPerceptionId: healthPerceptionId == null && nullToAbsent
          ? const Value.absent()
          : Value(healthPerceptionId),
      audioNoisePath: audioNoisePath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioNoisePath),
      audioNoise: audioNoise == null && nullToAbsent
          ? const Value.absent()
          : Value(audioNoise),
      audioNoiseSynchronized: Value(audioNoiseSynchronized),
      audioVocalPath: audioVocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioVocalPath),
      audioVocal: audioVocal == null && nullToAbsent
          ? const Value.absent()
          : Value(audioVocal),
      audioVocalSynchronized: Value(audioVocalSynchronized),
      audioSentencePath: audioSentencePath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioSentencePath),
      audioSentence: audioSentence == null && nullToAbsent
          ? const Value.absent()
          : Value(audioSentence),
      audioSentenceSynchronized: Value(audioSentenceSynchronized),
      audioNurseryRhymePath: audioNurseryRhymePath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioNurseryRhymePath),
      audioNurseryRhyme: audioNurseryRhyme == null && nullToAbsent
          ? const Value.absent()
          : Value(audioNurseryRhyme),
      audioNurseryRhymeSynchronized: Value(audioNurseryRhymeSynchronized),
      comorbidityIds: comorbidityIds == null && nullToAbsent
          ? const Value.absent()
          : Value(comorbidityIds),
    );
  }

  factory Patient.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Patient(
      id: serializer.fromJson<int>(json['id']),
      synchronized: serializer.fromJson<bool>(json['synchronized']),
      collectionSite: serializer.fromJson<String?>(json['collectionSite']),
      identifier: serializer.fromJson<String?>(json['identifier']),
      otherComorbidities:
          serializer.fromJson<String?>(json['otherComorbidities']),
      smokerId: serializer.fromJson<int?>(json['smokerId']),
      genderId: serializer.fromJson<int?>(json['genderId']),
      weight: serializer.fromJson<double?>(json['weight']),
      height: serializer.fromJson<double?>(json['height']),
      bloodPressure: serializer.fromJson<String?>(json['bloodPressure']),
      age: serializer.fromJson<int?>(json['age']),
      heartRate: serializer.fromJson<int?>(json['heartRate']),
      respiratoryRate: serializer.fromJson<int?>(json['respiratoryRate']),
      saturation: serializer.fromJson<double?>(json['saturation']),
      studyTypeId: serializer.fromJson<int?>(json['studyTypeId']),
      collectorUserId: serializer.fromJson<int?>(json['collectorUserId']),
      collectionDate: serializer.fromJson<DateTime?>(json['collectionDate']),
      gasometryPaO2: serializer.fromJson<double?>(json['gasometryPaO2']),
      gasometryPaCo2: serializer.fromJson<double?>(json['gasometryPaCo2']),
      gasometryPH: serializer.fromJson<double?>(json['gasometryPH']),
      hospitalizationDays:
          serializer.fromJson<int?>(json['hospitalizationDays']),
      hospitalizationSiteId:
          serializer.fromJson<int?>(json['hospitalizationSiteId']),
      respiratoryInsufficiencyTypeId:
          serializer.fromJson<int?>(json['respiratoryInsufficiencyTypeId']),
      hemodynamicAssessment:
          serializer.fromJson<String?>(json['hemodynamicAssessment']),
      medicalDiagnosis: serializer.fromJson<String?>(json['medicalDiagnosis']),
      cigaretteTypeId: serializer.fromJson<int?>(json['cigaretteTypeId']),
      carbonMonoxide: serializer.fromJson<double?>(json['carbonMonoxide']),
      tobaccoLoad: serializer.fromJson<double?>(json['tobaccoLoad']),
      tobaccoLoadTraditional:
          serializer.fromJson<double?>(json['tobaccoLoadTraditional']),
      tobaccoLoadVaping:
          serializer.fromJson<double?>(json['tobaccoLoadVaping']),
      consumptionDurationYears:
          serializer.fromJson<int?>(json['consumptionDurationYears']),
      consumptionDurationMonths:
          serializer.fromJson<int?>(json['consumptionDurationMonths']),
      nicotineQuantityId: serializer.fromJson<int?>(json['nicotineQuantityId']),
      consumptionDurationTraditionalYears: serializer
          .fromJson<int?>(json['consumptionDurationTraditionalYears']),
      consumptionDurationTraditionalMonths: serializer
          .fromJson<int?>(json['consumptionDurationTraditionalMonths']),
      consumptionDurationVapingYears:
          serializer.fromJson<int?>(json['consumptionDurationVapingYears']),
      consumptionDurationVapingMonths:
          serializer.fromJson<int?>(json['consumptionDurationVapingMonths']),
      cessationTimeTraditionalYears:
          serializer.fromJson<int?>(json['cessationTimeTraditionalYears']),
      cessationTimeTraditionalMonths:
          serializer.fromJson<int?>(json['cessationTimeTraditionalMonths']),
      cessationTimeVapingYears:
          serializer.fromJson<int?>(json['cessationTimeVapingYears']),
      cessationTimeVapingMonths:
          serializer.fromJson<int?>(json['cessationTimeVapingMonths']),
      participationWeek: serializer.fromJson<int?>(json['participationWeek']),
      cessationTimeId: serializer.fromJson<int?>(json['cessationTimeId']),
      healthPerceptionId: serializer.fromJson<int?>(json['healthPerceptionId']),
      audioNoisePath: serializer.fromJson<String?>(json['audioNoisePath']),
      audioNoise: serializer.fromJson<Uint8List?>(json['audioNoise']),
      audioNoiseSynchronized:
          serializer.fromJson<bool>(json['audioNoiseSynchronized']),
      audioVocalPath: serializer.fromJson<String?>(json['audioVocalPath']),
      audioVocal: serializer.fromJson<Uint8List?>(json['audioVocal']),
      audioVocalSynchronized:
          serializer.fromJson<bool>(json['audioVocalSynchronized']),
      audioSentencePath:
          serializer.fromJson<String?>(json['audioSentencePath']),
      audioSentence: serializer.fromJson<Uint8List?>(json['audioSentence']),
      audioSentenceSynchronized:
          serializer.fromJson<bool>(json['audioSentenceSynchronized']),
      audioNurseryRhymePath:
          serializer.fromJson<String?>(json['audioNurseryRhymePath']),
      audioNurseryRhyme:
          serializer.fromJson<Uint8List?>(json['audioNurseryRhyme']),
      audioNurseryRhymeSynchronized:
          serializer.fromJson<bool>(json['audioNurseryRhymeSynchronized']),
      comorbidityIds: serializer.fromJson<String?>(json['comorbidityIds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'synchronized': serializer.toJson<bool>(synchronized),
      'collectionSite': serializer.toJson<String?>(collectionSite),
      'identifier': serializer.toJson<String?>(identifier),
      'otherComorbidities': serializer.toJson<String?>(otherComorbidities),
      'smokerId': serializer.toJson<int?>(smokerId),
      'genderId': serializer.toJson<int?>(genderId),
      'weight': serializer.toJson<double?>(weight),
      'height': serializer.toJson<double?>(height),
      'bloodPressure': serializer.toJson<String?>(bloodPressure),
      'age': serializer.toJson<int?>(age),
      'heartRate': serializer.toJson<int?>(heartRate),
      'respiratoryRate': serializer.toJson<int?>(respiratoryRate),
      'saturation': serializer.toJson<double?>(saturation),
      'studyTypeId': serializer.toJson<int?>(studyTypeId),
      'collectorUserId': serializer.toJson<int?>(collectorUserId),
      'collectionDate': serializer.toJson<DateTime?>(collectionDate),
      'gasometryPaO2': serializer.toJson<double?>(gasometryPaO2),
      'gasometryPaCo2': serializer.toJson<double?>(gasometryPaCo2),
      'gasometryPH': serializer.toJson<double?>(gasometryPH),
      'hospitalizationDays': serializer.toJson<int?>(hospitalizationDays),
      'hospitalizationSiteId': serializer.toJson<int?>(hospitalizationSiteId),
      'respiratoryInsufficiencyTypeId':
          serializer.toJson<int?>(respiratoryInsufficiencyTypeId),
      'hemodynamicAssessment':
          serializer.toJson<String?>(hemodynamicAssessment),
      'medicalDiagnosis': serializer.toJson<String?>(medicalDiagnosis),
      'cigaretteTypeId': serializer.toJson<int?>(cigaretteTypeId),
      'carbonMonoxide': serializer.toJson<double?>(carbonMonoxide),
      'tobaccoLoad': serializer.toJson<double?>(tobaccoLoad),
      'tobaccoLoadTraditional':
          serializer.toJson<double?>(tobaccoLoadTraditional),
      'tobaccoLoadVaping': serializer.toJson<double?>(tobaccoLoadVaping),
      'consumptionDurationYears':
          serializer.toJson<int?>(consumptionDurationYears),
      'consumptionDurationMonths':
          serializer.toJson<int?>(consumptionDurationMonths),
      'nicotineQuantityId': serializer.toJson<int?>(nicotineQuantityId),
      'consumptionDurationTraditionalYears':
          serializer.toJson<int?>(consumptionDurationTraditionalYears),
      'consumptionDurationTraditionalMonths':
          serializer.toJson<int?>(consumptionDurationTraditionalMonths),
      'consumptionDurationVapingYears':
          serializer.toJson<int?>(consumptionDurationVapingYears),
      'consumptionDurationVapingMonths':
          serializer.toJson<int?>(consumptionDurationVapingMonths),
      'cessationTimeTraditionalYears':
          serializer.toJson<int?>(cessationTimeTraditionalYears),
      'cessationTimeTraditionalMonths':
          serializer.toJson<int?>(cessationTimeTraditionalMonths),
      'cessationTimeVapingYears':
          serializer.toJson<int?>(cessationTimeVapingYears),
      'cessationTimeVapingMonths':
          serializer.toJson<int?>(cessationTimeVapingMonths),
      'participationWeek': serializer.toJson<int?>(participationWeek),
      'cessationTimeId': serializer.toJson<int?>(cessationTimeId),
      'healthPerceptionId': serializer.toJson<int?>(healthPerceptionId),
      'audioNoisePath': serializer.toJson<String?>(audioNoisePath),
      'audioNoise': serializer.toJson<Uint8List?>(audioNoise),
      'audioNoiseSynchronized': serializer.toJson<bool>(audioNoiseSynchronized),
      'audioVocalPath': serializer.toJson<String?>(audioVocalPath),
      'audioVocal': serializer.toJson<Uint8List?>(audioVocal),
      'audioVocalSynchronized': serializer.toJson<bool>(audioVocalSynchronized),
      'audioSentencePath': serializer.toJson<String?>(audioSentencePath),
      'audioSentence': serializer.toJson<Uint8List?>(audioSentence),
      'audioSentenceSynchronized':
          serializer.toJson<bool>(audioSentenceSynchronized),
      'audioNurseryRhymePath':
          serializer.toJson<String?>(audioNurseryRhymePath),
      'audioNurseryRhyme': serializer.toJson<Uint8List?>(audioNurseryRhyme),
      'audioNurseryRhymeSynchronized':
          serializer.toJson<bool>(audioNurseryRhymeSynchronized),
      'comorbidityIds': serializer.toJson<String?>(comorbidityIds),
    };
  }

  Patient copyWith(
          {int? id,
          bool? synchronized,
          Value<String?> collectionSite = const Value.absent(),
          Value<String?> identifier = const Value.absent(),
          Value<String?> otherComorbidities = const Value.absent(),
          Value<int?> smokerId = const Value.absent(),
          Value<int?> genderId = const Value.absent(),
          Value<double?> weight = const Value.absent(),
          Value<double?> height = const Value.absent(),
          Value<String?> bloodPressure = const Value.absent(),
          Value<int?> age = const Value.absent(),
          Value<int?> heartRate = const Value.absent(),
          Value<int?> respiratoryRate = const Value.absent(),
          Value<double?> saturation = const Value.absent(),
          Value<int?> studyTypeId = const Value.absent(),
          Value<int?> collectorUserId = const Value.absent(),
          Value<DateTime?> collectionDate = const Value.absent(),
          Value<double?> gasometryPaO2 = const Value.absent(),
          Value<double?> gasometryPaCo2 = const Value.absent(),
          Value<double?> gasometryPH = const Value.absent(),
          Value<int?> hospitalizationDays = const Value.absent(),
          Value<int?> hospitalizationSiteId = const Value.absent(),
          Value<int?> respiratoryInsufficiencyTypeId = const Value.absent(),
          Value<String?> hemodynamicAssessment = const Value.absent(),
          Value<String?> medicalDiagnosis = const Value.absent(),
          Value<int?> cigaretteTypeId = const Value.absent(),
          Value<double?> carbonMonoxide = const Value.absent(),
          Value<double?> tobaccoLoad = const Value.absent(),
          Value<double?> tobaccoLoadTraditional = const Value.absent(),
          Value<double?> tobaccoLoadVaping = const Value.absent(),
          Value<int?> consumptionDurationYears = const Value.absent(),
          Value<int?> consumptionDurationMonths = const Value.absent(),
          Value<int?> nicotineQuantityId = const Value.absent(),
          Value<int?> consumptionDurationTraditionalYears =
              const Value.absent(),
          Value<int?> consumptionDurationTraditionalMonths =
              const Value.absent(),
          Value<int?> consumptionDurationVapingYears = const Value.absent(),
          Value<int?> consumptionDurationVapingMonths = const Value.absent(),
          Value<int?> cessationTimeTraditionalYears = const Value.absent(),
          Value<int?> cessationTimeTraditionalMonths = const Value.absent(),
          Value<int?> cessationTimeVapingYears = const Value.absent(),
          Value<int?> cessationTimeVapingMonths = const Value.absent(),
          Value<int?> participationWeek = const Value.absent(),
          Value<int?> cessationTimeId = const Value.absent(),
          Value<int?> healthPerceptionId = const Value.absent(),
          Value<String?> audioNoisePath = const Value.absent(),
          Value<Uint8List?> audioNoise = const Value.absent(),
          bool? audioNoiseSynchronized,
          Value<String?> audioVocalPath = const Value.absent(),
          Value<Uint8List?> audioVocal = const Value.absent(),
          bool? audioVocalSynchronized,
          Value<String?> audioSentencePath = const Value.absent(),
          Value<Uint8List?> audioSentence = const Value.absent(),
          bool? audioSentenceSynchronized,
          Value<String?> audioNurseryRhymePath = const Value.absent(),
          Value<Uint8List?> audioNurseryRhyme = const Value.absent(),
          bool? audioNurseryRhymeSynchronized,
          Value<String?> comorbidityIds = const Value.absent()}) =>
      Patient(
        id: id ?? this.id,
        synchronized: synchronized ?? this.synchronized,
        collectionSite:
            collectionSite.present ? collectionSite.value : this.collectionSite,
        identifier: identifier.present ? identifier.value : this.identifier,
        otherComorbidities: otherComorbidities.present
            ? otherComorbidities.value
            : this.otherComorbidities,
        smokerId: smokerId.present ? smokerId.value : this.smokerId,
        genderId: genderId.present ? genderId.value : this.genderId,
        weight: weight.present ? weight.value : this.weight,
        height: height.present ? height.value : this.height,
        bloodPressure:
            bloodPressure.present ? bloodPressure.value : this.bloodPressure,
        age: age.present ? age.value : this.age,
        heartRate: heartRate.present ? heartRate.value : this.heartRate,
        respiratoryRate: respiratoryRate.present
            ? respiratoryRate.value
            : this.respiratoryRate,
        saturation: saturation.present ? saturation.value : this.saturation,
        studyTypeId: studyTypeId.present ? studyTypeId.value : this.studyTypeId,
        collectorUserId: collectorUserId.present
            ? collectorUserId.value
            : this.collectorUserId,
        collectionDate:
            collectionDate.present ? collectionDate.value : this.collectionDate,
        gasometryPaO2:
            gasometryPaO2.present ? gasometryPaO2.value : this.gasometryPaO2,
        gasometryPaCo2:
            gasometryPaCo2.present ? gasometryPaCo2.value : this.gasometryPaCo2,
        gasometryPH: gasometryPH.present ? gasometryPH.value : this.gasometryPH,
        hospitalizationDays: hospitalizationDays.present
            ? hospitalizationDays.value
            : this.hospitalizationDays,
        hospitalizationSiteId: hospitalizationSiteId.present
            ? hospitalizationSiteId.value
            : this.hospitalizationSiteId,
        respiratoryInsufficiencyTypeId: respiratoryInsufficiencyTypeId.present
            ? respiratoryInsufficiencyTypeId.value
            : this.respiratoryInsufficiencyTypeId,
        hemodynamicAssessment: hemodynamicAssessment.present
            ? hemodynamicAssessment.value
            : this.hemodynamicAssessment,
        medicalDiagnosis: medicalDiagnosis.present
            ? medicalDiagnosis.value
            : this.medicalDiagnosis,
        cigaretteTypeId: cigaretteTypeId.present
            ? cigaretteTypeId.value
            : this.cigaretteTypeId,
        carbonMonoxide:
            carbonMonoxide.present ? carbonMonoxide.value : this.carbonMonoxide,
        tobaccoLoad: tobaccoLoad.present ? tobaccoLoad.value : this.tobaccoLoad,
        tobaccoLoadTraditional: tobaccoLoadTraditional.present
            ? tobaccoLoadTraditional.value
            : this.tobaccoLoadTraditional,
        tobaccoLoadVaping: tobaccoLoadVaping.present
            ? tobaccoLoadVaping.value
            : this.tobaccoLoadVaping,
        consumptionDurationYears: consumptionDurationYears.present
            ? consumptionDurationYears.value
            : this.consumptionDurationYears,
        consumptionDurationMonths: consumptionDurationMonths.present
            ? consumptionDurationMonths.value
            : this.consumptionDurationMonths,
        nicotineQuantityId: nicotineQuantityId.present
            ? nicotineQuantityId.value
            : this.nicotineQuantityId,
        consumptionDurationTraditionalYears:
            consumptionDurationTraditionalYears.present
                ? consumptionDurationTraditionalYears.value
                : this.consumptionDurationTraditionalYears,
        consumptionDurationTraditionalMonths:
            consumptionDurationTraditionalMonths.present
                ? consumptionDurationTraditionalMonths.value
                : this.consumptionDurationTraditionalMonths,
        consumptionDurationVapingYears: consumptionDurationVapingYears.present
            ? consumptionDurationVapingYears.value
            : this.consumptionDurationVapingYears,
        consumptionDurationVapingMonths: consumptionDurationVapingMonths.present
            ? consumptionDurationVapingMonths.value
            : this.consumptionDurationVapingMonths,
        cessationTimeTraditionalYears: cessationTimeTraditionalYears.present
            ? cessationTimeTraditionalYears.value
            : this.cessationTimeTraditionalYears,
        cessationTimeTraditionalMonths: cessationTimeTraditionalMonths.present
            ? cessationTimeTraditionalMonths.value
            : this.cessationTimeTraditionalMonths,
        cessationTimeVapingYears: cessationTimeVapingYears.present
            ? cessationTimeVapingYears.value
            : this.cessationTimeVapingYears,
        cessationTimeVapingMonths: cessationTimeVapingMonths.present
            ? cessationTimeVapingMonths.value
            : this.cessationTimeVapingMonths,
        participationWeek: participationWeek.present
            ? participationWeek.value
            : this.participationWeek,
        cessationTimeId: cessationTimeId.present
            ? cessationTimeId.value
            : this.cessationTimeId,
        healthPerceptionId: healthPerceptionId.present
            ? healthPerceptionId.value
            : this.healthPerceptionId,
        audioNoisePath:
            audioNoisePath.present ? audioNoisePath.value : this.audioNoisePath,
        audioNoise: audioNoise.present ? audioNoise.value : this.audioNoise,
        audioNoiseSynchronized:
            audioNoiseSynchronized ?? this.audioNoiseSynchronized,
        audioVocalPath:
            audioVocalPath.present ? audioVocalPath.value : this.audioVocalPath,
        audioVocal: audioVocal.present ? audioVocal.value : this.audioVocal,
        audioVocalSynchronized:
            audioVocalSynchronized ?? this.audioVocalSynchronized,
        audioSentencePath: audioSentencePath.present
            ? audioSentencePath.value
            : this.audioSentencePath,
        audioSentence:
            audioSentence.present ? audioSentence.value : this.audioSentence,
        audioSentenceSynchronized:
            audioSentenceSynchronized ?? this.audioSentenceSynchronized,
        audioNurseryRhymePath: audioNurseryRhymePath.present
            ? audioNurseryRhymePath.value
            : this.audioNurseryRhymePath,
        audioNurseryRhyme: audioNurseryRhyme.present
            ? audioNurseryRhyme.value
            : this.audioNurseryRhyme,
        audioNurseryRhymeSynchronized:
            audioNurseryRhymeSynchronized ?? this.audioNurseryRhymeSynchronized,
        comorbidityIds:
            comorbidityIds.present ? comorbidityIds.value : this.comorbidityIds,
      );
  Patient copyWithCompanion(PatientsCompanion data) {
    return Patient(
      id: data.id.present ? data.id.value : this.id,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      collectionSite: data.collectionSite.present
          ? data.collectionSite.value
          : this.collectionSite,
      identifier:
          data.identifier.present ? data.identifier.value : this.identifier,
      otherComorbidities: data.otherComorbidities.present
          ? data.otherComorbidities.value
          : this.otherComorbidities,
      smokerId: data.smokerId.present ? data.smokerId.value : this.smokerId,
      genderId: data.genderId.present ? data.genderId.value : this.genderId,
      weight: data.weight.present ? data.weight.value : this.weight,
      height: data.height.present ? data.height.value : this.height,
      bloodPressure: data.bloodPressure.present
          ? data.bloodPressure.value
          : this.bloodPressure,
      age: data.age.present ? data.age.value : this.age,
      heartRate: data.heartRate.present ? data.heartRate.value : this.heartRate,
      respiratoryRate: data.respiratoryRate.present
          ? data.respiratoryRate.value
          : this.respiratoryRate,
      saturation:
          data.saturation.present ? data.saturation.value : this.saturation,
      studyTypeId:
          data.studyTypeId.present ? data.studyTypeId.value : this.studyTypeId,
      collectorUserId: data.collectorUserId.present
          ? data.collectorUserId.value
          : this.collectorUserId,
      collectionDate: data.collectionDate.present
          ? data.collectionDate.value
          : this.collectionDate,
      gasometryPaO2: data.gasometryPaO2.present
          ? data.gasometryPaO2.value
          : this.gasometryPaO2,
      gasometryPaCo2: data.gasometryPaCo2.present
          ? data.gasometryPaCo2.value
          : this.gasometryPaCo2,
      gasometryPH:
          data.gasometryPH.present ? data.gasometryPH.value : this.gasometryPH,
      hospitalizationDays: data.hospitalizationDays.present
          ? data.hospitalizationDays.value
          : this.hospitalizationDays,
      hospitalizationSiteId: data.hospitalizationSiteId.present
          ? data.hospitalizationSiteId.value
          : this.hospitalizationSiteId,
      respiratoryInsufficiencyTypeId:
          data.respiratoryInsufficiencyTypeId.present
              ? data.respiratoryInsufficiencyTypeId.value
              : this.respiratoryInsufficiencyTypeId,
      hemodynamicAssessment: data.hemodynamicAssessment.present
          ? data.hemodynamicAssessment.value
          : this.hemodynamicAssessment,
      medicalDiagnosis: data.medicalDiagnosis.present
          ? data.medicalDiagnosis.value
          : this.medicalDiagnosis,
      cigaretteTypeId: data.cigaretteTypeId.present
          ? data.cigaretteTypeId.value
          : this.cigaretteTypeId,
      carbonMonoxide: data.carbonMonoxide.present
          ? data.carbonMonoxide.value
          : this.carbonMonoxide,
      tobaccoLoad:
          data.tobaccoLoad.present ? data.tobaccoLoad.value : this.tobaccoLoad,
      tobaccoLoadTraditional: data.tobaccoLoadTraditional.present
          ? data.tobaccoLoadTraditional.value
          : this.tobaccoLoadTraditional,
      tobaccoLoadVaping: data.tobaccoLoadVaping.present
          ? data.tobaccoLoadVaping.value
          : this.tobaccoLoadVaping,
      consumptionDurationYears: data.consumptionDurationYears.present
          ? data.consumptionDurationYears.value
          : this.consumptionDurationYears,
      consumptionDurationMonths: data.consumptionDurationMonths.present
          ? data.consumptionDurationMonths.value
          : this.consumptionDurationMonths,
      nicotineQuantityId: data.nicotineQuantityId.present
          ? data.nicotineQuantityId.value
          : this.nicotineQuantityId,
      consumptionDurationTraditionalYears:
          data.consumptionDurationTraditionalYears.present
              ? data.consumptionDurationTraditionalYears.value
              : this.consumptionDurationTraditionalYears,
      consumptionDurationTraditionalMonths:
          data.consumptionDurationTraditionalMonths.present
              ? data.consumptionDurationTraditionalMonths.value
              : this.consumptionDurationTraditionalMonths,
      consumptionDurationVapingYears:
          data.consumptionDurationVapingYears.present
              ? data.consumptionDurationVapingYears.value
              : this.consumptionDurationVapingYears,
      consumptionDurationVapingMonths:
          data.consumptionDurationVapingMonths.present
              ? data.consumptionDurationVapingMonths.value
              : this.consumptionDurationVapingMonths,
      cessationTimeTraditionalYears: data.cessationTimeTraditionalYears.present
          ? data.cessationTimeTraditionalYears.value
          : this.cessationTimeTraditionalYears,
      cessationTimeTraditionalMonths:
          data.cessationTimeTraditionalMonths.present
              ? data.cessationTimeTraditionalMonths.value
              : this.cessationTimeTraditionalMonths,
      cessationTimeVapingYears: data.cessationTimeVapingYears.present
          ? data.cessationTimeVapingYears.value
          : this.cessationTimeVapingYears,
      cessationTimeVapingMonths: data.cessationTimeVapingMonths.present
          ? data.cessationTimeVapingMonths.value
          : this.cessationTimeVapingMonths,
      participationWeek: data.participationWeek.present
          ? data.participationWeek.value
          : this.participationWeek,
      cessationTimeId: data.cessationTimeId.present
          ? data.cessationTimeId.value
          : this.cessationTimeId,
      healthPerceptionId: data.healthPerceptionId.present
          ? data.healthPerceptionId.value
          : this.healthPerceptionId,
      audioNoisePath: data.audioNoisePath.present
          ? data.audioNoisePath.value
          : this.audioNoisePath,
      audioNoise:
          data.audioNoise.present ? data.audioNoise.value : this.audioNoise,
      audioNoiseSynchronized: data.audioNoiseSynchronized.present
          ? data.audioNoiseSynchronized.value
          : this.audioNoiseSynchronized,
      audioVocalPath: data.audioVocalPath.present
          ? data.audioVocalPath.value
          : this.audioVocalPath,
      audioVocal:
          data.audioVocal.present ? data.audioVocal.value : this.audioVocal,
      audioVocalSynchronized: data.audioVocalSynchronized.present
          ? data.audioVocalSynchronized.value
          : this.audioVocalSynchronized,
      audioSentencePath: data.audioSentencePath.present
          ? data.audioSentencePath.value
          : this.audioSentencePath,
      audioSentence: data.audioSentence.present
          ? data.audioSentence.value
          : this.audioSentence,
      audioSentenceSynchronized: data.audioSentenceSynchronized.present
          ? data.audioSentenceSynchronized.value
          : this.audioSentenceSynchronized,
      audioNurseryRhymePath: data.audioNurseryRhymePath.present
          ? data.audioNurseryRhymePath.value
          : this.audioNurseryRhymePath,
      audioNurseryRhyme: data.audioNurseryRhyme.present
          ? data.audioNurseryRhyme.value
          : this.audioNurseryRhyme,
      audioNurseryRhymeSynchronized: data.audioNurseryRhymeSynchronized.present
          ? data.audioNurseryRhymeSynchronized.value
          : this.audioNurseryRhymeSynchronized,
      comorbidityIds: data.comorbidityIds.present
          ? data.comorbidityIds.value
          : this.comorbidityIds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Patient(')
          ..write('id: $id, ')
          ..write('synchronized: $synchronized, ')
          ..write('collectionSite: $collectionSite, ')
          ..write('identifier: $identifier, ')
          ..write('otherComorbidities: $otherComorbidities, ')
          ..write('smokerId: $smokerId, ')
          ..write('genderId: $genderId, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('bloodPressure: $bloodPressure, ')
          ..write('age: $age, ')
          ..write('heartRate: $heartRate, ')
          ..write('respiratoryRate: $respiratoryRate, ')
          ..write('saturation: $saturation, ')
          ..write('studyTypeId: $studyTypeId, ')
          ..write('collectorUserId: $collectorUserId, ')
          ..write('collectionDate: $collectionDate, ')
          ..write('gasometryPaO2: $gasometryPaO2, ')
          ..write('gasometryPaCo2: $gasometryPaCo2, ')
          ..write('gasometryPH: $gasometryPH, ')
          ..write('hospitalizationDays: $hospitalizationDays, ')
          ..write('hospitalizationSiteId: $hospitalizationSiteId, ')
          ..write(
              'respiratoryInsufficiencyTypeId: $respiratoryInsufficiencyTypeId, ')
          ..write('hemodynamicAssessment: $hemodynamicAssessment, ')
          ..write('medicalDiagnosis: $medicalDiagnosis, ')
          ..write('cigaretteTypeId: $cigaretteTypeId, ')
          ..write('carbonMonoxide: $carbonMonoxide, ')
          ..write('tobaccoLoad: $tobaccoLoad, ')
          ..write('tobaccoLoadTraditional: $tobaccoLoadTraditional, ')
          ..write('tobaccoLoadVaping: $tobaccoLoadVaping, ')
          ..write('consumptionDurationYears: $consumptionDurationYears, ')
          ..write('consumptionDurationMonths: $consumptionDurationMonths, ')
          ..write('nicotineQuantityId: $nicotineQuantityId, ')
          ..write(
              'consumptionDurationTraditionalYears: $consumptionDurationTraditionalYears, ')
          ..write(
              'consumptionDurationTraditionalMonths: $consumptionDurationTraditionalMonths, ')
          ..write(
              'consumptionDurationVapingYears: $consumptionDurationVapingYears, ')
          ..write(
              'consumptionDurationVapingMonths: $consumptionDurationVapingMonths, ')
          ..write(
              'cessationTimeTraditionalYears: $cessationTimeTraditionalYears, ')
          ..write(
              'cessationTimeTraditionalMonths: $cessationTimeTraditionalMonths, ')
          ..write('cessationTimeVapingYears: $cessationTimeVapingYears, ')
          ..write('cessationTimeVapingMonths: $cessationTimeVapingMonths, ')
          ..write('participationWeek: $participationWeek, ')
          ..write('cessationTimeId: $cessationTimeId, ')
          ..write('healthPerceptionId: $healthPerceptionId, ')
          ..write('audioNoisePath: $audioNoisePath, ')
          ..write('audioNoise: $audioNoise, ')
          ..write('audioNoiseSynchronized: $audioNoiseSynchronized, ')
          ..write('audioVocalPath: $audioVocalPath, ')
          ..write('audioVocal: $audioVocal, ')
          ..write('audioVocalSynchronized: $audioVocalSynchronized, ')
          ..write('audioSentencePath: $audioSentencePath, ')
          ..write('audioSentence: $audioSentence, ')
          ..write('audioSentenceSynchronized: $audioSentenceSynchronized, ')
          ..write('audioNurseryRhymePath: $audioNurseryRhymePath, ')
          ..write('audioNurseryRhyme: $audioNurseryRhyme, ')
          ..write(
              'audioNurseryRhymeSynchronized: $audioNurseryRhymeSynchronized, ')
          ..write('comorbidityIds: $comorbidityIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        synchronized,
        collectionSite,
        identifier,
        otherComorbidities,
        smokerId,
        genderId,
        weight,
        height,
        bloodPressure,
        age,
        heartRate,
        respiratoryRate,
        saturation,
        studyTypeId,
        collectorUserId,
        collectionDate,
        gasometryPaO2,
        gasometryPaCo2,
        gasometryPH,
        hospitalizationDays,
        hospitalizationSiteId,
        respiratoryInsufficiencyTypeId,
        hemodynamicAssessment,
        medicalDiagnosis,
        cigaretteTypeId,
        carbonMonoxide,
        tobaccoLoad,
        tobaccoLoadTraditional,
        tobaccoLoadVaping,
        consumptionDurationYears,
        consumptionDurationMonths,
        nicotineQuantityId,
        consumptionDurationTraditionalYears,
        consumptionDurationTraditionalMonths,
        consumptionDurationVapingYears,
        consumptionDurationVapingMonths,
        cessationTimeTraditionalYears,
        cessationTimeTraditionalMonths,
        cessationTimeVapingYears,
        cessationTimeVapingMonths,
        participationWeek,
        cessationTimeId,
        healthPerceptionId,
        audioNoisePath,
        $driftBlobEquality.hash(audioNoise),
        audioNoiseSynchronized,
        audioVocalPath,
        $driftBlobEquality.hash(audioVocal),
        audioVocalSynchronized,
        audioSentencePath,
        $driftBlobEquality.hash(audioSentence),
        audioSentenceSynchronized,
        audioNurseryRhymePath,
        $driftBlobEquality.hash(audioNurseryRhyme),
        audioNurseryRhymeSynchronized,
        comorbidityIds
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Patient &&
          other.id == this.id &&
          other.synchronized == this.synchronized &&
          other.collectionSite == this.collectionSite &&
          other.identifier == this.identifier &&
          other.otherComorbidities == this.otherComorbidities &&
          other.smokerId == this.smokerId &&
          other.genderId == this.genderId &&
          other.weight == this.weight &&
          other.height == this.height &&
          other.bloodPressure == this.bloodPressure &&
          other.age == this.age &&
          other.heartRate == this.heartRate &&
          other.respiratoryRate == this.respiratoryRate &&
          other.saturation == this.saturation &&
          other.studyTypeId == this.studyTypeId &&
          other.collectorUserId == this.collectorUserId &&
          other.collectionDate == this.collectionDate &&
          other.gasometryPaO2 == this.gasometryPaO2 &&
          other.gasometryPaCo2 == this.gasometryPaCo2 &&
          other.gasometryPH == this.gasometryPH &&
          other.hospitalizationDays == this.hospitalizationDays &&
          other.hospitalizationSiteId == this.hospitalizationSiteId &&
          other.respiratoryInsufficiencyTypeId ==
              this.respiratoryInsufficiencyTypeId &&
          other.hemodynamicAssessment == this.hemodynamicAssessment &&
          other.medicalDiagnosis == this.medicalDiagnosis &&
          other.cigaretteTypeId == this.cigaretteTypeId &&
          other.carbonMonoxide == this.carbonMonoxide &&
          other.tobaccoLoad == this.tobaccoLoad &&
          other.tobaccoLoadTraditional == this.tobaccoLoadTraditional &&
          other.tobaccoLoadVaping == this.tobaccoLoadVaping &&
          other.consumptionDurationYears == this.consumptionDurationYears &&
          other.consumptionDurationMonths == this.consumptionDurationMonths &&
          other.nicotineQuantityId == this.nicotineQuantityId &&
          other.consumptionDurationTraditionalYears ==
              this.consumptionDurationTraditionalYears &&
          other.consumptionDurationTraditionalMonths ==
              this.consumptionDurationTraditionalMonths &&
          other.consumptionDurationVapingYears ==
              this.consumptionDurationVapingYears &&
          other.consumptionDurationVapingMonths ==
              this.consumptionDurationVapingMonths &&
          other.cessationTimeTraditionalYears ==
              this.cessationTimeTraditionalYears &&
          other.cessationTimeTraditionalMonths ==
              this.cessationTimeTraditionalMonths &&
          other.cessationTimeVapingYears == this.cessationTimeVapingYears &&
          other.cessationTimeVapingMonths == this.cessationTimeVapingMonths &&
          other.participationWeek == this.participationWeek &&
          other.cessationTimeId == this.cessationTimeId &&
          other.healthPerceptionId == this.healthPerceptionId &&
          other.audioNoisePath == this.audioNoisePath &&
          $driftBlobEquality.equals(other.audioNoise, this.audioNoise) &&
          other.audioNoiseSynchronized == this.audioNoiseSynchronized &&
          other.audioVocalPath == this.audioVocalPath &&
          $driftBlobEquality.equals(other.audioVocal, this.audioVocal) &&
          other.audioVocalSynchronized == this.audioVocalSynchronized &&
          other.audioSentencePath == this.audioSentencePath &&
          $driftBlobEquality.equals(other.audioSentence, this.audioSentence) &&
          other.audioSentenceSynchronized == this.audioSentenceSynchronized &&
          other.audioNurseryRhymePath == this.audioNurseryRhymePath &&
          $driftBlobEquality.equals(
              other.audioNurseryRhyme, this.audioNurseryRhyme) &&
          other.audioNurseryRhymeSynchronized ==
              this.audioNurseryRhymeSynchronized &&
          other.comorbidityIds == this.comorbidityIds);
}

class PatientsCompanion extends UpdateCompanion<Patient> {
  final Value<int> id;
  final Value<bool> synchronized;
  final Value<String?> collectionSite;
  final Value<String?> identifier;
  final Value<String?> otherComorbidities;
  final Value<int?> smokerId;
  final Value<int?> genderId;
  final Value<double?> weight;
  final Value<double?> height;
  final Value<String?> bloodPressure;
  final Value<int?> age;
  final Value<int?> heartRate;
  final Value<int?> respiratoryRate;
  final Value<double?> saturation;
  final Value<int?> studyTypeId;
  final Value<int?> collectorUserId;
  final Value<DateTime?> collectionDate;
  final Value<double?> gasometryPaO2;
  final Value<double?> gasometryPaCo2;
  final Value<double?> gasometryPH;
  final Value<int?> hospitalizationDays;
  final Value<int?> hospitalizationSiteId;
  final Value<int?> respiratoryInsufficiencyTypeId;
  final Value<String?> hemodynamicAssessment;
  final Value<String?> medicalDiagnosis;
  final Value<int?> cigaretteTypeId;
  final Value<double?> carbonMonoxide;
  final Value<double?> tobaccoLoad;
  final Value<double?> tobaccoLoadTraditional;
  final Value<double?> tobaccoLoadVaping;
  final Value<int?> consumptionDurationYears;
  final Value<int?> consumptionDurationMonths;
  final Value<int?> nicotineQuantityId;
  final Value<int?> consumptionDurationTraditionalYears;
  final Value<int?> consumptionDurationTraditionalMonths;
  final Value<int?> consumptionDurationVapingYears;
  final Value<int?> consumptionDurationVapingMonths;
  final Value<int?> cessationTimeTraditionalYears;
  final Value<int?> cessationTimeTraditionalMonths;
  final Value<int?> cessationTimeVapingYears;
  final Value<int?> cessationTimeVapingMonths;
  final Value<int?> participationWeek;
  final Value<int?> cessationTimeId;
  final Value<int?> healthPerceptionId;
  final Value<String?> audioNoisePath;
  final Value<Uint8List?> audioNoise;
  final Value<bool> audioNoiseSynchronized;
  final Value<String?> audioVocalPath;
  final Value<Uint8List?> audioVocal;
  final Value<bool> audioVocalSynchronized;
  final Value<String?> audioSentencePath;
  final Value<Uint8List?> audioSentence;
  final Value<bool> audioSentenceSynchronized;
  final Value<String?> audioNurseryRhymePath;
  final Value<Uint8List?> audioNurseryRhyme;
  final Value<bool> audioNurseryRhymeSynchronized;
  final Value<String?> comorbidityIds;
  const PatientsCompanion({
    this.id = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.collectionSite = const Value.absent(),
    this.identifier = const Value.absent(),
    this.otherComorbidities = const Value.absent(),
    this.smokerId = const Value.absent(),
    this.genderId = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.bloodPressure = const Value.absent(),
    this.age = const Value.absent(),
    this.heartRate = const Value.absent(),
    this.respiratoryRate = const Value.absent(),
    this.saturation = const Value.absent(),
    this.studyTypeId = const Value.absent(),
    this.collectorUserId = const Value.absent(),
    this.collectionDate = const Value.absent(),
    this.gasometryPaO2 = const Value.absent(),
    this.gasometryPaCo2 = const Value.absent(),
    this.gasometryPH = const Value.absent(),
    this.hospitalizationDays = const Value.absent(),
    this.hospitalizationSiteId = const Value.absent(),
    this.respiratoryInsufficiencyTypeId = const Value.absent(),
    this.hemodynamicAssessment = const Value.absent(),
    this.medicalDiagnosis = const Value.absent(),
    this.cigaretteTypeId = const Value.absent(),
    this.carbonMonoxide = const Value.absent(),
    this.tobaccoLoad = const Value.absent(),
    this.tobaccoLoadTraditional = const Value.absent(),
    this.tobaccoLoadVaping = const Value.absent(),
    this.consumptionDurationYears = const Value.absent(),
    this.consumptionDurationMonths = const Value.absent(),
    this.nicotineQuantityId = const Value.absent(),
    this.consumptionDurationTraditionalYears = const Value.absent(),
    this.consumptionDurationTraditionalMonths = const Value.absent(),
    this.consumptionDurationVapingYears = const Value.absent(),
    this.consumptionDurationVapingMonths = const Value.absent(),
    this.cessationTimeTraditionalYears = const Value.absent(),
    this.cessationTimeTraditionalMonths = const Value.absent(),
    this.cessationTimeVapingYears = const Value.absent(),
    this.cessationTimeVapingMonths = const Value.absent(),
    this.participationWeek = const Value.absent(),
    this.cessationTimeId = const Value.absent(),
    this.healthPerceptionId = const Value.absent(),
    this.audioNoisePath = const Value.absent(),
    this.audioNoise = const Value.absent(),
    this.audioNoiseSynchronized = const Value.absent(),
    this.audioVocalPath = const Value.absent(),
    this.audioVocal = const Value.absent(),
    this.audioVocalSynchronized = const Value.absent(),
    this.audioSentencePath = const Value.absent(),
    this.audioSentence = const Value.absent(),
    this.audioSentenceSynchronized = const Value.absent(),
    this.audioNurseryRhymePath = const Value.absent(),
    this.audioNurseryRhyme = const Value.absent(),
    this.audioNurseryRhymeSynchronized = const Value.absent(),
    this.comorbidityIds = const Value.absent(),
  });
  PatientsCompanion.insert({
    this.id = const Value.absent(),
    required bool synchronized,
    this.collectionSite = const Value.absent(),
    this.identifier = const Value.absent(),
    this.otherComorbidities = const Value.absent(),
    this.smokerId = const Value.absent(),
    this.genderId = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.bloodPressure = const Value.absent(),
    this.age = const Value.absent(),
    this.heartRate = const Value.absent(),
    this.respiratoryRate = const Value.absent(),
    this.saturation = const Value.absent(),
    this.studyTypeId = const Value.absent(),
    this.collectorUserId = const Value.absent(),
    this.collectionDate = const Value.absent(),
    this.gasometryPaO2 = const Value.absent(),
    this.gasometryPaCo2 = const Value.absent(),
    this.gasometryPH = const Value.absent(),
    this.hospitalizationDays = const Value.absent(),
    this.hospitalizationSiteId = const Value.absent(),
    this.respiratoryInsufficiencyTypeId = const Value.absent(),
    this.hemodynamicAssessment = const Value.absent(),
    this.medicalDiagnosis = const Value.absent(),
    this.cigaretteTypeId = const Value.absent(),
    this.carbonMonoxide = const Value.absent(),
    this.tobaccoLoad = const Value.absent(),
    this.tobaccoLoadTraditional = const Value.absent(),
    this.tobaccoLoadVaping = const Value.absent(),
    this.consumptionDurationYears = const Value.absent(),
    this.consumptionDurationMonths = const Value.absent(),
    this.nicotineQuantityId = const Value.absent(),
    this.consumptionDurationTraditionalYears = const Value.absent(),
    this.consumptionDurationTraditionalMonths = const Value.absent(),
    this.consumptionDurationVapingYears = const Value.absent(),
    this.consumptionDurationVapingMonths = const Value.absent(),
    this.cessationTimeTraditionalYears = const Value.absent(),
    this.cessationTimeTraditionalMonths = const Value.absent(),
    this.cessationTimeVapingYears = const Value.absent(),
    this.cessationTimeVapingMonths = const Value.absent(),
    this.participationWeek = const Value.absent(),
    this.cessationTimeId = const Value.absent(),
    this.healthPerceptionId = const Value.absent(),
    this.audioNoisePath = const Value.absent(),
    this.audioNoise = const Value.absent(),
    required bool audioNoiseSynchronized,
    this.audioVocalPath = const Value.absent(),
    this.audioVocal = const Value.absent(),
    required bool audioVocalSynchronized,
    this.audioSentencePath = const Value.absent(),
    this.audioSentence = const Value.absent(),
    required bool audioSentenceSynchronized,
    this.audioNurseryRhymePath = const Value.absent(),
    this.audioNurseryRhyme = const Value.absent(),
    required bool audioNurseryRhymeSynchronized,
    this.comorbidityIds = const Value.absent(),
  })  : synchronized = Value(synchronized),
        audioNoiseSynchronized = Value(audioNoiseSynchronized),
        audioVocalSynchronized = Value(audioVocalSynchronized),
        audioSentenceSynchronized = Value(audioSentenceSynchronized),
        audioNurseryRhymeSynchronized = Value(audioNurseryRhymeSynchronized);
  static Insertable<Patient> custom({
    Expression<int>? id,
    Expression<bool>? synchronized,
    Expression<String>? collectionSite,
    Expression<String>? identifier,
    Expression<String>? otherComorbidities,
    Expression<int>? smokerId,
    Expression<int>? genderId,
    Expression<double>? weight,
    Expression<double>? height,
    Expression<String>? bloodPressure,
    Expression<int>? age,
    Expression<int>? heartRate,
    Expression<int>? respiratoryRate,
    Expression<double>? saturation,
    Expression<int>? studyTypeId,
    Expression<int>? collectorUserId,
    Expression<DateTime>? collectionDate,
    Expression<double>? gasometryPaO2,
    Expression<double>? gasometryPaCo2,
    Expression<double>? gasometryPH,
    Expression<int>? hospitalizationDays,
    Expression<int>? hospitalizationSiteId,
    Expression<int>? respiratoryInsufficiencyTypeId,
    Expression<String>? hemodynamicAssessment,
    Expression<String>? medicalDiagnosis,
    Expression<int>? cigaretteTypeId,
    Expression<double>? carbonMonoxide,
    Expression<double>? tobaccoLoad,
    Expression<double>? tobaccoLoadTraditional,
    Expression<double>? tobaccoLoadVaping,
    Expression<int>? consumptionDurationYears,
    Expression<int>? consumptionDurationMonths,
    Expression<int>? nicotineQuantityId,
    Expression<int>? consumptionDurationTraditionalYears,
    Expression<int>? consumptionDurationTraditionalMonths,
    Expression<int>? consumptionDurationVapingYears,
    Expression<int>? consumptionDurationVapingMonths,
    Expression<int>? cessationTimeTraditionalYears,
    Expression<int>? cessationTimeTraditionalMonths,
    Expression<int>? cessationTimeVapingYears,
    Expression<int>? cessationTimeVapingMonths,
    Expression<int>? participationWeek,
    Expression<int>? cessationTimeId,
    Expression<int>? healthPerceptionId,
    Expression<String>? audioNoisePath,
    Expression<Uint8List>? audioNoise,
    Expression<bool>? audioNoiseSynchronized,
    Expression<String>? audioVocalPath,
    Expression<Uint8List>? audioVocal,
    Expression<bool>? audioVocalSynchronized,
    Expression<String>? audioSentencePath,
    Expression<Uint8List>? audioSentence,
    Expression<bool>? audioSentenceSynchronized,
    Expression<String>? audioNurseryRhymePath,
    Expression<Uint8List>? audioNurseryRhyme,
    Expression<bool>? audioNurseryRhymeSynchronized,
    Expression<String>? comorbidityIds,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (synchronized != null) 'synchronized': synchronized,
      if (collectionSite != null) 'collection_site': collectionSite,
      if (identifier != null) 'identifier': identifier,
      if (otherComorbidities != null) 'other_comorbidities': otherComorbidities,
      if (smokerId != null) 'smoker_id': smokerId,
      if (genderId != null) 'gender_id': genderId,
      if (weight != null) 'weight': weight,
      if (height != null) 'height': height,
      if (bloodPressure != null) 'blood_pressure': bloodPressure,
      if (age != null) 'age': age,
      if (heartRate != null) 'heart_rate': heartRate,
      if (respiratoryRate != null) 'respiratory_rate': respiratoryRate,
      if (saturation != null) 'saturation': saturation,
      if (studyTypeId != null) 'study_type_id': studyTypeId,
      if (collectorUserId != null) 'collector_user_id': collectorUserId,
      if (collectionDate != null) 'collection_date': collectionDate,
      if (gasometryPaO2 != null) 'gasometry_pa_o2': gasometryPaO2,
      if (gasometryPaCo2 != null) 'gasometry_pa_co2': gasometryPaCo2,
      if (gasometryPH != null) 'gasometry_p_h': gasometryPH,
      if (hospitalizationDays != null)
        'hospitalization_days': hospitalizationDays,
      if (hospitalizationSiteId != null)
        'hospitalization_site_id': hospitalizationSiteId,
      if (respiratoryInsufficiencyTypeId != null)
        'respiratory_insufficiency_type_id': respiratoryInsufficiencyTypeId,
      if (hemodynamicAssessment != null)
        'hemodynamic_assessment': hemodynamicAssessment,
      if (medicalDiagnosis != null) 'medical_diagnosis': medicalDiagnosis,
      if (cigaretteTypeId != null) 'cigarette_type_id': cigaretteTypeId,
      if (carbonMonoxide != null) 'carbon_monoxide': carbonMonoxide,
      if (tobaccoLoad != null) 'tobacco_load': tobaccoLoad,
      if (tobaccoLoadTraditional != null)
        'tobacco_load_traditional': tobaccoLoadTraditional,
      if (tobaccoLoadVaping != null) 'tobacco_load_vaping': tobaccoLoadVaping,
      if (consumptionDurationYears != null)
        'consumption_duration_years': consumptionDurationYears,
      if (consumptionDurationMonths != null)
        'consumption_duration_months': consumptionDurationMonths,
      if (nicotineQuantityId != null)
        'nicotine_quantity_id': nicotineQuantityId,
      if (consumptionDurationTraditionalYears != null)
        'consumption_duration_traditional_years':
            consumptionDurationTraditionalYears,
      if (consumptionDurationTraditionalMonths != null)
        'consumption_duration_traditional_months':
            consumptionDurationTraditionalMonths,
      if (consumptionDurationVapingYears != null)
        'consumption_duration_vaping_years': consumptionDurationVapingYears,
      if (consumptionDurationVapingMonths != null)
        'consumption_duration_vaping_months': consumptionDurationVapingMonths,
      if (cessationTimeTraditionalYears != null)
        'cessation_time_traditional_years': cessationTimeTraditionalYears,
      if (cessationTimeTraditionalMonths != null)
        'cessation_time_traditional_months': cessationTimeTraditionalMonths,
      if (cessationTimeVapingYears != null)
        'cessation_time_vaping_years': cessationTimeVapingYears,
      if (cessationTimeVapingMonths != null)
        'cessation_time_vaping_months': cessationTimeVapingMonths,
      if (participationWeek != null) 'participation_week': participationWeek,
      if (cessationTimeId != null) 'cessation_time_id': cessationTimeId,
      if (healthPerceptionId != null)
        'health_perception_id': healthPerceptionId,
      if (audioNoisePath != null) 'audio_noise_path': audioNoisePath,
      if (audioNoise != null) 'audio_noise': audioNoise,
      if (audioNoiseSynchronized != null)
        'audio_noise_synchronized': audioNoiseSynchronized,
      if (audioVocalPath != null) 'audio_vocal_path': audioVocalPath,
      if (audioVocal != null) 'audio_vocal': audioVocal,
      if (audioVocalSynchronized != null)
        'audio_vocal_synchronized': audioVocalSynchronized,
      if (audioSentencePath != null) 'audio_sentence_path': audioSentencePath,
      if (audioSentence != null) 'audio_sentence': audioSentence,
      if (audioSentenceSynchronized != null)
        'audio_sentence_synchronized': audioSentenceSynchronized,
      if (audioNurseryRhymePath != null)
        'audio_nursery_rhyme_path': audioNurseryRhymePath,
      if (audioNurseryRhyme != null) 'audio_nursery_rhyme': audioNurseryRhyme,
      if (audioNurseryRhymeSynchronized != null)
        'audio_nursery_rhyme_synchronized': audioNurseryRhymeSynchronized,
      if (comorbidityIds != null) 'comorbidity_ids': comorbidityIds,
    });
  }

  PatientsCompanion copyWith(
      {Value<int>? id,
      Value<bool>? synchronized,
      Value<String?>? collectionSite,
      Value<String?>? identifier,
      Value<String?>? otherComorbidities,
      Value<int?>? smokerId,
      Value<int?>? genderId,
      Value<double?>? weight,
      Value<double?>? height,
      Value<String?>? bloodPressure,
      Value<int?>? age,
      Value<int?>? heartRate,
      Value<int?>? respiratoryRate,
      Value<double?>? saturation,
      Value<int?>? studyTypeId,
      Value<int?>? collectorUserId,
      Value<DateTime?>? collectionDate,
      Value<double?>? gasometryPaO2,
      Value<double?>? gasometryPaCo2,
      Value<double?>? gasometryPH,
      Value<int?>? hospitalizationDays,
      Value<int?>? hospitalizationSiteId,
      Value<int?>? respiratoryInsufficiencyTypeId,
      Value<String?>? hemodynamicAssessment,
      Value<String?>? medicalDiagnosis,
      Value<int?>? cigaretteTypeId,
      Value<double?>? carbonMonoxide,
      Value<double?>? tobaccoLoad,
      Value<double?>? tobaccoLoadTraditional,
      Value<double?>? tobaccoLoadVaping,
      Value<int?>? consumptionDurationYears,
      Value<int?>? consumptionDurationMonths,
      Value<int?>? nicotineQuantityId,
      Value<int?>? consumptionDurationTraditionalYears,
      Value<int?>? consumptionDurationTraditionalMonths,
      Value<int?>? consumptionDurationVapingYears,
      Value<int?>? consumptionDurationVapingMonths,
      Value<int?>? cessationTimeTraditionalYears,
      Value<int?>? cessationTimeTraditionalMonths,
      Value<int?>? cessationTimeVapingYears,
      Value<int?>? cessationTimeVapingMonths,
      Value<int?>? participationWeek,
      Value<int?>? cessationTimeId,
      Value<int?>? healthPerceptionId,
      Value<String?>? audioNoisePath,
      Value<Uint8List?>? audioNoise,
      Value<bool>? audioNoiseSynchronized,
      Value<String?>? audioVocalPath,
      Value<Uint8List?>? audioVocal,
      Value<bool>? audioVocalSynchronized,
      Value<String?>? audioSentencePath,
      Value<Uint8List?>? audioSentence,
      Value<bool>? audioSentenceSynchronized,
      Value<String?>? audioNurseryRhymePath,
      Value<Uint8List?>? audioNurseryRhyme,
      Value<bool>? audioNurseryRhymeSynchronized,
      Value<String?>? comorbidityIds}) {
    return PatientsCompanion(
      id: id ?? this.id,
      synchronized: synchronized ?? this.synchronized,
      collectionSite: collectionSite ?? this.collectionSite,
      identifier: identifier ?? this.identifier,
      otherComorbidities: otherComorbidities ?? this.otherComorbidities,
      smokerId: smokerId ?? this.smokerId,
      genderId: genderId ?? this.genderId,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      age: age ?? this.age,
      heartRate: heartRate ?? this.heartRate,
      respiratoryRate: respiratoryRate ?? this.respiratoryRate,
      saturation: saturation ?? this.saturation,
      studyTypeId: studyTypeId ?? this.studyTypeId,
      collectorUserId: collectorUserId ?? this.collectorUserId,
      collectionDate: collectionDate ?? this.collectionDate,
      gasometryPaO2: gasometryPaO2 ?? this.gasometryPaO2,
      gasometryPaCo2: gasometryPaCo2 ?? this.gasometryPaCo2,
      gasometryPH: gasometryPH ?? this.gasometryPH,
      hospitalizationDays: hospitalizationDays ?? this.hospitalizationDays,
      hospitalizationSiteId:
          hospitalizationSiteId ?? this.hospitalizationSiteId,
      respiratoryInsufficiencyTypeId:
          respiratoryInsufficiencyTypeId ?? this.respiratoryInsufficiencyTypeId,
      hemodynamicAssessment:
          hemodynamicAssessment ?? this.hemodynamicAssessment,
      medicalDiagnosis: medicalDiagnosis ?? this.medicalDiagnosis,
      cigaretteTypeId: cigaretteTypeId ?? this.cigaretteTypeId,
      carbonMonoxide: carbonMonoxide ?? this.carbonMonoxide,
      tobaccoLoad: tobaccoLoad ?? this.tobaccoLoad,
      tobaccoLoadTraditional:
          tobaccoLoadTraditional ?? this.tobaccoLoadTraditional,
      tobaccoLoadVaping: tobaccoLoadVaping ?? this.tobaccoLoadVaping,
      consumptionDurationYears:
          consumptionDurationYears ?? this.consumptionDurationYears,
      consumptionDurationMonths:
          consumptionDurationMonths ?? this.consumptionDurationMonths,
      nicotineQuantityId: nicotineQuantityId ?? this.nicotineQuantityId,
      consumptionDurationTraditionalYears:
          consumptionDurationTraditionalYears ??
              this.consumptionDurationTraditionalYears,
      consumptionDurationTraditionalMonths:
          consumptionDurationTraditionalMonths ??
              this.consumptionDurationTraditionalMonths,
      consumptionDurationVapingYears:
          consumptionDurationVapingYears ?? this.consumptionDurationVapingYears,
      consumptionDurationVapingMonths: consumptionDurationVapingMonths ??
          this.consumptionDurationVapingMonths,
      cessationTimeTraditionalYears:
          cessationTimeTraditionalYears ?? this.cessationTimeTraditionalYears,
      cessationTimeTraditionalMonths:
          cessationTimeTraditionalMonths ?? this.cessationTimeTraditionalMonths,
      cessationTimeVapingYears:
          cessationTimeVapingYears ?? this.cessationTimeVapingYears,
      cessationTimeVapingMonths:
          cessationTimeVapingMonths ?? this.cessationTimeVapingMonths,
      participationWeek: participationWeek ?? this.participationWeek,
      cessationTimeId: cessationTimeId ?? this.cessationTimeId,
      healthPerceptionId: healthPerceptionId ?? this.healthPerceptionId,
      audioNoisePath: audioNoisePath ?? this.audioNoisePath,
      audioNoise: audioNoise ?? this.audioNoise,
      audioNoiseSynchronized:
          audioNoiseSynchronized ?? this.audioNoiseSynchronized,
      audioVocalPath: audioVocalPath ?? this.audioVocalPath,
      audioVocal: audioVocal ?? this.audioVocal,
      audioVocalSynchronized:
          audioVocalSynchronized ?? this.audioVocalSynchronized,
      audioSentencePath: audioSentencePath ?? this.audioSentencePath,
      audioSentence: audioSentence ?? this.audioSentence,
      audioSentenceSynchronized:
          audioSentenceSynchronized ?? this.audioSentenceSynchronized,
      audioNurseryRhymePath:
          audioNurseryRhymePath ?? this.audioNurseryRhymePath,
      audioNurseryRhyme: audioNurseryRhyme ?? this.audioNurseryRhyme,
      audioNurseryRhymeSynchronized:
          audioNurseryRhymeSynchronized ?? this.audioNurseryRhymeSynchronized,
      comorbidityIds: comorbidityIds ?? this.comorbidityIds,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<bool>(synchronized.value);
    }
    if (collectionSite.present) {
      map['collection_site'] = Variable<String>(collectionSite.value);
    }
    if (identifier.present) {
      map['identifier'] = Variable<String>(identifier.value);
    }
    if (otherComorbidities.present) {
      map['other_comorbidities'] = Variable<String>(otherComorbidities.value);
    }
    if (smokerId.present) {
      map['smoker_id'] = Variable<int>(smokerId.value);
    }
    if (genderId.present) {
      map['gender_id'] = Variable<int>(genderId.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (bloodPressure.present) {
      map['blood_pressure'] = Variable<String>(bloodPressure.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (heartRate.present) {
      map['heart_rate'] = Variable<int>(heartRate.value);
    }
    if (respiratoryRate.present) {
      map['respiratory_rate'] = Variable<int>(respiratoryRate.value);
    }
    if (saturation.present) {
      map['saturation'] = Variable<double>(saturation.value);
    }
    if (studyTypeId.present) {
      map['study_type_id'] = Variable<int>(studyTypeId.value);
    }
    if (collectorUserId.present) {
      map['collector_user_id'] = Variable<int>(collectorUserId.value);
    }
    if (collectionDate.present) {
      map['collection_date'] = Variable<DateTime>(collectionDate.value);
    }
    if (gasometryPaO2.present) {
      map['gasometry_pa_o2'] = Variable<double>(gasometryPaO2.value);
    }
    if (gasometryPaCo2.present) {
      map['gasometry_pa_co2'] = Variable<double>(gasometryPaCo2.value);
    }
    if (gasometryPH.present) {
      map['gasometry_p_h'] = Variable<double>(gasometryPH.value);
    }
    if (hospitalizationDays.present) {
      map['hospitalization_days'] = Variable<int>(hospitalizationDays.value);
    }
    if (hospitalizationSiteId.present) {
      map['hospitalization_site_id'] =
          Variable<int>(hospitalizationSiteId.value);
    }
    if (respiratoryInsufficiencyTypeId.present) {
      map['respiratory_insufficiency_type_id'] =
          Variable<int>(respiratoryInsufficiencyTypeId.value);
    }
    if (hemodynamicAssessment.present) {
      map['hemodynamic_assessment'] =
          Variable<String>(hemodynamicAssessment.value);
    }
    if (medicalDiagnosis.present) {
      map['medical_diagnosis'] = Variable<String>(medicalDiagnosis.value);
    }
    if (cigaretteTypeId.present) {
      map['cigarette_type_id'] = Variable<int>(cigaretteTypeId.value);
    }
    if (carbonMonoxide.present) {
      map['carbon_monoxide'] = Variable<double>(carbonMonoxide.value);
    }
    if (tobaccoLoad.present) {
      map['tobacco_load'] = Variable<double>(tobaccoLoad.value);
    }
    if (tobaccoLoadTraditional.present) {
      map['tobacco_load_traditional'] =
          Variable<double>(tobaccoLoadTraditional.value);
    }
    if (tobaccoLoadVaping.present) {
      map['tobacco_load_vaping'] = Variable<double>(tobaccoLoadVaping.value);
    }
    if (consumptionDurationYears.present) {
      map['consumption_duration_years'] =
          Variable<int>(consumptionDurationYears.value);
    }
    if (consumptionDurationMonths.present) {
      map['consumption_duration_months'] =
          Variable<int>(consumptionDurationMonths.value);
    }
    if (nicotineQuantityId.present) {
      map['nicotine_quantity_id'] = Variable<int>(nicotineQuantityId.value);
    }
    if (consumptionDurationTraditionalYears.present) {
      map['consumption_duration_traditional_years'] =
          Variable<int>(consumptionDurationTraditionalYears.value);
    }
    if (consumptionDurationTraditionalMonths.present) {
      map['consumption_duration_traditional_months'] =
          Variable<int>(consumptionDurationTraditionalMonths.value);
    }
    if (consumptionDurationVapingYears.present) {
      map['consumption_duration_vaping_years'] =
          Variable<int>(consumptionDurationVapingYears.value);
    }
    if (consumptionDurationVapingMonths.present) {
      map['consumption_duration_vaping_months'] =
          Variable<int>(consumptionDurationVapingMonths.value);
    }
    if (cessationTimeTraditionalYears.present) {
      map['cessation_time_traditional_years'] =
          Variable<int>(cessationTimeTraditionalYears.value);
    }
    if (cessationTimeTraditionalMonths.present) {
      map['cessation_time_traditional_months'] =
          Variable<int>(cessationTimeTraditionalMonths.value);
    }
    if (cessationTimeVapingYears.present) {
      map['cessation_time_vaping_years'] =
          Variable<int>(cessationTimeVapingYears.value);
    }
    if (cessationTimeVapingMonths.present) {
      map['cessation_time_vaping_months'] =
          Variable<int>(cessationTimeVapingMonths.value);
    }
    if (participationWeek.present) {
      map['participation_week'] = Variable<int>(participationWeek.value);
    }
    if (cessationTimeId.present) {
      map['cessation_time_id'] = Variable<int>(cessationTimeId.value);
    }
    if (healthPerceptionId.present) {
      map['health_perception_id'] = Variable<int>(healthPerceptionId.value);
    }
    if (audioNoisePath.present) {
      map['audio_noise_path'] = Variable<String>(audioNoisePath.value);
    }
    if (audioNoise.present) {
      map['audio_noise'] = Variable<Uint8List>(audioNoise.value);
    }
    if (audioNoiseSynchronized.present) {
      map['audio_noise_synchronized'] =
          Variable<bool>(audioNoiseSynchronized.value);
    }
    if (audioVocalPath.present) {
      map['audio_vocal_path'] = Variable<String>(audioVocalPath.value);
    }
    if (audioVocal.present) {
      map['audio_vocal'] = Variable<Uint8List>(audioVocal.value);
    }
    if (audioVocalSynchronized.present) {
      map['audio_vocal_synchronized'] =
          Variable<bool>(audioVocalSynchronized.value);
    }
    if (audioSentencePath.present) {
      map['audio_sentence_path'] = Variable<String>(audioSentencePath.value);
    }
    if (audioSentence.present) {
      map['audio_sentence'] = Variable<Uint8List>(audioSentence.value);
    }
    if (audioSentenceSynchronized.present) {
      map['audio_sentence_synchronized'] =
          Variable<bool>(audioSentenceSynchronized.value);
    }
    if (audioNurseryRhymePath.present) {
      map['audio_nursery_rhyme_path'] =
          Variable<String>(audioNurseryRhymePath.value);
    }
    if (audioNurseryRhyme.present) {
      map['audio_nursery_rhyme'] = Variable<Uint8List>(audioNurseryRhyme.value);
    }
    if (audioNurseryRhymeSynchronized.present) {
      map['audio_nursery_rhyme_synchronized'] =
          Variable<bool>(audioNurseryRhymeSynchronized.value);
    }
    if (comorbidityIds.present) {
      map['comorbidity_ids'] = Variable<String>(comorbidityIds.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsCompanion(')
          ..write('id: $id, ')
          ..write('synchronized: $synchronized, ')
          ..write('collectionSite: $collectionSite, ')
          ..write('identifier: $identifier, ')
          ..write('otherComorbidities: $otherComorbidities, ')
          ..write('smokerId: $smokerId, ')
          ..write('genderId: $genderId, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('bloodPressure: $bloodPressure, ')
          ..write('age: $age, ')
          ..write('heartRate: $heartRate, ')
          ..write('respiratoryRate: $respiratoryRate, ')
          ..write('saturation: $saturation, ')
          ..write('studyTypeId: $studyTypeId, ')
          ..write('collectorUserId: $collectorUserId, ')
          ..write('collectionDate: $collectionDate, ')
          ..write('gasometryPaO2: $gasometryPaO2, ')
          ..write('gasometryPaCo2: $gasometryPaCo2, ')
          ..write('gasometryPH: $gasometryPH, ')
          ..write('hospitalizationDays: $hospitalizationDays, ')
          ..write('hospitalizationSiteId: $hospitalizationSiteId, ')
          ..write(
              'respiratoryInsufficiencyTypeId: $respiratoryInsufficiencyTypeId, ')
          ..write('hemodynamicAssessment: $hemodynamicAssessment, ')
          ..write('medicalDiagnosis: $medicalDiagnosis, ')
          ..write('cigaretteTypeId: $cigaretteTypeId, ')
          ..write('carbonMonoxide: $carbonMonoxide, ')
          ..write('tobaccoLoad: $tobaccoLoad, ')
          ..write('tobaccoLoadTraditional: $tobaccoLoadTraditional, ')
          ..write('tobaccoLoadVaping: $tobaccoLoadVaping, ')
          ..write('consumptionDurationYears: $consumptionDurationYears, ')
          ..write('consumptionDurationMonths: $consumptionDurationMonths, ')
          ..write('nicotineQuantityId: $nicotineQuantityId, ')
          ..write(
              'consumptionDurationTraditionalYears: $consumptionDurationTraditionalYears, ')
          ..write(
              'consumptionDurationTraditionalMonths: $consumptionDurationTraditionalMonths, ')
          ..write(
              'consumptionDurationVapingYears: $consumptionDurationVapingYears, ')
          ..write(
              'consumptionDurationVapingMonths: $consumptionDurationVapingMonths, ')
          ..write(
              'cessationTimeTraditionalYears: $cessationTimeTraditionalYears, ')
          ..write(
              'cessationTimeTraditionalMonths: $cessationTimeTraditionalMonths, ')
          ..write('cessationTimeVapingYears: $cessationTimeVapingYears, ')
          ..write('cessationTimeVapingMonths: $cessationTimeVapingMonths, ')
          ..write('participationWeek: $participationWeek, ')
          ..write('cessationTimeId: $cessationTimeId, ')
          ..write('healthPerceptionId: $healthPerceptionId, ')
          ..write('audioNoisePath: $audioNoisePath, ')
          ..write('audioNoise: $audioNoise, ')
          ..write('audioNoiseSynchronized: $audioNoiseSynchronized, ')
          ..write('audioVocalPath: $audioVocalPath, ')
          ..write('audioVocal: $audioVocal, ')
          ..write('audioVocalSynchronized: $audioVocalSynchronized, ')
          ..write('audioSentencePath: $audioSentencePath, ')
          ..write('audioSentence: $audioSentence, ')
          ..write('audioSentenceSynchronized: $audioSentenceSynchronized, ')
          ..write('audioNurseryRhymePath: $audioNurseryRhymePath, ')
          ..write('audioNurseryRhyme: $audioNurseryRhyme, ')
          ..write(
              'audioNurseryRhymeSynchronized: $audioNurseryRhymeSynchronized, ')
          ..write('comorbidityIds: $comorbidityIds')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $LoginResponsesTable loginResponses = $LoginResponsesTable(this);
  late final $RolesTable roles = $RolesTable(this);
  late final $GendersTable genders = $GendersTable(this);
  late final $ComorbiditiesTable comorbidities = $ComorbiditiesTable(this);
  late final $SmokersTable smokers = $SmokersTable(this);
  late final $StudyLinesTable studyLines = $StudyLinesTable(this);
  late final $SmokingCessationTimesTable smokingCessationTimes =
      $SmokingCessationTimesTable(this);
  late final $SmokingTypesTable smokingTypes = $SmokingTypesTable(this);
  late final $HealthPerceptionsTable healthPerceptions =
      $HealthPerceptionsTable(this);
  late final $HospitalizationLocationsTable hospitalizationLocations =
      $HospitalizationLocationsTable(this);
  late final $NicotineAmountsTable nicotineAmounts =
      $NicotineAmountsTable(this);
  late final $RespiratoryFailuresTable respiratoryFailures =
      $RespiratoryFailuresTable(this);
  late final $PatientsTable patients = $PatientsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        loginResponses,
        roles,
        genders,
        comorbidities,
        smokers,
        studyLines,
        smokingCessationTimes,
        smokingTypes,
        healthPerceptions,
        hospitalizationLocations,
        nicotineAmounts,
        respiratoryFailures,
        patients
      ];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String email,
  required String fullName,
  required bool active,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> email,
  Value<String> fullName,
  Value<bool> active,
});

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<bool> active = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            email: email,
            fullName: fullName,
            active: active,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String email,
            required String fullName,
            required bool active,
          }) =>
              UsersCompanion.insert(
            id: id,
            email: email,
            fullName: fullName,
            active: active,
          ),
        ));
}

class $$UsersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get fullName => $state.composableBuilder(
      column: $state.table.fullName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get active => $state.composableBuilder(
      column: $state.table.active,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter loginResponsesRefs(
      ComposableFilter Function($$LoginResponsesTableFilterComposer f) f) {
    final $$LoginResponsesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.loginResponses,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) =>
            $$LoginResponsesTableFilterComposer(ComposerState($state.db,
                $state.db.loginResponses, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter rolesRefs(
      ComposableFilter Function($$RolesTableFilterComposer f) f) {
    final $$RolesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.roles,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) => $$RolesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.roles, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get fullName => $state.composableBuilder(
      column: $state.table.fullName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get active => $state.composableBuilder(
      column: $state.table.active,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$LoginResponsesTableCreateCompanionBuilder = LoginResponsesCompanion
    Function({
  Value<int> id,
  required String token,
  required int userId,
});
typedef $$LoginResponsesTableUpdateCompanionBuilder = LoginResponsesCompanion
    Function({
  Value<int> id,
  Value<String> token,
  Value<int> userId,
});

class $$LoginResponsesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LoginResponsesTable,
    LoginResponse,
    $$LoginResponsesTableFilterComposer,
    $$LoginResponsesTableOrderingComposer,
    $$LoginResponsesTableCreateCompanionBuilder,
    $$LoginResponsesTableUpdateCompanionBuilder> {
  $$LoginResponsesTableTableManager(
      _$AppDatabase db, $LoginResponsesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$LoginResponsesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$LoginResponsesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> token = const Value.absent(),
            Value<int> userId = const Value.absent(),
          }) =>
              LoginResponsesCompanion(
            id: id,
            token: token,
            userId: userId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String token,
            required int userId,
          }) =>
              LoginResponsesCompanion.insert(
            id: id,
            token: token,
            userId: userId,
          ),
        ));
}

class $$LoginResponsesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $LoginResponsesTable> {
  $$LoginResponsesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get token => $state.composableBuilder(
      column: $state.table.token,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$LoginResponsesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $LoginResponsesTable> {
  $$LoginResponsesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get token => $state.composableBuilder(
      column: $state.table.token,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$RolesTableCreateCompanionBuilder = RolesCompanion Function({
  Value<int> id,
  required int userId,
  required String authority,
});
typedef $$RolesTableUpdateCompanionBuilder = RolesCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<String> authority,
});

class $$RolesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RolesTable,
    Role,
    $$RolesTableFilterComposer,
    $$RolesTableOrderingComposer,
    $$RolesTableCreateCompanionBuilder,
    $$RolesTableUpdateCompanionBuilder> {
  $$RolesTableTableManager(_$AppDatabase db, $RolesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RolesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RolesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> authority = const Value.absent(),
          }) =>
              RolesCompanion(
            id: id,
            userId: userId,
            authority: authority,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required String authority,
          }) =>
              RolesCompanion.insert(
            id: id,
            userId: userId,
            authority: authority,
          ),
        ));
}

class $$RolesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RolesTable> {
  $$RolesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get authority => $state.composableBuilder(
      column: $state.table.authority,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$RolesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RolesTable> {
  $$RolesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get authority => $state.composableBuilder(
      column: $state.table.authority,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$UsersTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.users, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$GendersTableCreateCompanionBuilder = GendersCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$GendersTableUpdateCompanionBuilder = GendersCompanion Function({
  Value<int> id,
  Value<String> name,
});

class $$GendersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GendersTable,
    Gender,
    $$GendersTableFilterComposer,
    $$GendersTableOrderingComposer,
    $$GendersTableCreateCompanionBuilder,
    $$GendersTableUpdateCompanionBuilder> {
  $$GendersTableTableManager(_$AppDatabase db, $GendersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GendersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$GendersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              GendersCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              GendersCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$GendersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $GendersTable> {
  $$GendersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$GendersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $GendersTable> {
  $$GendersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ComorbiditiesTableCreateCompanionBuilder = ComorbiditiesCompanion
    Function({
  Value<int> id,
  required String name,
});
typedef $$ComorbiditiesTableUpdateCompanionBuilder = ComorbiditiesCompanion
    Function({
  Value<int> id,
  Value<String> name,
});

class $$ComorbiditiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ComorbiditiesTable,
    Comorbidity,
    $$ComorbiditiesTableFilterComposer,
    $$ComorbiditiesTableOrderingComposer,
    $$ComorbiditiesTableCreateCompanionBuilder,
    $$ComorbiditiesTableUpdateCompanionBuilder> {
  $$ComorbiditiesTableTableManager(_$AppDatabase db, $ComorbiditiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ComorbiditiesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ComorbiditiesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              ComorbiditiesCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              ComorbiditiesCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$ComorbiditiesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ComorbiditiesTable> {
  $$ComorbiditiesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ComorbiditiesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ComorbiditiesTable> {
  $$ComorbiditiesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SmokersTableCreateCompanionBuilder = SmokersCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$SmokersTableUpdateCompanionBuilder = SmokersCompanion Function({
  Value<int> id,
  Value<String> name,
});

class $$SmokersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SmokersTable,
    Smoker,
    $$SmokersTableFilterComposer,
    $$SmokersTableOrderingComposer,
    $$SmokersTableCreateCompanionBuilder,
    $$SmokersTableUpdateCompanionBuilder> {
  $$SmokersTableTableManager(_$AppDatabase db, $SmokersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SmokersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SmokersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              SmokersCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              SmokersCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$SmokersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SmokersTable> {
  $$SmokersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SmokersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SmokersTable> {
  $$SmokersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$StudyLinesTableCreateCompanionBuilder = StudyLinesCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$StudyLinesTableUpdateCompanionBuilder = StudyLinesCompanion Function({
  Value<int> id,
  Value<String> name,
});

class $$StudyLinesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StudyLinesTable,
    StudyLine,
    $$StudyLinesTableFilterComposer,
    $$StudyLinesTableOrderingComposer,
    $$StudyLinesTableCreateCompanionBuilder,
    $$StudyLinesTableUpdateCompanionBuilder> {
  $$StudyLinesTableTableManager(_$AppDatabase db, $StudyLinesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$StudyLinesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$StudyLinesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              StudyLinesCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              StudyLinesCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$StudyLinesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $StudyLinesTable> {
  $$StudyLinesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$StudyLinesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $StudyLinesTable> {
  $$StudyLinesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SmokingCessationTimesTableCreateCompanionBuilder
    = SmokingCessationTimesCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$SmokingCessationTimesTableUpdateCompanionBuilder
    = SmokingCessationTimesCompanion Function({
  Value<int> id,
  Value<String> name,
});

class $$SmokingCessationTimesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SmokingCessationTimesTable,
    SmokingCessationTime,
    $$SmokingCessationTimesTableFilterComposer,
    $$SmokingCessationTimesTableOrderingComposer,
    $$SmokingCessationTimesTableCreateCompanionBuilder,
    $$SmokingCessationTimesTableUpdateCompanionBuilder> {
  $$SmokingCessationTimesTableTableManager(
      _$AppDatabase db, $SmokingCessationTimesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$SmokingCessationTimesTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$SmokingCessationTimesTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              SmokingCessationTimesCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              SmokingCessationTimesCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$SmokingCessationTimesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SmokingCessationTimesTable> {
  $$SmokingCessationTimesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SmokingCessationTimesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SmokingCessationTimesTable> {
  $$SmokingCessationTimesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SmokingTypesTableCreateCompanionBuilder = SmokingTypesCompanion
    Function({
  Value<int> id,
  required String name,
});
typedef $$SmokingTypesTableUpdateCompanionBuilder = SmokingTypesCompanion
    Function({
  Value<int> id,
  Value<String> name,
});

class $$SmokingTypesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SmokingTypesTable,
    SmokingType,
    $$SmokingTypesTableFilterComposer,
    $$SmokingTypesTableOrderingComposer,
    $$SmokingTypesTableCreateCompanionBuilder,
    $$SmokingTypesTableUpdateCompanionBuilder> {
  $$SmokingTypesTableTableManager(_$AppDatabase db, $SmokingTypesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SmokingTypesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SmokingTypesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              SmokingTypesCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              SmokingTypesCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$SmokingTypesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SmokingTypesTable> {
  $$SmokingTypesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SmokingTypesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SmokingTypesTable> {
  $$SmokingTypesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$HealthPerceptionsTableCreateCompanionBuilder
    = HealthPerceptionsCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$HealthPerceptionsTableUpdateCompanionBuilder
    = HealthPerceptionsCompanion Function({
  Value<int> id,
  Value<String> name,
});

class $$HealthPerceptionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HealthPerceptionsTable,
    HealthPerception,
    $$HealthPerceptionsTableFilterComposer,
    $$HealthPerceptionsTableOrderingComposer,
    $$HealthPerceptionsTableCreateCompanionBuilder,
    $$HealthPerceptionsTableUpdateCompanionBuilder> {
  $$HealthPerceptionsTableTableManager(
      _$AppDatabase db, $HealthPerceptionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$HealthPerceptionsTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$HealthPerceptionsTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              HealthPerceptionsCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              HealthPerceptionsCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$HealthPerceptionsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HealthPerceptionsTable> {
  $$HealthPerceptionsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$HealthPerceptionsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HealthPerceptionsTable> {
  $$HealthPerceptionsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$HospitalizationLocationsTableCreateCompanionBuilder
    = HospitalizationLocationsCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$HospitalizationLocationsTableUpdateCompanionBuilder
    = HospitalizationLocationsCompanion Function({
  Value<int> id,
  Value<String> name,
});

class $$HospitalizationLocationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HospitalizationLocationsTable,
    HospitalizationLocation,
    $$HospitalizationLocationsTableFilterComposer,
    $$HospitalizationLocationsTableOrderingComposer,
    $$HospitalizationLocationsTableCreateCompanionBuilder,
    $$HospitalizationLocationsTableUpdateCompanionBuilder> {
  $$HospitalizationLocationsTableTableManager(
      _$AppDatabase db, $HospitalizationLocationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$HospitalizationLocationsTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$HospitalizationLocationsTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              HospitalizationLocationsCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              HospitalizationLocationsCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$HospitalizationLocationsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HospitalizationLocationsTable> {
  $$HospitalizationLocationsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$HospitalizationLocationsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HospitalizationLocationsTable> {
  $$HospitalizationLocationsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$NicotineAmountsTableCreateCompanionBuilder = NicotineAmountsCompanion
    Function({
  Value<int> id,
  required String name,
});
typedef $$NicotineAmountsTableUpdateCompanionBuilder = NicotineAmountsCompanion
    Function({
  Value<int> id,
  Value<String> name,
});

class $$NicotineAmountsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NicotineAmountsTable,
    NicotineAmount,
    $$NicotineAmountsTableFilterComposer,
    $$NicotineAmountsTableOrderingComposer,
    $$NicotineAmountsTableCreateCompanionBuilder,
    $$NicotineAmountsTableUpdateCompanionBuilder> {
  $$NicotineAmountsTableTableManager(
      _$AppDatabase db, $NicotineAmountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NicotineAmountsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$NicotineAmountsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              NicotineAmountsCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              NicotineAmountsCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$NicotineAmountsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $NicotineAmountsTable> {
  $$NicotineAmountsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$NicotineAmountsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $NicotineAmountsTable> {
  $$NicotineAmountsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$RespiratoryFailuresTableCreateCompanionBuilder
    = RespiratoryFailuresCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$RespiratoryFailuresTableUpdateCompanionBuilder
    = RespiratoryFailuresCompanion Function({
  Value<int> id,
  Value<String> name,
});

class $$RespiratoryFailuresTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RespiratoryFailuresTable,
    RespiratoryFailure,
    $$RespiratoryFailuresTableFilterComposer,
    $$RespiratoryFailuresTableOrderingComposer,
    $$RespiratoryFailuresTableCreateCompanionBuilder,
    $$RespiratoryFailuresTableUpdateCompanionBuilder> {
  $$RespiratoryFailuresTableTableManager(
      _$AppDatabase db, $RespiratoryFailuresTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$RespiratoryFailuresTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$RespiratoryFailuresTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              RespiratoryFailuresCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              RespiratoryFailuresCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$RespiratoryFailuresTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RespiratoryFailuresTable> {
  $$RespiratoryFailuresTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$RespiratoryFailuresTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RespiratoryFailuresTable> {
  $$RespiratoryFailuresTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PatientsTableCreateCompanionBuilder = PatientsCompanion Function({
  Value<int> id,
  required bool synchronized,
  Value<String?> collectionSite,
  Value<String?> identifier,
  Value<String?> otherComorbidities,
  Value<int?> smokerId,
  Value<int?> genderId,
  Value<double?> weight,
  Value<double?> height,
  Value<String?> bloodPressure,
  Value<int?> age,
  Value<int?> heartRate,
  Value<int?> respiratoryRate,
  Value<double?> saturation,
  Value<int?> studyTypeId,
  Value<int?> collectorUserId,
  Value<DateTime?> collectionDate,
  Value<double?> gasometryPaO2,
  Value<double?> gasometryPaCo2,
  Value<double?> gasometryPH,
  Value<int?> hospitalizationDays,
  Value<int?> hospitalizationSiteId,
  Value<int?> respiratoryInsufficiencyTypeId,
  Value<String?> hemodynamicAssessment,
  Value<String?> medicalDiagnosis,
  Value<int?> cigaretteTypeId,
  Value<double?> carbonMonoxide,
  Value<double?> tobaccoLoad,
  Value<double?> tobaccoLoadTraditional,
  Value<double?> tobaccoLoadVaping,
  Value<int?> consumptionDurationYears,
  Value<int?> consumptionDurationMonths,
  Value<int?> nicotineQuantityId,
  Value<int?> consumptionDurationTraditionalYears,
  Value<int?> consumptionDurationTraditionalMonths,
  Value<int?> consumptionDurationVapingYears,
  Value<int?> consumptionDurationVapingMonths,
  Value<int?> cessationTimeTraditionalYears,
  Value<int?> cessationTimeTraditionalMonths,
  Value<int?> cessationTimeVapingYears,
  Value<int?> cessationTimeVapingMonths,
  Value<int?> participationWeek,
  Value<int?> cessationTimeId,
  Value<int?> healthPerceptionId,
  Value<String?> audioNoisePath,
  Value<Uint8List?> audioNoise,
  required bool audioNoiseSynchronized,
  Value<String?> audioVocalPath,
  Value<Uint8List?> audioVocal,
  required bool audioVocalSynchronized,
  Value<String?> audioSentencePath,
  Value<Uint8List?> audioSentence,
  required bool audioSentenceSynchronized,
  Value<String?> audioNurseryRhymePath,
  Value<Uint8List?> audioNurseryRhyme,
  required bool audioNurseryRhymeSynchronized,
  Value<String?> comorbidityIds,
});
typedef $$PatientsTableUpdateCompanionBuilder = PatientsCompanion Function({
  Value<int> id,
  Value<bool> synchronized,
  Value<String?> collectionSite,
  Value<String?> identifier,
  Value<String?> otherComorbidities,
  Value<int?> smokerId,
  Value<int?> genderId,
  Value<double?> weight,
  Value<double?> height,
  Value<String?> bloodPressure,
  Value<int?> age,
  Value<int?> heartRate,
  Value<int?> respiratoryRate,
  Value<double?> saturation,
  Value<int?> studyTypeId,
  Value<int?> collectorUserId,
  Value<DateTime?> collectionDate,
  Value<double?> gasometryPaO2,
  Value<double?> gasometryPaCo2,
  Value<double?> gasometryPH,
  Value<int?> hospitalizationDays,
  Value<int?> hospitalizationSiteId,
  Value<int?> respiratoryInsufficiencyTypeId,
  Value<String?> hemodynamicAssessment,
  Value<String?> medicalDiagnosis,
  Value<int?> cigaretteTypeId,
  Value<double?> carbonMonoxide,
  Value<double?> tobaccoLoad,
  Value<double?> tobaccoLoadTraditional,
  Value<double?> tobaccoLoadVaping,
  Value<int?> consumptionDurationYears,
  Value<int?> consumptionDurationMonths,
  Value<int?> nicotineQuantityId,
  Value<int?> consumptionDurationTraditionalYears,
  Value<int?> consumptionDurationTraditionalMonths,
  Value<int?> consumptionDurationVapingYears,
  Value<int?> consumptionDurationVapingMonths,
  Value<int?> cessationTimeTraditionalYears,
  Value<int?> cessationTimeTraditionalMonths,
  Value<int?> cessationTimeVapingYears,
  Value<int?> cessationTimeVapingMonths,
  Value<int?> participationWeek,
  Value<int?> cessationTimeId,
  Value<int?> healthPerceptionId,
  Value<String?> audioNoisePath,
  Value<Uint8List?> audioNoise,
  Value<bool> audioNoiseSynchronized,
  Value<String?> audioVocalPath,
  Value<Uint8List?> audioVocal,
  Value<bool> audioVocalSynchronized,
  Value<String?> audioSentencePath,
  Value<Uint8List?> audioSentence,
  Value<bool> audioSentenceSynchronized,
  Value<String?> audioNurseryRhymePath,
  Value<Uint8List?> audioNurseryRhyme,
  Value<bool> audioNurseryRhymeSynchronized,
  Value<String?> comorbidityIds,
});

class $$PatientsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PatientsTable,
    Patient,
    $$PatientsTableFilterComposer,
    $$PatientsTableOrderingComposer,
    $$PatientsTableCreateCompanionBuilder,
    $$PatientsTableUpdateCompanionBuilder> {
  $$PatientsTableTableManager(_$AppDatabase db, $PatientsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PatientsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PatientsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> synchronized = const Value.absent(),
            Value<String?> collectionSite = const Value.absent(),
            Value<String?> identifier = const Value.absent(),
            Value<String?> otherComorbidities = const Value.absent(),
            Value<int?> smokerId = const Value.absent(),
            Value<int?> genderId = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<double?> height = const Value.absent(),
            Value<String?> bloodPressure = const Value.absent(),
            Value<int?> age = const Value.absent(),
            Value<int?> heartRate = const Value.absent(),
            Value<int?> respiratoryRate = const Value.absent(),
            Value<double?> saturation = const Value.absent(),
            Value<int?> studyTypeId = const Value.absent(),
            Value<int?> collectorUserId = const Value.absent(),
            Value<DateTime?> collectionDate = const Value.absent(),
            Value<double?> gasometryPaO2 = const Value.absent(),
            Value<double?> gasometryPaCo2 = const Value.absent(),
            Value<double?> gasometryPH = const Value.absent(),
            Value<int?> hospitalizationDays = const Value.absent(),
            Value<int?> hospitalizationSiteId = const Value.absent(),
            Value<int?> respiratoryInsufficiencyTypeId = const Value.absent(),
            Value<String?> hemodynamicAssessment = const Value.absent(),
            Value<String?> medicalDiagnosis = const Value.absent(),
            Value<int?> cigaretteTypeId = const Value.absent(),
            Value<double?> carbonMonoxide = const Value.absent(),
            Value<double?> tobaccoLoad = const Value.absent(),
            Value<double?> tobaccoLoadTraditional = const Value.absent(),
            Value<double?> tobaccoLoadVaping = const Value.absent(),
            Value<int?> consumptionDurationYears = const Value.absent(),
            Value<int?> consumptionDurationMonths = const Value.absent(),
            Value<int?> nicotineQuantityId = const Value.absent(),
            Value<int?> consumptionDurationTraditionalYears =
                const Value.absent(),
            Value<int?> consumptionDurationTraditionalMonths =
                const Value.absent(),
            Value<int?> consumptionDurationVapingYears = const Value.absent(),
            Value<int?> consumptionDurationVapingMonths = const Value.absent(),
            Value<int?> cessationTimeTraditionalYears = const Value.absent(),
            Value<int?> cessationTimeTraditionalMonths = const Value.absent(),
            Value<int?> cessationTimeVapingYears = const Value.absent(),
            Value<int?> cessationTimeVapingMonths = const Value.absent(),
            Value<int?> participationWeek = const Value.absent(),
            Value<int?> cessationTimeId = const Value.absent(),
            Value<int?> healthPerceptionId = const Value.absent(),
            Value<String?> audioNoisePath = const Value.absent(),
            Value<Uint8List?> audioNoise = const Value.absent(),
            Value<bool> audioNoiseSynchronized = const Value.absent(),
            Value<String?> audioVocalPath = const Value.absent(),
            Value<Uint8List?> audioVocal = const Value.absent(),
            Value<bool> audioVocalSynchronized = const Value.absent(),
            Value<String?> audioSentencePath = const Value.absent(),
            Value<Uint8List?> audioSentence = const Value.absent(),
            Value<bool> audioSentenceSynchronized = const Value.absent(),
            Value<String?> audioNurseryRhymePath = const Value.absent(),
            Value<Uint8List?> audioNurseryRhyme = const Value.absent(),
            Value<bool> audioNurseryRhymeSynchronized = const Value.absent(),
            Value<String?> comorbidityIds = const Value.absent(),
          }) =>
              PatientsCompanion(
            id: id,
            synchronized: synchronized,
            collectionSite: collectionSite,
            identifier: identifier,
            otherComorbidities: otherComorbidities,
            smokerId: smokerId,
            genderId: genderId,
            weight: weight,
            height: height,
            bloodPressure: bloodPressure,
            age: age,
            heartRate: heartRate,
            respiratoryRate: respiratoryRate,
            saturation: saturation,
            studyTypeId: studyTypeId,
            collectorUserId: collectorUserId,
            collectionDate: collectionDate,
            gasometryPaO2: gasometryPaO2,
            gasometryPaCo2: gasometryPaCo2,
            gasometryPH: gasometryPH,
            hospitalizationDays: hospitalizationDays,
            hospitalizationSiteId: hospitalizationSiteId,
            respiratoryInsufficiencyTypeId: respiratoryInsufficiencyTypeId,
            hemodynamicAssessment: hemodynamicAssessment,
            medicalDiagnosis: medicalDiagnosis,
            cigaretteTypeId: cigaretteTypeId,
            carbonMonoxide: carbonMonoxide,
            tobaccoLoad: tobaccoLoad,
            tobaccoLoadTraditional: tobaccoLoadTraditional,
            tobaccoLoadVaping: tobaccoLoadVaping,
            consumptionDurationYears: consumptionDurationYears,
            consumptionDurationMonths: consumptionDurationMonths,
            nicotineQuantityId: nicotineQuantityId,
            consumptionDurationTraditionalYears:
                consumptionDurationTraditionalYears,
            consumptionDurationTraditionalMonths:
                consumptionDurationTraditionalMonths,
            consumptionDurationVapingYears: consumptionDurationVapingYears,
            consumptionDurationVapingMonths: consumptionDurationVapingMonths,
            cessationTimeTraditionalYears: cessationTimeTraditionalYears,
            cessationTimeTraditionalMonths: cessationTimeTraditionalMonths,
            cessationTimeVapingYears: cessationTimeVapingYears,
            cessationTimeVapingMonths: cessationTimeVapingMonths,
            participationWeek: participationWeek,
            cessationTimeId: cessationTimeId,
            healthPerceptionId: healthPerceptionId,
            audioNoisePath: audioNoisePath,
            audioNoise: audioNoise,
            audioNoiseSynchronized: audioNoiseSynchronized,
            audioVocalPath: audioVocalPath,
            audioVocal: audioVocal,
            audioVocalSynchronized: audioVocalSynchronized,
            audioSentencePath: audioSentencePath,
            audioSentence: audioSentence,
            audioSentenceSynchronized: audioSentenceSynchronized,
            audioNurseryRhymePath: audioNurseryRhymePath,
            audioNurseryRhyme: audioNurseryRhyme,
            audioNurseryRhymeSynchronized: audioNurseryRhymeSynchronized,
            comorbidityIds: comorbidityIds,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required bool synchronized,
            Value<String?> collectionSite = const Value.absent(),
            Value<String?> identifier = const Value.absent(),
            Value<String?> otherComorbidities = const Value.absent(),
            Value<int?> smokerId = const Value.absent(),
            Value<int?> genderId = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<double?> height = const Value.absent(),
            Value<String?> bloodPressure = const Value.absent(),
            Value<int?> age = const Value.absent(),
            Value<int?> heartRate = const Value.absent(),
            Value<int?> respiratoryRate = const Value.absent(),
            Value<double?> saturation = const Value.absent(),
            Value<int?> studyTypeId = const Value.absent(),
            Value<int?> collectorUserId = const Value.absent(),
            Value<DateTime?> collectionDate = const Value.absent(),
            Value<double?> gasometryPaO2 = const Value.absent(),
            Value<double?> gasometryPaCo2 = const Value.absent(),
            Value<double?> gasometryPH = const Value.absent(),
            Value<int?> hospitalizationDays = const Value.absent(),
            Value<int?> hospitalizationSiteId = const Value.absent(),
            Value<int?> respiratoryInsufficiencyTypeId = const Value.absent(),
            Value<String?> hemodynamicAssessment = const Value.absent(),
            Value<String?> medicalDiagnosis = const Value.absent(),
            Value<int?> cigaretteTypeId = const Value.absent(),
            Value<double?> carbonMonoxide = const Value.absent(),
            Value<double?> tobaccoLoad = const Value.absent(),
            Value<double?> tobaccoLoadTraditional = const Value.absent(),
            Value<double?> tobaccoLoadVaping = const Value.absent(),
            Value<int?> consumptionDurationYears = const Value.absent(),
            Value<int?> consumptionDurationMonths = const Value.absent(),
            Value<int?> nicotineQuantityId = const Value.absent(),
            Value<int?> consumptionDurationTraditionalYears =
                const Value.absent(),
            Value<int?> consumptionDurationTraditionalMonths =
                const Value.absent(),
            Value<int?> consumptionDurationVapingYears = const Value.absent(),
            Value<int?> consumptionDurationVapingMonths = const Value.absent(),
            Value<int?> cessationTimeTraditionalYears = const Value.absent(),
            Value<int?> cessationTimeTraditionalMonths = const Value.absent(),
            Value<int?> cessationTimeVapingYears = const Value.absent(),
            Value<int?> cessationTimeVapingMonths = const Value.absent(),
            Value<int?> participationWeek = const Value.absent(),
            Value<int?> cessationTimeId = const Value.absent(),
            Value<int?> healthPerceptionId = const Value.absent(),
            Value<String?> audioNoisePath = const Value.absent(),
            Value<Uint8List?> audioNoise = const Value.absent(),
            required bool audioNoiseSynchronized,
            Value<String?> audioVocalPath = const Value.absent(),
            Value<Uint8List?> audioVocal = const Value.absent(),
            required bool audioVocalSynchronized,
            Value<String?> audioSentencePath = const Value.absent(),
            Value<Uint8List?> audioSentence = const Value.absent(),
            required bool audioSentenceSynchronized,
            Value<String?> audioNurseryRhymePath = const Value.absent(),
            Value<Uint8List?> audioNurseryRhyme = const Value.absent(),
            required bool audioNurseryRhymeSynchronized,
            Value<String?> comorbidityIds = const Value.absent(),
          }) =>
              PatientsCompanion.insert(
            id: id,
            synchronized: synchronized,
            collectionSite: collectionSite,
            identifier: identifier,
            otherComorbidities: otherComorbidities,
            smokerId: smokerId,
            genderId: genderId,
            weight: weight,
            height: height,
            bloodPressure: bloodPressure,
            age: age,
            heartRate: heartRate,
            respiratoryRate: respiratoryRate,
            saturation: saturation,
            studyTypeId: studyTypeId,
            collectorUserId: collectorUserId,
            collectionDate: collectionDate,
            gasometryPaO2: gasometryPaO2,
            gasometryPaCo2: gasometryPaCo2,
            gasometryPH: gasometryPH,
            hospitalizationDays: hospitalizationDays,
            hospitalizationSiteId: hospitalizationSiteId,
            respiratoryInsufficiencyTypeId: respiratoryInsufficiencyTypeId,
            hemodynamicAssessment: hemodynamicAssessment,
            medicalDiagnosis: medicalDiagnosis,
            cigaretteTypeId: cigaretteTypeId,
            carbonMonoxide: carbonMonoxide,
            tobaccoLoad: tobaccoLoad,
            tobaccoLoadTraditional: tobaccoLoadTraditional,
            tobaccoLoadVaping: tobaccoLoadVaping,
            consumptionDurationYears: consumptionDurationYears,
            consumptionDurationMonths: consumptionDurationMonths,
            nicotineQuantityId: nicotineQuantityId,
            consumptionDurationTraditionalYears:
                consumptionDurationTraditionalYears,
            consumptionDurationTraditionalMonths:
                consumptionDurationTraditionalMonths,
            consumptionDurationVapingYears: consumptionDurationVapingYears,
            consumptionDurationVapingMonths: consumptionDurationVapingMonths,
            cessationTimeTraditionalYears: cessationTimeTraditionalYears,
            cessationTimeTraditionalMonths: cessationTimeTraditionalMonths,
            cessationTimeVapingYears: cessationTimeVapingYears,
            cessationTimeVapingMonths: cessationTimeVapingMonths,
            participationWeek: participationWeek,
            cessationTimeId: cessationTimeId,
            healthPerceptionId: healthPerceptionId,
            audioNoisePath: audioNoisePath,
            audioNoise: audioNoise,
            audioNoiseSynchronized: audioNoiseSynchronized,
            audioVocalPath: audioVocalPath,
            audioVocal: audioVocal,
            audioVocalSynchronized: audioVocalSynchronized,
            audioSentencePath: audioSentencePath,
            audioSentence: audioSentence,
            audioSentenceSynchronized: audioSentenceSynchronized,
            audioNurseryRhymePath: audioNurseryRhymePath,
            audioNurseryRhyme: audioNurseryRhyme,
            audioNurseryRhymeSynchronized: audioNurseryRhymeSynchronized,
            comorbidityIds: comorbidityIds,
          ),
        ));
}

class $$PatientsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get synchronized => $state.composableBuilder(
      column: $state.table.synchronized,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get collectionSite => $state.composableBuilder(
      column: $state.table.collectionSite,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get identifier => $state.composableBuilder(
      column: $state.table.identifier,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get otherComorbidities => $state.composableBuilder(
      column: $state.table.otherComorbidities,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get smokerId => $state.composableBuilder(
      column: $state.table.smokerId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get genderId => $state.composableBuilder(
      column: $state.table.genderId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get height => $state.composableBuilder(
      column: $state.table.height,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get bloodPressure => $state.composableBuilder(
      column: $state.table.bloodPressure,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get age => $state.composableBuilder(
      column: $state.table.age,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get heartRate => $state.composableBuilder(
      column: $state.table.heartRate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get respiratoryRate => $state.composableBuilder(
      column: $state.table.respiratoryRate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get saturation => $state.composableBuilder(
      column: $state.table.saturation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get studyTypeId => $state.composableBuilder(
      column: $state.table.studyTypeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get collectorUserId => $state.composableBuilder(
      column: $state.table.collectorUserId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get collectionDate => $state.composableBuilder(
      column: $state.table.collectionDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get gasometryPaO2 => $state.composableBuilder(
      column: $state.table.gasometryPaO2,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get gasometryPaCo2 => $state.composableBuilder(
      column: $state.table.gasometryPaCo2,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get gasometryPH => $state.composableBuilder(
      column: $state.table.gasometryPH,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get hospitalizationDays => $state.composableBuilder(
      column: $state.table.hospitalizationDays,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get hospitalizationSiteId => $state.composableBuilder(
      column: $state.table.hospitalizationSiteId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get respiratoryInsufficiencyTypeId => $state
      .composableBuilder(
          column: $state.table.respiratoryInsufficiencyTypeId,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get hemodynamicAssessment => $state.composableBuilder(
      column: $state.table.hemodynamicAssessment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get medicalDiagnosis => $state.composableBuilder(
      column: $state.table.medicalDiagnosis,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cigaretteTypeId => $state.composableBuilder(
      column: $state.table.cigaretteTypeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get carbonMonoxide => $state.composableBuilder(
      column: $state.table.carbonMonoxide,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get tobaccoLoad => $state.composableBuilder(
      column: $state.table.tobaccoLoad,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get tobaccoLoadTraditional => $state.composableBuilder(
      column: $state.table.tobaccoLoadTraditional,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get tobaccoLoadVaping => $state.composableBuilder(
      column: $state.table.tobaccoLoadVaping,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get consumptionDurationYears => $state.composableBuilder(
      column: $state.table.consumptionDurationYears,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get consumptionDurationMonths => $state.composableBuilder(
      column: $state.table.consumptionDurationMonths,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get nicotineQuantityId => $state.composableBuilder(
      column: $state.table.nicotineQuantityId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get consumptionDurationTraditionalYears =>
      $state.composableBuilder(
          column: $state.table.consumptionDurationTraditionalYears,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get consumptionDurationTraditionalMonths =>
      $state.composableBuilder(
          column: $state.table.consumptionDurationTraditionalMonths,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get consumptionDurationVapingYears => $state
      .composableBuilder(
          column: $state.table.consumptionDurationVapingYears,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get consumptionDurationVapingMonths =>
      $state.composableBuilder(
          column: $state.table.consumptionDurationVapingMonths,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cessationTimeTraditionalYears =>
      $state.composableBuilder(
          column: $state.table.cessationTimeTraditionalYears,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cessationTimeTraditionalMonths => $state
      .composableBuilder(
          column: $state.table.cessationTimeTraditionalMonths,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cessationTimeVapingYears => $state.composableBuilder(
      column: $state.table.cessationTimeVapingYears,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cessationTimeVapingMonths => $state.composableBuilder(
      column: $state.table.cessationTimeVapingMonths,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get participationWeek => $state.composableBuilder(
      column: $state.table.participationWeek,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cessationTimeId => $state.composableBuilder(
      column: $state.table.cessationTimeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get healthPerceptionId => $state.composableBuilder(
      column: $state.table.healthPerceptionId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get audioNoisePath => $state.composableBuilder(
      column: $state.table.audioNoisePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get audioNoise => $state.composableBuilder(
      column: $state.table.audioNoise,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get audioNoiseSynchronized => $state.composableBuilder(
      column: $state.table.audioNoiseSynchronized,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get audioVocalPath => $state.composableBuilder(
      column: $state.table.audioVocalPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get audioVocal => $state.composableBuilder(
      column: $state.table.audioVocal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get audioVocalSynchronized => $state.composableBuilder(
      column: $state.table.audioVocalSynchronized,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get audioSentencePath => $state.composableBuilder(
      column: $state.table.audioSentencePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get audioSentence => $state.composableBuilder(
      column: $state.table.audioSentence,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get audioSentenceSynchronized => $state.composableBuilder(
      column: $state.table.audioSentenceSynchronized,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get audioNurseryRhymePath => $state.composableBuilder(
      column: $state.table.audioNurseryRhymePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get audioNurseryRhyme => $state.composableBuilder(
      column: $state.table.audioNurseryRhyme,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get audioNurseryRhymeSynchronized => $state
      .composableBuilder(
          column: $state.table.audioNurseryRhymeSynchronized,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get comorbidityIds => $state.composableBuilder(
      column: $state.table.comorbidityIds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PatientsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get synchronized => $state.composableBuilder(
      column: $state.table.synchronized,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get collectionSite => $state.composableBuilder(
      column: $state.table.collectionSite,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get identifier => $state.composableBuilder(
      column: $state.table.identifier,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get otherComorbidities => $state.composableBuilder(
      column: $state.table.otherComorbidities,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get smokerId => $state.composableBuilder(
      column: $state.table.smokerId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get genderId => $state.composableBuilder(
      column: $state.table.genderId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get height => $state.composableBuilder(
      column: $state.table.height,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get bloodPressure => $state.composableBuilder(
      column: $state.table.bloodPressure,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get age => $state.composableBuilder(
      column: $state.table.age,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get heartRate => $state.composableBuilder(
      column: $state.table.heartRate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get respiratoryRate => $state.composableBuilder(
      column: $state.table.respiratoryRate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get saturation => $state.composableBuilder(
      column: $state.table.saturation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get studyTypeId => $state.composableBuilder(
      column: $state.table.studyTypeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get collectorUserId => $state.composableBuilder(
      column: $state.table.collectorUserId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get collectionDate => $state.composableBuilder(
      column: $state.table.collectionDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get gasometryPaO2 => $state.composableBuilder(
      column: $state.table.gasometryPaO2,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get gasometryPaCo2 => $state.composableBuilder(
      column: $state.table.gasometryPaCo2,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get gasometryPH => $state.composableBuilder(
      column: $state.table.gasometryPH,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get hospitalizationDays => $state.composableBuilder(
      column: $state.table.hospitalizationDays,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get hospitalizationSiteId => $state.composableBuilder(
      column: $state.table.hospitalizationSiteId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get respiratoryInsufficiencyTypeId =>
      $state.composableBuilder(
          column: $state.table.respiratoryInsufficiencyTypeId,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get hemodynamicAssessment => $state.composableBuilder(
      column: $state.table.hemodynamicAssessment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get medicalDiagnosis => $state.composableBuilder(
      column: $state.table.medicalDiagnosis,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cigaretteTypeId => $state.composableBuilder(
      column: $state.table.cigaretteTypeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get carbonMonoxide => $state.composableBuilder(
      column: $state.table.carbonMonoxide,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get tobaccoLoad => $state.composableBuilder(
      column: $state.table.tobaccoLoad,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get tobaccoLoadTraditional =>
      $state.composableBuilder(
          column: $state.table.tobaccoLoadTraditional,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get tobaccoLoadVaping => $state.composableBuilder(
      column: $state.table.tobaccoLoadVaping,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get consumptionDurationYears => $state.composableBuilder(
      column: $state.table.consumptionDurationYears,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get consumptionDurationMonths =>
      $state.composableBuilder(
          column: $state.table.consumptionDurationMonths,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get nicotineQuantityId => $state.composableBuilder(
      column: $state.table.nicotineQuantityId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get consumptionDurationTraditionalYears =>
      $state.composableBuilder(
          column: $state.table.consumptionDurationTraditionalYears,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get consumptionDurationTraditionalMonths =>
      $state.composableBuilder(
          column: $state.table.consumptionDurationTraditionalMonths,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get consumptionDurationVapingYears =>
      $state.composableBuilder(
          column: $state.table.consumptionDurationVapingYears,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get consumptionDurationVapingMonths =>
      $state.composableBuilder(
          column: $state.table.consumptionDurationVapingMonths,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cessationTimeTraditionalYears =>
      $state.composableBuilder(
          column: $state.table.cessationTimeTraditionalYears,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cessationTimeTraditionalMonths =>
      $state.composableBuilder(
          column: $state.table.cessationTimeTraditionalMonths,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cessationTimeVapingYears => $state.composableBuilder(
      column: $state.table.cessationTimeVapingYears,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cessationTimeVapingMonths =>
      $state.composableBuilder(
          column: $state.table.cessationTimeVapingMonths,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get participationWeek => $state.composableBuilder(
      column: $state.table.participationWeek,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cessationTimeId => $state.composableBuilder(
      column: $state.table.cessationTimeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get healthPerceptionId => $state.composableBuilder(
      column: $state.table.healthPerceptionId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get audioNoisePath => $state.composableBuilder(
      column: $state.table.audioNoisePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get audioNoise => $state.composableBuilder(
      column: $state.table.audioNoise,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get audioNoiseSynchronized => $state.composableBuilder(
      column: $state.table.audioNoiseSynchronized,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get audioVocalPath => $state.composableBuilder(
      column: $state.table.audioVocalPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get audioVocal => $state.composableBuilder(
      column: $state.table.audioVocal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get audioVocalSynchronized => $state.composableBuilder(
      column: $state.table.audioVocalSynchronized,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get audioSentencePath => $state.composableBuilder(
      column: $state.table.audioSentencePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get audioSentence => $state.composableBuilder(
      column: $state.table.audioSentence,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get audioSentenceSynchronized =>
      $state.composableBuilder(
          column: $state.table.audioSentenceSynchronized,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get audioNurseryRhymePath => $state.composableBuilder(
      column: $state.table.audioNurseryRhymePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get audioNurseryRhyme => $state.composableBuilder(
      column: $state.table.audioNurseryRhyme,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get audioNurseryRhymeSynchronized =>
      $state.composableBuilder(
          column: $state.table.audioNurseryRhymeSynchronized,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get comorbidityIds => $state.composableBuilder(
      column: $state.table.comorbidityIds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$LoginResponsesTableTableManager get loginResponses =>
      $$LoginResponsesTableTableManager(_db, _db.loginResponses);
  $$RolesTableTableManager get roles =>
      $$RolesTableTableManager(_db, _db.roles);
  $$GendersTableTableManager get genders =>
      $$GendersTableTableManager(_db, _db.genders);
  $$ComorbiditiesTableTableManager get comorbidities =>
      $$ComorbiditiesTableTableManager(_db, _db.comorbidities);
  $$SmokersTableTableManager get smokers =>
      $$SmokersTableTableManager(_db, _db.smokers);
  $$StudyLinesTableTableManager get studyLines =>
      $$StudyLinesTableTableManager(_db, _db.studyLines);
  $$SmokingCessationTimesTableTableManager get smokingCessationTimes =>
      $$SmokingCessationTimesTableTableManager(_db, _db.smokingCessationTimes);
  $$SmokingTypesTableTableManager get smokingTypes =>
      $$SmokingTypesTableTableManager(_db, _db.smokingTypes);
  $$HealthPerceptionsTableTableManager get healthPerceptions =>
      $$HealthPerceptionsTableTableManager(_db, _db.healthPerceptions);
  $$HospitalizationLocationsTableTableManager get hospitalizationLocations =>
      $$HospitalizationLocationsTableTableManager(
          _db, _db.hospitalizationLocations);
  $$NicotineAmountsTableTableManager get nicotineAmounts =>
      $$NicotineAmountsTableTableManager(_db, _db.nicotineAmounts);
  $$RespiratoryFailuresTableTableManager get respiratoryFailures =>
      $$RespiratoryFailuresTableTableManager(_db, _db.respiratoryFailures);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db, _db.patients);
}
