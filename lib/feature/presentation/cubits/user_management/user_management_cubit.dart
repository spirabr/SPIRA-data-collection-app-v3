import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/domain/entities/user_entity.dart';
import 'package:spira/feature/domain/entities/users_response_entity.dart';
import 'package:spira/feature/domain/usecases/get_user_usecase.dart';
import 'package:spira/feature/presentation/cubits/auth/auth_cubit.dart';

part 'user_management_state.dart';

class UserManagementCubit extends Cubit<UserManagementState> {
  UserManagementCubit() : super(UserManagementState());

  Future loadUsers() async {
    emit(state.copyWith(loadState: GenericLoadState.loading));
    try {
      final GetUserUseCase getUserUseCase = GetIt.I.get<GetUserUseCase>();
      UsersResponseEntity response = await getUserUseCase.call();
      List<UserEntity> users = [];
      int page = 0;
      while ((response.data ?? []).isNotEmpty) {
        users.addAll(response.data!);
        page += 1;
        response = await getUserUseCase.call(page: page);
      }

      if (response.success == false) {
        if (response.authenticated == false) {
          await GetIt.I<AuthCubit>().logout();
          emit(state.copyWith(loadState: GenericLoadState.unauthenticated));
          return;
        } else {
          emit(state.copyWith(loadState: GenericLoadState.error));
        }
      }
      users.sort((a, b) => a.fullName.compareTo(b.fullName));

      emit(state.copyWith(loadState: GenericLoadState.success, users: users));
    } catch (_) {
      emit(state.copyWith(loadState: GenericLoadState.error));
    }
  }

  setActiveTab(UserManagementTab tab) {
    emit(state.copyWith(currentTab: tab));
  }

  List<UserEntity> getActiveUsers() {
    return state.users.where((element) => element.active).toList();
  }

  List<UserEntity> getInactiveUsers() {
    return state.users.where((element) => !element.active).toList();
  }
}
