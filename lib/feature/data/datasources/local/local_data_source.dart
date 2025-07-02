import 'package:drift/drift.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:spira/feature/core/converter_utils.dart';
import 'package:spira/feature/data/datasources/local/database.dart';
import 'package:spira/feature/data/model/request/patient_model.dart';
import 'package:spira/feature/data/model/response/cessation_time_response_model.dart';
import 'package:spira/feature/data/model/response/cigarette_type_response_model.dart';
import 'package:spira/feature/data/model/response/comorbidity_response_model.dart';
import 'package:spira/feature/data/model/response/gender_response_model.dart';
import 'package:spira/feature/data/model/response/health_perception_response_model.dart';
import 'package:spira/feature/data/model/response/hospitalization_site_response_model.dart';
import 'package:spira/feature/data/model/response/login_response_model.dart';
import 'package:spira/feature/data/model/response/nicotine_quantity_response_model.dart';
import 'package:spira/feature/data/model/response/respiratory_insufficency_response_model.dart';
import 'package:spira/feature/data/model/response/smoker_response_model.dart';
import 'package:spira/feature/data/model/response/study_type_response_model.dart';
import 'package:spira/feature/domain/entities/comorbidity_entity.dart';
import 'package:spira/feature/domain/entities/gender_entity.dart';
import 'package:spira/feature/domain/entities/health_perception_entity.dart';
import 'package:spira/feature/domain/entities/hospitalization_location_entity.dart';
import 'package:spira/feature/domain/entities/line_of_study_entity.dart';
import 'package:spira/feature/domain/entities/nicotine_amount_entity.dart';
import 'package:spira/feature/domain/entities/recorder_audio_entity.dart';
import 'package:spira/feature/domain/entities/respiratory_failure_entity.dart';
import 'package:spira/feature/domain/entities/smoker_entity.dart';
import 'package:spira/feature/domain/entities/smoking_cessation_entity.dart';
import 'package:spira/feature/domain/entities/smoking_entity.dart';

abstract class LocalDataSource {
  Future<void> insertLoginResponse(LoginResponseModel loginResponse);
  Future<LoginResponseModel?> getLoginResponse(int userId);
  Future<LoginResponseModel?> getFirstLoginResponse();
  Future deleteAllFromAuthTables();
  Future deleteAllFromCollectionFieldTables();

  Future<void> insertGenders(List<GenderModel> gendersList);
  Future<void> insertComorbidities(List<ComorbidityModel> comorbiditiesList);
  Future<void> insertSmokers(List<SmokerStatusModel> smokersList);
  Future<void> insertStudyLines(List<StudyTypeModel> studyLinesList);
  Future<void> insertSmokingCessationTimes(
      List<CessationTimeModel> cessationTimesList);
  Future<void> insertSmokingTypes(List<CigaretteTypeModel> smokingTypesList);
  Future<void> insertHealthPerceptions(
      List<HealthPerceptionModel> perceptionsList);
  Future<void> insertHospitalizationLocations(
      List<HospitalizationSiteModel> locationsList);
  Future<void> insertNicotineAmounts(List<NicotineQuantityModel> amountsList);
  Future<void> insertRespiratoryFailures(
      List<RespiratoryInsufficiencyModel> failuresList);

  Future<List<GenderEntity>> getGenders();
  Future<List<ComorbidityEntity>> getComorbidities();
  Future<List<SmokerEntity>> getSmokers();
  Future<List<LineOfStudyEntity>> getStudyLines();
  Future<List<HospitalizationLocationEntity>> getHospitalizationLocations();
  Future<List<RespiratoryFailureEntity>> getRespiratoryFailures();
  Future<List<SmokingEntity>> getSmokingTypes();
  Future<List<NicotineAmountEntity>> getNicotineAmounts();
  Future<List<SmokingCessationEntity>> getSmokingCessationTimes();
  Future<List<HealthPerceptionEntity>> getHealthPerceptions();

  Future<int> insertPatient(
      PatientModel patient,
      bool synchronized,
      RecordedAudioEntity ambientNoise,
      bool ambientNoiseSynchronized,
      RecordedAudioEntity vocal,
      bool vocalSynchronized,
      RecordedAudioEntity? sentence,
      bool sentenceSynchronized,
      RecordedAudioEntity nurseryRhyme,
      bool nurseryRhymeSynchronized);
  Future<bool> updatePatient(PatientModel patient);
  Future<bool> updatePatientAudios(
      PatientModel patient,
      bool synchronized,
      RecordedAudioEntity ambientNoise,
      bool ambientNoiseSynchronized,
      RecordedAudioEntity vocal,
      bool vocalSynchronized,
      RecordedAudioEntity? sentence,
      bool sentenceSynchronized,
      RecordedAudioEntity nurseryRhyme,
      bool nurseryRhymeSynchronized);
  Future<List<PatientModel>> getUnsynchronizedPatients();
}

class LocalDataSourceImpl implements LocalDataSource {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final AppDatabase database;

  LocalDataSourceImpl({required this.database});

