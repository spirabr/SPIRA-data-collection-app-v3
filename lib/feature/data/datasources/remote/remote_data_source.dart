import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:spira/feature/data/datasources/local/local_data_source.dart';
import 'package:spira/feature/data/model/request/edit_user_body.dart';
import 'package:spira/feature/data/model/request/login_body.dart';
import 'package:spira/feature/data/model/request/new_user_body.dart';
import 'package:spira/feature/data/model/request/patient_model.dart';
import 'package:spira/feature/data/model/response/audio_response_model.dart';
import 'package:spira/feature/data/model/response/cessation_time_response_model.dart';
import 'package:spira/feature/data/model/response/cigarette_type_response_model.dart';
import 'package:spira/feature/data/model/response/comorbidity_response_model.dart';
import 'package:spira/feature/data/model/response/gender_response_model.dart';
import 'package:spira/feature/data/model/response/generic_response_model.dart';
import 'package:spira/feature/data/model/response/health_perception_response_model.dart';
import 'package:spira/feature/data/model/response/hospitalization_site_response_model.dart';
import 'package:spira/feature/data/model/response/login_response_model.dart';
import 'package:spira/feature/data/model/response/nicotine_quantity_response_model.dart';
import 'package:spira/feature/data/model/response/patient_response_model.dart';
import 'package:spira/feature/data/model/response/respiratory_insufficency_response_model.dart';
import 'package:spira/feature/data/model/response/smoker_response_model.dart';
import 'package:spira/feature/data/model/response/study_type_response_model.dart';
import 'package:spira/feature/data/model/response/users_response_model.dart';
import 'package:spira/feature/domain/entities/Audio_response_entity.dart';
import 'package:spira/feature/domain/entities/comorbidity_entity.dart';
import 'package:spira/feature/domain/entities/gender_entity.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';
import 'package:spira/feature/domain/entities/health_perception_entity.dart';
import 'package:spira/feature/domain/entities/hospitalization_location_entity.dart';
import 'package:spira/feature/domain/entities/line_of_study_entity.dart';
import 'package:spira/feature/domain/entities/login_response_entity.dart';
import 'package:spira/feature/domain/entities/nicotine_amount_entity.dart';
import 'package:spira/feature/domain/entities/patient_response_entity.dart';
import 'package:spira/feature/domain/entities/respiratory_failure_entity.dart';
import 'package:spira/feature/domain/entities/smoker_entity.dart';
import 'package:spira/feature/domain/entities/smoking_cessation_entity.dart';
import 'package:spira/feature/domain/entities/smoking_entity.dart';
import 'package:spira/feature/domain/entities/users_response_entity.dart';

abstract class RemoteDataSource {
  Future<LoginResponseEntity> postLogin(LoginBody body);
  Future<void> postLogout();

  Future<List<GenderEntity>> getGenders();
  Future<List<ComorbidityEntity>> getComorbidities();
  Future<List<SmokerEntity>> getSmokers();
  Future<List<LineOfStudyEntity>> getStudyLines();
  Future<List<SmokingCessationEntity>> getSmokingCessationTimes();
  Future<List<SmokingEntity>> getSmokingTypes();
  Future<List<HealthPerceptionEntity>> getHealthPerceptions();
  Future<List<HospitalizationLocationEntity>> getHospitalizationLocations();
  Future<List<NicotineAmountEntity>> getNicotineAmounts();
  Future<List<RespiratoryFailureEntity>> getRespiratoryFailures();

  Future<PatientResponseEntity> postPatientData(PatientModel body);
  Future<AudioResponseEntity> postAudio(
      int patientId, String audioType, String audioPath);

  Future<UsersResponseEntity> getUsers({int page = 0});
  Future<GenericResponseEntity> postUser(NewUserBody body);
  Future<GenericResponseEntity> putUser(EditUserBody body, int id);
  Future<GenericResponseEntity> patchUser(int id, bool active);

  Future<GenericResponseEntity> postGender(String data);
  Future<GenericResponseEntity> deleteGender(int id);
  Future<GenericResponseEntity> postSmoker(String data);
  Future<GenericResponseEntity> deleteSmoker(int id);
  Future<GenericResponseEntity> postStudyLine(String data);
  Future<GenericResponseEntity> deleteStudyLine(int id);

