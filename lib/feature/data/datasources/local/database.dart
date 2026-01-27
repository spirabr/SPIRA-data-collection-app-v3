import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:spira/feature/data/datasources/local/tables/db_tables.dart';
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
import 'package:spira/feature/data/model/response/role_model.dart';
import 'package:spira/feature/data/model/response/smoker_response_model.dart';
import 'package:spira/feature/data/model/response/study_type_response_model.dart';
import 'package:spira/feature/data/model/response/token_model.dart';
import 'package:spira/feature/data/model/response/user_model.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Users,
  LoginResponses,
  Roles,
  Genders,
  Comorbidities,
  Smokers,
  StudyLines,
  SmokingCessationTimes,
  SmokingTypes,
  HealthPerceptions,
  HospitalizationLocations,
  NicotineAmounts,
  RespiratoryFailures,
  Patients,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        /// Create all tables
        m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from == 1 && (to == 2 || to == 3)) {
          for (var table in allTables) {
            await m.deleteTable(table.actualTableName);
            await m.createTable(table);
          }
        }
        if (to == 4) {
          await m.createTable(patients);
        }
      },
    );
  }

  Future<int> insertUser(UsersCompanion user) =>
      into(users).insertOnConflictUpdate(user);
  Future<int> insertRole(RolesCompanion role) =>
      into(roles).insertOnConflictUpdate(role);
  Future<int> insertLoginResponse(LoginResponsesCompanion response) =>
      into(loginResponses).insertOnConflictUpdate(response);

  Future<User?> getUserById(int id) =>
      (select(users)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  Future<LoginResponse?> getLoginResponseByUserId(int userId) =>
      (select(loginResponses)..where((tbl) => tbl.userId.equals(userId)))
          .getSingleOrNull();

  Future<LoginResponseModel?> getLoginResponse(int userId) async {
    final query = select(loginResponses).join(
      [
        leftOuterJoin(users, users.id.equalsExp(loginResponses.userId)),
      ],
    )..where(loginResponses.userId.equals(userId));

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    final user = result.readTable(users);
    final response = result.readTable(loginResponses);

    return LoginResponseModel(
      success: true,
      message: 'Data retrieved successfully',
      token: TokenModel(token: response.token),
      user: UserModel.fromJson(user.toJson()),
    );
  }

  Future<LoginResponseModel?> getFirstLoginResponse() async {
    final query = select(loginResponses).join(
      [
        leftOuterJoin(users, users.id.equalsExp(loginResponses.userId)),
      ],
    )..limit(1);

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    final user = result.readTable(users);
    final response = result.readTable(loginResponses);

    // Fetch roles for the user
    final userRolesQuery = select(roles)
      ..where((role) => role.userId.equals(user.id));
    final userRoles = await userRolesQuery.get();

    return LoginResponseModel(
      success: true,
      message: 'Data retrieved successfully',
      token: TokenModel(token: response.token),
      user: UserModel.fromJson(user.toJson())
        ..roles =
            userRoles.map((role) => RoleModel.fromJson(role.toJson())).toList(),
    );
  }

  Future<void> deleteAllFromAuthTables() async {
    await (delete(roles)).go();
    await (delete(users)).go();
    await (delete(loginResponses)).go();
  }

  Future<void> insertGenders(List<GendersCompanion> gendersList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(genders, gendersList);
    });
  }

  Future<void> insertComorbidities(
      List<ComorbiditiesCompanion> comorbiditiesList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(comorbidities, comorbiditiesList);
    });
  }

  Future<void> insertSmokers(List<SmokersCompanion> smokersList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(smokers, smokersList);
    });
  }

  Future<void> insertStudyLines(
      List<StudyLinesCompanion> studyLinesList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(studyLines, studyLinesList);
    });
  }

  Future<void> insertSmokingCessationTimes(
      List<SmokingCessationTimesCompanion> cessationTimesList) async {
    await delete(smokingCessationTimes).go();

    await batch((batch) {
      batch.insertAllOnConflictUpdate(
          smokingCessationTimes, cessationTimesList);
    });
  }

  Future<void> insertSmokingTypes(
      List<SmokingTypesCompanion> smokingTypesList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(smokingTypes, smokingTypesList);
    });
  }

  Future<void> insertHealthPerceptions(
      List<HealthPerceptionsCompanion> perceptionsList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(healthPerceptions, perceptionsList);
    });
  }

  Future<void> insertHospitalizationLocations(
      List<HospitalizationLocationsCompanion> locationsList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(hospitalizationLocations, locationsList);
    });
  }

  Future<void> insertNicotineAmounts(
      List<NicotineAmountsCompanion> amountsList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(nicotineAmounts, amountsList);
    });
  }

  Future<void> insertRespiratoryFailures(
      List<RespiratoryFailuresCompanion> failuresList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(respiratoryFailures, failuresList);
    });
  }

  Future<List<ComorbidityModel>> getComorbidities() async {
    final query = select(comorbidities);
    final result = await query.get();
    return result.map((e) => ComorbidityModel.fromJson(e.toJson())).toList();
  }

  Future<List<GenderModel>> getGenders() async {
    final query = select(genders);
    final result = await query.get();
    return result.map((e) => GenderModel.fromJson(e.toJson())).toList();
  }

  Future<List<HealthPerceptionModel>> getHealthPerceptions() async {
    final query = select(healthPerceptions);
    final result = await query.get();
    return result
        .map((e) => HealthPerceptionModel.fromJson(e.toJson()))
        .toList();
  }

  Future<List<HospitalizationSiteModel>> getHospitalizationLocations() async {
    final query = select(hospitalizationLocations);
    final result = await query.get();
    return result
        .map((e) => HospitalizationSiteModel.fromJson(e.toJson()))
        .toList();
  }

  Future<List<NicotineQuantityModel>> getNicotineAmounts() async {
    final query = select(nicotineAmounts);
    final result = await query.get();
    return result
        .map((e) => NicotineQuantityModel.fromJson(e.toJson()))
        .toList();
  }

  Future<List<RespiratoryInsufficiencyModel>> getRespiratoryFailures() async {
    final query = select(respiratoryFailures);
    final result = await query.get();
    return result
        .map((e) => RespiratoryInsufficiencyModel.fromJson(e.toJson()))
        .toList();
  }

  Future<List<SmokerStatusModel>> getSmokers() async {
    final query = select(smokers);
    final result = await query.get();
    return result.map((e) => SmokerStatusModel.fromJson(e.toJson())).toList();
  }

  Future<List<CessationTimeModel>> getSmokingCessationTimes() async {
    final query = select(smokingCessationTimes);
    final result = await query.get();
    return result.map((e) => CessationTimeModel.fromJson(e.toJson())).toList();
  }

  Future<List<CigaretteTypeModel>> getSmokingTypes() async {
    final query = select(smokingTypes);
    final result = await query.get();
    return result.map((e) => CigaretteTypeModel.fromJson(e.toJson())).toList();
  }

  Future<List<StudyTypeModel>> getStudyLines() async {
    final query = select(studyLines);
    final result = await query.get();
    return result.map((e) => StudyTypeModel.fromJson(e.toJson())).toList();
  }

  Future<void> deleteAllFromCollectionFieldTables() async {
    await (delete(comorbidities)).go();
    await (delete(genders)).go();
    await (delete(healthPerceptions)).go();
    await (delete(hospitalizationLocations)).go();
    await (delete(nicotineAmounts)).go();
    await (delete(respiratoryFailures)).go();
    await (delete(smokers)).go();
    await (delete(smokingCessationTimes)).go();
    await (delete(smokingTypes)).go();
    await (delete(studyLines)).go();
  }

  Future<int> insertPatient(PatientsCompanion patient) =>
      into(patients).insertOnConflictUpdate(patient);

  Future<bool> updatePatient(PatientsCompanion patient) =>
      update(patients).replace(patient);

  Future<List<PatientModel>> getUnsynchronizedPatients() async {
    final query = select(patients)
      ..where((tbl) =>
          tbl.synchronized.equals(false) |
          tbl.audioNoiseSynchronized.equals(false) |
          (tbl.audioVocalSynchronized.equals(false) &
              tbl.audioVocalPath.isNotNull()) |
          tbl.audioSentenceSynchronized.equals(false) |
          tbl.audioNurseryRhymeSynchronized.equals(false));
    final result = await query.get();
    return result.map((e) => PatientModel.fromJsonDb(e.toJson())).toList();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase(file);
  });
}