  @override
  Future<void> insertLoginResponse(LoginResponseModel loginResponse) async {
    final userId = await database.insertUser(UsersCompanion(
      id: Value(loginResponse.user.id),
      email: Value(loginResponse.user.email),
      fullName: Value(loginResponse.user.fullName),
      active: Value(loginResponse.user.active),
    ));
    for (var role in loginResponse.user.roles) {
      await database.insertRole(RolesCompanion(
        id: Value(role.id),
        userId: Value(userId),
        authority: Value(role.authority),
      ));
    }
    await database.insertLoginResponse(LoginResponsesCompanion(
      token: Value(loginResponse.token.token),
      userId: Value(userId),
    ));
  }

  @override
  Future<LoginResponseModel?> getLoginResponse(int userId) async {
    final response = await database.getLoginResponse(userId);
    return response;
  }

  @override
  Future deleteAllFromAuthTables() async {
    await database.deleteAllFromAuthTables();
  }

  @override
  Future<LoginResponseModel?> getFirstLoginResponse() async {
    final response = await database.getFirstLoginResponse();
    return response;
  }

  @override
  Future<void> insertComorbidities(
      List<ComorbidityModel> comorbiditiesList) async {
    await database.insertComorbidities(comorbiditiesList
        .map((e) => ComorbiditiesCompanion(
              id: Value(e.id),
              name: Value(e.name),
            ))
        .toList());
  }

  @override
  Future<void> insertGenders(List<GenderModel> gendersList) async {
    await database.insertGenders(gendersList
        .map((e) => GendersCompanion(
              id: Value(e.id),
              name: Value(e.gender),
            ))
        .toList());
  }

  @override
  Future<void> insertHealthPerceptions(
      List<HealthPerceptionModel> perceptionsList) async {
    await database.insertHealthPerceptions(perceptionsList
        .map((e) => HealthPerceptionsCompanion(
              id: Value(e.id),
              name: Value(e.perception),
            ))
        .toList());
  }

  @override
  Future<void> insertHospitalizationLocations(
      List<HospitalizationSiteModel> locationsList) async {
    await database.insertHospitalizationLocations(locationsList
        .map((e) => HospitalizationLocationsCompanion(
              id: Value(e.id),
              name: Value(e.site),
            ))
        .toList());
  }

  @override
  Future<void> insertNicotineAmounts(
      List<NicotineQuantityModel> amountsList) async {
    await database.insertNicotineAmounts(amountsList
        .map((e) => NicotineAmountsCompanion(
              id: Value(e.id),
              name: Value(e.amount),
            ))
        .toList());
  }

  @override
  Future<void> insertRespiratoryFailures(
      List<RespiratoryInsufficiencyModel> failuresList) async {
    await database.insertRespiratoryFailures(failuresList
        .map((e) => RespiratoryFailuresCompanion(
              id: Value(e.id),
              name: Value(e.type),
            ))
        .toList());
  }

  @override
  Future<void> insertSmokers(List<SmokerStatusModel> smokersList) async {
    await database.insertSmokers(smokersList
        .map((e) => SmokersCompanion(
              id: Value(e.id),
              name: Value(e.status),
            ))
        .toList());
  }

  @override
  Future<void> insertSmokingCessationTimes(
      List<CessationTimeModel> cessationTimesList) async {
    await database.insertSmokingCessationTimes(cessationTimesList
        .map((e) => SmokingCessationTimesCompanion(
              id: Value(e.id),
              name: Value(e.time),
            ))
        .toList());
  }

  @override
  Future<void> insertSmokingTypes(
      List<CigaretteTypeModel> smokingTypesList) async {
    await database.insertSmokingTypes(smokingTypesList
        .map((e) => SmokingTypesCompanion(
              id: Value(e.id),
              name: Value(e.type),
            ))
        .toList());
  }

  @override
  Future<void> insertStudyLines(List<StudyTypeModel> studyLinesList) async {
    await database.insertStudyLines(studyLinesList
        .map((e) => StudyLinesCompanion(
              id: Value(e.id),
              name: Value(e.name),
            ))
        .toList());
  }

  @override
  Future deleteAllFromCollectionFieldTables() async {
    await database.deleteAllFromCollectionFieldTables();
  }

