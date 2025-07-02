import 'package:get_it/get_it.dart';
import 'package:spira/feature/core/app_const.dart';
import 'package:spira/feature/data/datasources/local/database.dart';
import 'package:spira/feature/data/datasources/local/local_data_source.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/data/services/connectivity_service.dart';
import 'package:spira/feature/data/services/sync_data_service.dart';
import 'package:spira/feature/domain/usecases/delete_genders_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_health_perceptions_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_hospitalization_locations_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_nicotine_amounts_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_respiratory_failures_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_smokers_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_smoking_cessation_times_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_smoking_types_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_study_lines_usecase.dart';
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
import 'package:spira/feature/domain/usecases/get_user_usecase.dart';
import 'package:spira/feature/domain/usecases/patch_user_usecase.dart';
import 'package:spira/feature/domain/usecases/post_audio_usecase.dart';
import 'package:spira/feature/domain/usecases/post_genders_usecase.dart';
import 'package:spira/feature/domain/usecases/post_health_perceptions_usecase.dart';
import 'package:spira/feature/domain/usecases/post_hospitalization_locations_usecase.dart';
import 'package:spira/feature/domain/usecases/post_login_usecase.dart';
import 'package:spira/feature/domain/usecases/post_logout_usecase.dart';
import 'package:spira/feature/domain/usecases/post_nicotine_amounts_usecase.dart';
import 'package:spira/feature/domain/usecases/post_patient_data_usecase.dart';
import 'package:spira/feature/domain/usecases/post_user_usecase.dart';
import 'package:spira/feature/domain/usecases/put_user_usecase.dart';
import 'package:spira/feature/domain/usecases/post_respiratory_failures_usecase.dart';
import 'package:spira/feature/domain/usecases/post_smokers_usecase.dart';
import 'package:spira/feature/domain/usecases/post_smoking_cessation_times_usecase.dart';
import 'package:spira/feature/domain/usecases/post_smoking_types_usecase.dart';
import 'package:spira/feature/domain/usecases/post_study_lines_usecase.dart';
import 'package:spira/feature/presentation/cubits/auth/auth_cubit.dart';
import 'package:spira/feature/presentation/cubits/menu/menu_cubit.dart';

GetIt di = GetIt.instance;

Future<void> initInjection() async {
  // Cubit/Bloc
  di.registerFactory<AuthCubit>(() => AuthCubit());
  di.registerSingleton<MenuCubit>(MenuCubit());

  // useCase
  di.registerLazySingleton<PostLoginUseCase>(
      () => PostLoginUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostLogoutUsecase>(
      () => PostLogoutUsecase(remoteDataSource: di.call()));
  di.registerLazySingleton<GetComorbitiesUseCase>(
      () => GetComorbitiesUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<GetGendersUseCase>(
      () => GetGendersUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<GetHealthPerceptionsUseCase>(
      () => GetHealthPerceptionsUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<GetHospitalizationLocationsUseCase>(
      () => GetHospitalizationLocationsUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<GetNicotineAmountsUseCase>(
      () => GetNicotineAmountsUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<GetRespiratoryFailuresUseCase>(
      () => GetRespiratoryFailuresUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<GetSmokersUseCase>(
      () => GetSmokersUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<GetSmokingCessationTimesUseCase>(
      () => GetSmokingCessationTimesUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<GetSmokingTypesUseCase>(
      () => GetSmokingTypesUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<GetStudyLinesUseCase>(
      () => GetStudyLinesUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostPatientDataUseCase>(
      () => PostPatientDataUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostAudioDataUseCase>(
      () => PostAudioDataUseCase(remoteDataSource: di.call()));

  di.registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostUserUseCase>(
      () => PostUserUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PutUserUseCase>(
      () => PutUserUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PatchUserUseCase>(
      () => PatchUserUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostGendersUseCase>(
      () => PostGendersUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostSmokersUseCase>(
      () => PostSmokersUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostStudyLinesUseCase>(
      () => PostStudyLinesUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostHospitalizationLocationsUseCase>(
      () => PostHospitalizationLocationsUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostRespiratoryFailuresUseCase>(
      () => PostRespiratoryFailuresUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostSmokingTypesUseCase>(
      () => PostSmokingTypesUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostNicotineAmountsUseCase>(
      () => PostNicotineAmountsUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostSmokingCessationTimesUseCase>(
      () => PostSmokingCessationTimesUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<PostHealthPerceptionsUseCase>(
      () => PostHealthPerceptionsUseCase(remoteDataSource: di.call()));

  di.registerLazySingleton<DeleteGendersUseCase>(
      () => DeleteGendersUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<DeleteSmokersUseCase>(
      () => DeleteSmokersUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<DeleteStudyLinesUseCase>(
      () => DeleteStudyLinesUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<DeleteHospitalizationLocationsUseCase>(
      () => DeleteHospitalizationLocationsUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<DeleteRespiratoryFailuresUseCase>(
      () => DeleteRespiratoryFailuresUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<DeleteSmokingTypesUseCase>(
      () => DeleteSmokingTypesUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<DeleteNicotineAmountsUseCase>(
      () => DeleteNicotineAmountsUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<DeleteSmokingCessationTimesUseCase>(
      () => DeleteSmokingCessationTimesUseCase(remoteDataSource: di.call()));
  di.registerLazySingleton<DeleteHealthPerceptionsUseCase>(
      () => DeleteHealthPerceptionsUseCase(remoteDataSource: di.call()));

  // data sources/repositories
  di.registerLazySingleton(() => AppDatabase());
  di.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(database: di.call()));
  di.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  // utils
  di.registerSingleton<Globals>(Globals());
  di.registerSingleton<ConnectivityService>(ConnectivityService());
  di.registerSingleton<SyncDataService>(SyncDataService());
}
