import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/core/toast_utils.dart';
import 'package:spira/feature/data/datasources/local/local_data_source.dart';
import 'package:spira/feature/data/model/request/login_body.dart';
import 'package:spira/feature/data/services/sync_data_service.dart';
import 'package:spira/feature/domain/entities/login_response_entity.dart';
import 'package:spira/feature/domain/usecases/get_comorbities_usecase.dart';
import 'package:spira/feature/domain/usecases/get_genders_usecase.dart';
import 'package:spira/feature/domain/usecases/get_health_perceptions_usecase.dart';
import 'package:spira/feature/domain/usecases/get_hospitalization_locations_usecase.dart';
import 'package:spira/feature/domain/usecases/get_nicotine_amounts_usecase.dart';
import 'package:spira/feature/domain/usecases/get_respiratory_failures_usecase.dart';
import 'package:spira/feature/domain/usecases/get_smokers_usecase.dart';
import 'package:spira/feature/domain/usecases/get_smoking_cessation_times_usecase.dart';
import 'package:spira/feature/domain/usecases/get_smoking_types_usecase.dart';
import 'package:spira/feature/domain/usecases/get_study_lines_usecase.dart';
import 'package:spira/feature/domain/usecases/post_login_usecase.dart';
import 'package:spira/feature/domain/usecases/post_logout_usecase.dart';
import 'package:spira/feature/presentation/cubits/menu/menu_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  Future<bool> appStarted() async {
    try {
      final bool authenticated =
          await GetIt.I.get<LocalDataSource>().getFirstLoginResponse() != null;
      if (authenticated) {
        GetIt.I.get<SyncDataService>().start();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> login(String user, String password) async {
    if (user.isEmpty || password.isEmpty) {
      emit(state.copyWith(
          loadState: GenericLoadState.error,
          errorMessage: "Usuário e senha são obrigatórios"));
      return;
    }
    await EasyLoading.show();
    emit(state.copyWith(loadState: GenericLoadState.loading));
    try {
      final PostLoginUseCase postLoginUseCase = GetIt.I.get<PostLoginUseCase>();
      LoginResponseEntity? response = await postLoginUseCase
          .call(LoginBody(username: user, password: password));
      if (response?.user != null) {
        bool isUser = false;
        for (var element in response!.user.roles) {
          if (element.authority == "ROLE_USER") {
            isUser = true;
          }
        }
        if (isUser) await fetchAllCollectionFields();
      }
      GetIt.I.get<SyncDataService>().start();
      await EasyLoading.dismiss();
      GetIt.I<MenuCubit>().setIdle();
      emit(state.copyWith(loadState: GenericLoadState.success));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await EasyLoading.dismiss();
        emit(state.copyWith(
            loadState: GenericLoadState.error,
            errorMessage: "Usuário e/ou senha inválidos"));
      } else {
        await EasyLoading.dismiss();
        emit(state.copyWith(
            loadState: GenericLoadState.error,
            errorMessage:
                "Ocorreu um erro ao realizar login, tente novamente mais tarde"));
      }
    }
  }

  Future<void> fetchAllCollectionFields() async {
    try {
      await GetIt.I.get<GetComorbitiesUseCase>().call();
      await GetIt.I.get<GetGendersUseCase>().call();
      await GetIt.I.get<GetHealthPerceptionsUseCase>().call();
      await GetIt.I.get<GetHospitalizationLocationsUseCase>().call();
      await GetIt.I.get<GetNicotineAmountsUseCase>().call();
      await GetIt.I.get<GetRespiratoryFailuresUseCase>().call();
      await GetIt.I.get<GetSmokersUseCase>().call();
      await GetIt.I.get<GetSmokingCessationTimesUseCase>().call();
      await GetIt.I.get<GetSmokingTypesUseCase>().call();
      await GetIt.I.get<GetStudyLinesUseCase>().call();
    } catch (e) {
      log(e.toString());
      ToastUtils.showErrorFetchingCollectionData();
    }
  }

  Future<void> logout() async {
    try {
      final PostLogoutUsecase postLogoutUsecase =
          GetIt.I.get<PostLogoutUsecase>();
      postLogoutUsecase.call();
      await GetIt.I.get<LocalDataSource>().deleteAllFromAuthTables();
      await GetIt.I.get<LocalDataSource>().deleteAllFromCollectionFieldTables();
      GetIt.I.get<SyncDataService>().dispose();
    } catch (_) {}
  }
}
