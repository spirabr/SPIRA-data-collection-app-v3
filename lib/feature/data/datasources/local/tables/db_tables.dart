import 'package:drift/drift.dart';

mixin AutoIncrementingPrimaryKey on Table {
  IntColumn get id => integer().autoIncrement()();
}

@DataClassName('User')
class Users extends Table with AutoIncrementingPrimaryKey {
  TextColumn get email => text()();
  TextColumn get fullName => text()();
  BoolColumn get active => boolean()();
}

@DataClassName('Role')
class Roles extends Table with AutoIncrementingPrimaryKey {
  IntColumn get userId =>
      integer().customConstraint('REFERENCES users(id) NOT NULL')();
  TextColumn get authority => text()();
}

@DataClassName('LoginResponse')
class LoginResponses extends Table with AutoIncrementingPrimaryKey {
  TextColumn get token => text()();
  IntColumn get userId =>
      integer().customConstraint('REFERENCES users(id) NOT NULL')();
}

@DataClassName('Gender')
class Genders extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Comorbidity')
class Comorbidities extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Smoker')
class Smokers extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('StudyLine')
class StudyLines extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SmokingCessationTime')
class SmokingCessationTimes extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SmokingType')
class SmokingTypes extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('HealthPerception')
class HealthPerceptions extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('HospitalizationLocation')
class HospitalizationLocations extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('NicotineAmount')
class NicotineAmounts extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('RespiratoryFailure')
class RespiratoryFailures extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Patient')
class Patients extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get synchronized => boolean()();
  TextColumn get collectionSite => text().nullable()();
  TextColumn get identifier => text().nullable()();
  TextColumn get otherComorbidities => text().nullable()();
  IntColumn get smokerId => integer().nullable()();
  IntColumn get genderId => integer().nullable()();
  RealColumn get weight => real().nullable()();
  RealColumn get height => real().nullable()();
  TextColumn get bloodPressure => text().nullable()();
  IntColumn get age => integer().nullable()();
  IntColumn get heartRate => integer().nullable()();
  IntColumn get respiratoryRate => integer().nullable()();
  RealColumn get saturation => real().nullable()();
  IntColumn get studyTypeId => integer().nullable()();
  IntColumn get collectorUserId => integer().nullable()();
  DateTimeColumn get collectionDate => dateTime().nullable()();

  // RespiratoryInsufficiency
  RealColumn get gasometryPaO2 => real().nullable()();
  RealColumn get gasometryPaCo2 => real().nullable()();
  RealColumn get gasometryPH => real().nullable()();
  IntColumn get hospitalizationDays => integer().nullable()();
  IntColumn get hospitalizationSiteId => integer().nullable()();
  IntColumn get respiratoryInsufficiencyTypeId => integer().nullable()();
  TextColumn get hemodynamicAssessment => text().nullable()();
  TextColumn get medicalDiagnosis => text().nullable()();

  // SmokingData
  IntColumn get cigaretteTypeId => integer().nullable()();
  RealColumn get carbonMonoxide => real().nullable()();
  RealColumn get tobaccoLoad => real().nullable()();
  RealColumn get tobaccoLoadTraditional => real().nullable()();
  RealColumn get tobaccoLoadVaping => real().nullable()();
  IntColumn get consumptionDurationYears => integer().nullable()();
  IntColumn get consumptionDurationMonths => integer().nullable()();
  IntColumn get nicotineQuantityId => integer().nullable()();
  IntColumn get consumptionDurationTraditionalYears => integer().nullable()();
  IntColumn get consumptionDurationTraditionalMonths => integer().nullable()();
  IntColumn get consumptionDurationVapingYears => integer().nullable()();
  IntColumn get consumptionDurationVapingMonths => integer().nullable()();
  IntColumn get cessationTimeTraditionalYears => integer().nullable()();
  IntColumn get cessationTimeTraditionalMonths => integer().nullable()();
  IntColumn get cessationTimeVapingYears => integer().nullable()();
  IntColumn get cessationTimeVapingMonths => integer().nullable()();
  IntColumn get participationWeek => integer().nullable()();
  IntColumn get cessationTimeId => integer().nullable()();
  IntColumn get healthPerceptionId => integer().nullable()();

  // Audios
  TextColumn get audioNoisePath => text().nullable()();
  BlobColumn get audioNoise => blob().nullable()();
  BoolColumn get audioNoiseSynchronized => boolean()();

  TextColumn get audioVocalPath => text().nullable()();
  BlobColumn get audioVocal => blob().nullable()();
  BoolColumn get audioVocalSynchronized => boolean()();

  TextColumn get audioSentencePath => text().nullable()();
  BlobColumn get audioSentence => blob().nullable()();
  BoolColumn get audioSentenceSynchronized => boolean()();

  TextColumn get audioNurseryRhymePath => text().nullable()();
  BlobColumn get audioNurseryRhyme => blob().nullable()();
  BoolColumn get audioNurseryRhymeSynchronized => boolean()();

  TextColumn get comorbidityIds => text().nullable()();
}
