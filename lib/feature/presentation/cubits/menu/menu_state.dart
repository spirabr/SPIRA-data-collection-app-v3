part of 'menu_cubit.dart';

// ignore: must_be_immutable
class MenuState extends Equatable {
  MenuState({
    this.loadState = GenericLoadState.initial,
    this.isAdmin = false,
    this.isUser = false,
  });

  GenericLoadState loadState;
  bool isAdmin;
  bool isUser;

  MenuState copyWith({
    GenericLoadState? loadState,
    bool? isAdmin,
    bool? isUser,
  }) {
    return MenuState(
      loadState: loadState ?? this.loadState,
      isAdmin: isAdmin ?? this.isAdmin,
      isUser: isUser ?? this.isUser,
    );
  }

  @override
  List<Object?> get props => [
        loadState,
        isAdmin,
        isUser,
      ];
}
