part of 'user_management_cubit.dart';

// ignore: must_be_immutable
class UserManagementState extends Equatable {
  UserManagementState({
    this.loadState = GenericLoadState.initial,
    this.currentTab = UserManagementTab.active,
    this.users = const [],
  });

  GenericLoadState loadState;
  UserManagementTab currentTab;
  List<UserEntity> users;

  UserManagementState copyWith({
    GenericLoadState? loadState,
    UserManagementTab? currentTab,
    List<UserEntity>? users,
  }) {
    return UserManagementState(
      loadState: loadState ?? this.loadState,
      currentTab: currentTab ?? this.currentTab,
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props => [
        loadState,
        currentTab,
        users,
      ];
}
