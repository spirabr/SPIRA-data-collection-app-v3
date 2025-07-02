part of 'auth_cubit.dart';

// ignore: must_be_immutable
class AuthState extends Equatable {
  AuthState({
    this.loadState = GenericLoadState.initial,
    this.errorMessage = "",
  });

  GenericLoadState loadState;
  String errorMessage;

  AuthState copyWith({
    GenericLoadState? loadState,
    String? errorMessage,
  }) {
    return AuthState(
      loadState: loadState ?? this.loadState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        loadState,
        errorMessage,
      ];
}
