part of 'manage_user_cubit.dart';

// ignore: must_be_immutable
class ManageUserState extends Equatable {
  ManageUserState({
    this.loadState = GenericLoadState.initial,
    this.userDetailsFrom = UserDetailsFrom.register,
    this.user,
    this.selectedRole,
    this.active,
  });

  GenericLoadState loadState;
  UserDetailsFrom userDetailsFrom;
  UserEntity? user;
  RoleEntity? selectedRole;
  bool? active;

  ManageUserState copyWith({
    GenericLoadState? loadState,
    UserDetailsFrom? userDetailsFrom,
    UserEntity? user,
    RoleEntity? selectedRole,
    bool? active,
  }) {
    return ManageUserState(
      loadState: loadState ?? this.loadState,
      userDetailsFrom: userDetailsFrom ?? this.userDetailsFrom,
      user: user ?? this.user,
      selectedRole: selectedRole ?? this.selectedRole,
      active: active ?? this.active,
    );
  }

  @override
  List<Object?> get props => [
        loadState,
        userDetailsFrom,
        user,
        selectedRole,
        active,
      ];
}
