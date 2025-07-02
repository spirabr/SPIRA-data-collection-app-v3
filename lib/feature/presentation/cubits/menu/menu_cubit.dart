import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/data/datasources/local/local_data_source.dart';
import 'package:spira/feature/data/model/response/login_response_model.dart';
import 'package:spira/feature/data/model/response/role_model.dart';
import 'package:spira/feature/data/services/sync_data_service.dart';
import 'package:spira/feature/domain/entities/user_entity.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuState());

  Future loadUserRole() async {
    emit(state.copyWith(loadState: GenericLoadState.loading));

    final user = await GetIt.I.get<LocalDataSource>().getFirstLoginResponse();
    bool isAdmin = false;
    bool isUser = false;
    for (RoleModel role in user?.user.roles ?? []) {
      if (role.authority == 'ROLE_ADMIN') {
        isAdmin = true;
      }
      if (role.authority == 'ROLE_USER') {
        isUser = true;
      }
    }
    emit(state.copyWith(
        loadState: GenericLoadState.success, isAdmin: isAdmin, isUser: isUser));
    GetIt.I.get<SyncDataService>().tryToSyncOnMenu();
  }

  Future<UserEntity?> loadUser() async {
    LoginResponseModel? loginResponseModel =
        await GetIt.I.get<LocalDataSource>().getFirstLoginResponse();

    UserEntity? user = loginResponseModel?.user.toEntity();
    return user;
  }

  void setUnauthorized() {
    emit(state.copyWith(loadState: GenericLoadState.unauthenticated));
  }

  void setIdle() {
    emit(state.copyWith(loadState: GenericLoadState.idle));
  }
}