  Future<GenericResponseEntity> postHospitalizationLocation(String data);
  Future<GenericResponseEntity> deleteHospitalizationLocation(int id);
  Future<GenericResponseEntity> postRespiratoryFailures(String data);
  Future<GenericResponseEntity> deleteRespiratoryFailures(int id);

  Future<GenericResponseEntity> postSmokingType(String data);
  Future<GenericResponseEntity> deleteSmokingType(int id);
  Future<GenericResponseEntity> postNicotineAmount(String data);
  Future<GenericResponseEntity> deleteNicotineAmount(int id);
  Future<GenericResponseEntity> postSmokingCessationTime(String data);
  Future<GenericResponseEntity> deleteSmokingCessationTime(int id);
  Future<GenericResponseEntity> postHealthPerception(String data);
  Future<GenericResponseEntity> deleteHealthPerception(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  Dio dio = Dio();

  static const String api = "https://spirabm.ime.usp.br/";

  Future<Dio> getDio() async {
    dio = Dio();
    dio.options.baseUrl = api;

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
      ));
    }
    return dio;
  }

  Future<Dio> getAuthenticatedDio() async {
    dio = await getDio();
    LoginResponseModel? loginResponseModel =
        await GetIt.I.get<LocalDataSource>().getFirstLoginResponse();
    dio.options.headers['Authorization'] =
        'Bearer ${loginResponseModel?.token.token}';
    return dio;
  }

  @override
  Future<LoginResponseEntity> postLogin(LoginBody body) async {
    try {
      Dio dio = await getDio();
      Response response = await dio.post("/auth/login", data: body.toJson());
      LoginResponseModel responseModel =
          LoginResponseModel.fromJson(response.data);
      await GetIt.I.get<LocalDataSource>().insertLoginResponse(responseModel);
      return responseModel.toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> postLogout() async {
    try {
      Dio dio = await getAuthenticatedDio();
      await dio.post("/auth/logout");
    } on DioException catch (_) {}
  }

  @override
  Future<List<ComorbidityEntity>> getComorbidities() async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.get("/comorbidities");
      ComorbiditiesResponseModel responseModel =
          ComorbiditiesResponseModel.fromJson(response.data);
      GetIt.I.get<LocalDataSource>().insertComorbidities(responseModel.data);
      return responseModel.toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<GenderEntity>> getGenders() async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.get("/genders");
      GendersResponseModel responseModel =
          GendersResponseModel.fromJson(response.data);
      GetIt.I.get<LocalDataSource>().insertGenders(responseModel.data);
      return responseModel.toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<HealthPerceptionEntity>> getHealthPerceptions() async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.get("/health-perceptions");
      HealthPerceptionsResponseModel responseModel =
          HealthPerceptionsResponseModel.fromJson(response.data);
      GetIt.I
          .get<LocalDataSource>()
          .insertHealthPerceptions(responseModel.data);
      return responseModel.toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<HospitalizationLocationEntity>>
      getHospitalizationLocations() async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.get("/hospitalization-sites");
      HospitalizationSitesResponseModel responseModel =
          HospitalizationSitesResponseModel.fromJson(response.data);
      GetIt.I
          .get<LocalDataSource>()
          .insertHospitalizationLocations(responseModel.data);
      return responseModel.toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<NicotineAmountEntity>> getNicotineAmounts() async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.get("/nicotine-quantities");
      NicotineQuantitiesResponseModel responseModel =
          NicotineQuantitiesResponseModel.fromJson(response.data);
      GetIt.I.get<LocalDataSource>().insertNicotineAmounts(responseModel.data);
      return responseModel.toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<RespiratoryFailureEntity>> getRespiratoryFailures() async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.get("/respiratory-insufficiencies");
      RespiratoryInsufficienciesResponseModel responseModel =
          RespiratoryInsufficienciesResponseModel.fromJson(response.data);
      GetIt.I
          .get<LocalDataSource>()
          .insertRespiratoryFailures(responseModel.data);
      return responseModel.toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<SmokerEntity>> getSmokers() async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.get("/smokers");
      SmokerStatusesResponseModel responseModel =
          SmokerStatusesResponseModel.fromJson(response.data);
      GetIt.I.get<LocalDataSource>().insertSmokers(responseModel.data);
      return responseModel.toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<SmokingCessationEntity>> getSmokingCessationTimes() async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.get("/cessation-times/valid");
      CessationTimesResponseModel responseModel =
          CessationTimesResponseModel.fromJson(response.data);
      GetIt.I
          .get<LocalDataSource>()
          .insertSmokingCessationTimes(responseModel.data);
      return responseModel.toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<SmokingEntity>> getSmokingTypes() async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.get("/cigarette-types");
      CigaretteTypesResponseModel responseModel =
          CigaretteTypesResponseModel.fromJson(response.data);
      GetIt.I.get<LocalDataSource>().insertSmokingTypes(responseModel.data);
      return responseModel.toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<LineOfStudyEntity>> getStudyLines() async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.get("/study-types");
      StudyTypesResponseModel responseModel =
          StudyTypesResponseModel.fromJson(response.data);
      GetIt.I.get<LocalDataSource>().insertStudyLines(responseModel.data);
      return responseModel.toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<PatientResponseEntity> postPatientData(PatientModel body) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.post("/patients", data: body.toBodyJson());
      PatientResponseModel responseModel =
          PatientResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      PatientResponseModel responseModel =
          PatientResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));

      return responseModel.toEntity();
    }
  }

  @override
  Future<AudioResponseEntity> postAudio(
      int patientId, String audioType, String audioPath) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.post("/patients/$patientId/audio",
          data: FormData.fromMap({
            "type": audioType,
            "file": await MultipartFile.fromFile(audioPath,
                filename: audioPath.split("/").last),
          }),
          options: Options(headers: {"Content-Type": "multipart/form-data"}));
      AudioResponseModel responseModel =
          AudioResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      AudioResponseModel responseModel =
          AudioResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<UsersResponseEntity> getUsers({int page = 0}) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.get("/user?page=$page");
      UsersResponseModel responseModel =
          UsersResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      UsersResponseModel responseModel =
          UsersResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> postUser(NewUserBody body) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.post("/user", data: body.toJson());
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> postGender(String data) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.post(
        "/genders",
        data: {"name": data},
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> putUser(EditUserBody body, int id) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.put("/user/$id", data: body.toJson());
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> postSmoker(String data) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.post(
        "/smokers",
        data: {"name": data},
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> patchUser(int id, bool active) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.patch("/user/$id/activate?active=$active");
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> postStudyLine(String data) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.post(
        "/study-types",
        data: {"name": data},
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> postHealthPerception(String data) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.post(
        "/health-perceptions",
        data: {"name": data},
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> postHospitalizationLocation(String data) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.post(
        "/hospitalization-sites",
        data: {"name": data},
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> postNicotineAmount(String data) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.post(
        "/nicotine-quantities",
        data: {"name": data},
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> postRespiratoryFailures(String data) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.post(
        "/respiratory-insufficiencies",
        data: {"name": data},
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> postSmokingCessationTime(String data) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.post(
        "/cessation-times",
        data: {"name": data},
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> postSmokingType(String data) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.post(
        "/cigarette-types",
        data: {"name": data},
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> deleteGender(int id) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.delete(
        "/genders/$id",
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> deleteSmoker(int id) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.delete(
        "/smokers/$id",
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> deleteStudyLine(int id) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.delete(
        "/study-types/$id",
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> deleteHealthPerception(int id) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.delete(
        "/health-perceptions/$id",
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> deleteHospitalizationLocation(int id) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.delete(
        "/hospitalization-sites/$id",
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> deleteNicotineAmount(int id) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.delete(
        "/nicotine-quantities/$id",
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> deleteRespiratoryFailures(int id) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.delete(
        "/respiratory-insufficiencies/$id",
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> deleteSmokingCessationTime(int id) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.delete(
        "/cessation-times/$id",
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }

  @override
  Future<GenericResponseEntity> deleteSmokingType(int id) async {
    try {
      Dio dio = await getAuthenticatedDio();
      Response response = await dio.delete(
        "/cigarette-types/$id",
      );
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(response.data);
      return responseModel.toEntity();
    } on DioException catch (e) {
      GenericResponseModel responseModel =
          GenericResponseModel.fromJson(e.response?.data);
      responseModel = responseModel.copyWith(
          authenticated: !(e.response?.statusCode == 400 &&
              responseModel.message == 'Not valid token'));
      return responseModel.toEntity();
    }
  }
}