  @override
  Future<List<ComorbidityEntity>> getComorbidities() async {
    final list = await database.getComorbidities();
    return list.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<GenderEntity>> getGenders() async {
    final list = await database.getGenders();
    return list.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<HealthPerceptionEntity>> getHealthPerceptions() async {
    final list = await database.getHealthPerceptions();
    return list.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<HospitalizationLocationEntity>>
      getHospitalizationLocations() async {
    final list = await database.getHospitalizationLocations();
    return list.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<NicotineAmountEntity>> getNicotineAmounts() async {
    final list = await database.getNicotineAmounts();
    return list.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<RespiratoryFailureEntity>> getRespiratoryFailures() async {
    final list = await database.getRespiratoryFailures();
    return list.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<SmokerEntity>> getSmokers() async {
    final list = await database.getSmokers();
    return list.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<SmokingCessationEntity>> getSmokingCessationTimes() async {
    final list = await database.getSmokingCessationTimes();
    return list.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<SmokingEntity>> getSmokingTypes() async {
    final list = await database.getSmokingTypes();
    return list.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<LineOfStudyEntity>> getStudyLines() async {
    final list = await database.getStudyLines();
    return list.map((e) => e.toEntity()).toList();
  }

  @override
  Future<int> insertPatient(
      PatientModel patient,
      bool synchronized,
      RecordedAudioEntity ambientNoise,
      bool ambientNoiseSynchronized,
      RecordedAudioEntity vocal,
      bool vocalSynchronized,
      RecordedAudioEntity? sentence,
      bool sentenceSynchronized,
      RecordedAudioEntity nurseryRhyme,
      bool nurseryRhymeSynchronized) async {
    PatientsCompanion patientCompanion = patient.toCompanion().copyWith(
          synchronized: Value(synchronized),
          audioNoisePath: Value(ambientNoise.path),
          audioNoise:
              Value(await ConverterUtils.wavToUint8List(ambientNoise.path)),
          audioNoiseSynchronized: Value(ambientNoiseSynchronized),
          audioVocalPath: Value(vocal.path),
          audioVocal: Value(await ConverterUtils.wavToUint8List(vocal.path)),
          audioVocalSynchronized: Value(vocalSynchronized),
          audioSentencePath:
              sentence != null ? Value(sentence.path) : const Value.absent(),
          audioSentence: sentence != null
              ? Value(await ConverterUtils.wavToUint8List(sentence.path))
              : const Value.absent(),
          audioSentenceSynchronized: Value(sentenceSynchronized),
          audioNurseryRhymePath: Value(nurseryRhyme.path),
          audioNurseryRhyme:
              Value(await ConverterUtils.wavToUint8List(nurseryRhyme.path)),
          audioNurseryRhymeSynchronized: Value(nurseryRhymeSynchronized),
        );
    return await database.insertPatient(patientCompanion);
  }

  @override
  Future<bool> updatePatient(PatientModel patient) async {
    PatientsCompanion patientCompanion = patient.toCompanion().copyWith(
          synchronized: Value(patient.synchronized!),
          audioNoisePath: Value(patient.audioNoisePath),
          audioNoise: Value(
              await ConverterUtils.wavToUint8List(patient.audioNoisePath!)),
          audioNoiseSynchronized: Value(patient.audioNoiseSynchronized!),
          audioVocalPath: Value(patient.audioVocalPath),
          audioVocal: Value(
              await ConverterUtils.wavToUint8List(patient.audioVocalPath!)),
          audioVocalSynchronized: Value(patient.audioVocalSynchronized!),
          audioSentencePath: patient.audioSentencePath != null
              ? Value(patient.audioSentencePath)
              : const Value.absent(),
          audioSentence: patient.audioSentencePath != null
              ? Value(await ConverterUtils.wavToUint8List(
                  patient.audioSentencePath!))
              : const Value.absent(),
          audioSentenceSynchronized: Value(patient.audioSentenceSynchronized!),
          audioNurseryRhymePath: Value(patient.audioNurseryRhymePath),
          audioNurseryRhyme: Value(await ConverterUtils.wavToUint8List(
              patient.audioNurseryRhymePath!)),
          audioNurseryRhymeSynchronized:
              Value(patient.audioNurseryRhymeSynchronized!),
        );

    return await database.updatePatient(patientCompanion);
  }

  @override
  Future<bool> updatePatientAudios(
      PatientModel patient,
      bool synchronized,
      RecordedAudioEntity ambientNoise,
      bool ambientNoiseSynchronized,
      RecordedAudioEntity vocal,
      bool vocalSynchronized,
      RecordedAudioEntity? sentence,
      bool sentenceSynchronized,
      RecordedAudioEntity nurseryRhyme,
      bool nurseryRhymeSynchronized) async {
    PatientsCompanion patientCompanion = patient.toCompanion().copyWith(
          synchronized: Value(synchronized),
          audioNoisePath: Value(ambientNoise.path),
          audioNoise:
              Value(await ConverterUtils.wavToUint8List(ambientNoise.path)),
          audioNoiseSynchronized: Value(ambientNoiseSynchronized),
          audioVocalPath: Value(vocal.path),
          audioVocal: Value(await ConverterUtils.wavToUint8List(vocal.path)),
          audioVocalSynchronized: Value(vocalSynchronized),
          audioSentencePath:
              sentence != null ? Value(sentence.path) : const Value.absent(),
          audioSentence: sentence != null
              ? Value(await ConverterUtils.wavToUint8List(sentence.path))
              : const Value.absent(),
          audioSentenceSynchronized: sentence != null
              ? Value(sentenceSynchronized)
              : const Value.absent(),
          audioNurseryRhymePath: Value(nurseryRhyme.path),
          audioNurseryRhyme:
              Value(await ConverterUtils.wavToUint8List(nurseryRhyme.path)),
          audioNurseryRhymeSynchronized: Value(nurseryRhymeSynchronized),
        );
    return await database.updatePatient(patientCompanion);
  }

  @override
  Future<List<PatientModel>> getUnsynchronizedPatients() async {
    return database.getUnsynchronizedPatients();
  }
}
