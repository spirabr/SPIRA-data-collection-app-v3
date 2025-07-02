import 'package:drift/drift.dart';
import 'package:spira/feature/data/datasources/local/database.dart';
import 'package:spira/feature/domain/entities/patient_entity.dart';

class PatientModel {
  int? id;
  bool? synchronized;
  String? collectionSite;
  String? identifier;
  String? otherComorbidities;
  int? smokerId;
  int? genderId;
  double? weight;
  double? height;
  String? bloodPressure;
  int? age;
  int? heartRate;
  int? respiratoryRate;
  double? saturation;
  int? studyTypeId;
  int? collectorUserId;
  DateTime? collectionDate;
  RespiratoryInsufficiency? respiratoryInsufficiency;
  SmokingData? smokingData;
  dynamic audioNoise;
  dynamic audioVocal;
  dynamic audioSentence;
  dynamic audioNurseryRhyme;
  String? audioNoisePath;
  String? audioVocalPath;
  String? audioSentencePath;
  String? audioNurseryRhymePath;
  bool? audioNoiseSynchronized;
  bool? audioVocalSynchronized;
  bool? audioSentenceSynchronized;
  bool? audioNurseryRhymeSynchronized;
  List<int>? comorbidityIds;

  PatientModel({
    this.id,
    this.synchronized,
    this.collectionSite,
    this.identifier,
    this.otherComorbidities,
    this.smokerId,
    this.genderId,
    this.weight,
    this.height,
    this.bloodPressure,
    this.age,
    this.heartRate,
    this.respiratoryRate,
    this.saturation,
    this.studyTypeId,
    this.collectorUserId,
    this.collectionDate,
    this.respiratoryInsufficiency,
    this.smokingData,
    this.audioNoise,
    this.audioVocal,
    this.audioSentence,
    this.audioNurseryRhyme,
    this.audioNoisePath,
    this.audioVocalPath,
    this.audioSentencePath,
    this.audioNurseryRhymePath,
    this.audioNoiseSynchronized,
    this.audioVocalSynchronized,
    this.audioSentenceSynchronized,
    this.audioNurseryRhymeSynchronized,
    this.comorbidityIds,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      collectionSite: json['collectionSite'],
      identifier: json['identifier'],
      otherComorbidities: json['otherComorbidities'],
      smokerId: json['smokerId'],
      genderId: json['genderId'],
      weight: json['weight'],
      height: json['height'],
      bloodPressure: json['bloodPressure'],
      age: json['age'],
      heartRate: json['heartRate'],
      respiratoryRate: json['respiratoryRate'],
      saturation: json['saturation'],
      studyTypeId: json['studyTypeId'],
      collectorUserId: json['collectorUserId'],
      collectionDate: json['collectionDate'] != null
          ? DateTime.parse(json['collectionDate'])
          : null,
      respiratoryInsufficiency: json['respiratoryInsufficiency'] != null
          ? RespiratoryInsufficiency.fromJson(json['respiratoryInsufficiency'])
          : null,
      smokingData: json['smokingData'] != null
          ? SmokingData.fromJson(json['smokingData'])
          : null,
      audioNoise: json['audioNoise'],
      audioVocal: json['audioVocal'],
      audioSentence: json['audioSentence'],
      audioNurseryRhyme: json['audioNurseryRhyme'],
      comorbidityIds: json['comorbidityIds'] != null
          ? List<int>.from(json['comorbidityIds'])
          : null,
    );
  }

  factory PatientModel.fromJsonDb(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      synchronized: json['synchronized'],
      collectionSite: json['collectionSite'],
      identifier: json['identifier'],
      otherComorbidities: json['otherComorbidities'],
      smokerId: json['smokerId'],
      genderId: json['genderId'],
      weight: json['weight'],
      height: json['height'],
      bloodPressure: json['bloodPressure'],
      age: json['age'],
      heartRate: json['heartRate'],
      respiratoryRate: json['respiratoryRate'],
      saturation: json['saturation'],
      studyTypeId: json['studyTypeId'],
      collectorUserId: json['collectorUserId'],
      collectionDate: json['collectionDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['collectionDate'] as int)
          : null,
      respiratoryInsufficiency: json['studyTypeId'] == 2
          ? RespiratoryInsufficiency(
              gasometryPaO2: json['gasometryPaO2'],
              gasometryPaCo2: json['gasometryPaCo2'],
              gasometryPH: json['gasometryPH'],
              hospitalizationDays: json['hospitalizationDays'],
              hospitalizationSiteId: json['hospitalizationSiteId'],
              respiratoryInsufficiencyTypeId:
                  json['respiratoryInsufficiencyTypeId'],
              hemodynamicAssessment: json['hemodynamicAssessment'],
              medicalDiagnosis: json['medicalDiagnosis'])
          : null,
      smokingData: json['studyTypeId'] == 1 ||
              json['studyTypeId'] == 3 ||
              json['studyTypeId'] == 4
          ? SmokingData(
              cigaretteTypeId: json['cigaretteTypeId'],
              carbonMonoxide: json['carbonMonoxide'],
              tobaccoLoad: json['tobaccoLoad'],
              tobaccoLoadTraditional: json['tobaccoLoadTraditional'],
              tobaccoLoadVaping: json['tobaccoLoadVaping'],
              consumptionDurationYears: json['consumptionDurationYears'],
              consumptionDurationMonths: json['consumptionDurationMonths'],
              nicotineQuantityId: json['nicotineQuantityId'],
              consumptionDurationTraditionalYears:
                  json['consumptionDurationTraditionalYears'],
              consumptionDurationTraditionalMonths:
                  json['consumptionDurationTraditionalMonths'],
              consumptionDurationVapingYears:
                  json['consumptionDurationVapingYears'],
              consumptionDurationVapingMonths:
                  json['consumptionDurationVapingMonths'],
              cessationTimeTraditionalYears:
                  json['cessationTimeTraditionalYears'],
              cessationTimeTraditionalMonths:
                  json['cessationTimeTraditionalMonths'],
              cessationTimeVapingYears:
                  json['cessationTimeVapingYears'],
              cessationTimeVapingMonths:
                  json['cessationTimeVapingMonths'],
              participationWeek: json['participationWeek'],
              cessationTimeId: json['cessationTimeId'],
              healthPerceptionId: json['healthPerceptionId'])
          : null,
      audioNoise: json['audioNoise'],
      audioVocal: json['audioVocal'],
      audioSentence: json['audioSentence'],
      audioNurseryRhyme: json['audioNurseryRhyme'],
      audioNoisePath: json['audioNoisePath'],
      audioVocalPath: json['audioVocalPath'],
      audioSentencePath: json['audioSentencePath'],
      audioNurseryRhymePath: json['audioNurseryRhymePath'],
      audioNoiseSynchronized: json['audioNoiseSynchronized'],
      audioVocalSynchronized: json['audioVocalSynchronized'],
      audioSentenceSynchronized: json['audioSentenceSynchronized'],
      audioNurseryRhymeSynchronized: json['audioNurseryRhymeSynchronized'],
      comorbidityIds:
          json['comorbidityIds'] != null && json['comorbidityIds'] != ''
              ? List<int>.from(
                  json['comorbidityIds'].split(',').map((e) => int.parse(e)))
              : null,
    );
  }

  Map<String, dynamic> toBodyJson() {
    return {
      'collectionSite': collectionSite,
      'identifier': identifier,
      'otherComorbidities': otherComorbidities,
      'smokerId': smokerId,
      'genderId': genderId,
      'weight': weight,
      'height': height,
      'bloodPressure': bloodPressure,
      'age': age,
      'heartRate': heartRate,
      'respiratoryRate': respiratoryRate,
      'saturation': saturation,
      'studyTypeId': studyTypeId,
      'collectorUserId': collectorUserId,
      'collectionDate': collectionDate?.toIso8601String(),
      'respiratoryInsufficiency': respiratoryInsufficiency?.toJson(),
      'smokingData': smokingData?.toJson(),
      'comorbidityIds': comorbidityIds,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'collectionSite': collectionSite,
      'identifier': identifier,
      'otherComorbidities': otherComorbidities,
      'smokerId': smokerId,
      'genderId': genderId,
      'weight': weight,
      'height': height,
      'bloodPressure': bloodPressure,
      'age': age,
      'heartRate': heartRate,
      'respiratoryRate': respiratoryRate,
      'saturation': saturation,
      'studyTypeId': studyTypeId,
      'collectorUserId': collectorUserId,
      'collectionDate': collectionDate?.toIso8601String(),
      'respiratoryInsufficiency': respiratoryInsufficiency?.toJson(),
      'smokingData': smokingData?.toJson(),
      'audioNoise': audioNoise,
      'audioVocal': audioVocal,
      'audioSentence': audioSentence,
      'audioNurseryRhyme': audioNurseryRhyme,
      'comorbidityIds': comorbidityIds,
    };
  }

  PatientEntity toEntity() {
    return PatientEntity(
      id: id,
      collectionSite: collectionSite,
      identifier: identifier,
      otherComorbidities: otherComorbidities,
      smokerId: smokerId,
      genderId: genderId,
      weight: weight,
      height: height,
      bloodPressure: bloodPressure,
      age: age,
      heartRate: heartRate,
      respiratoryRate: respiratoryRate,
      saturation: saturation,
      studyTypeId: studyTypeId,
      collectorUserId: collectorUserId,
      collectionDate: collectionDate,
      respiratoryInsufficiency: respiratoryInsufficiency?.toEntity(),
      smokingData: smokingData?.toEntity(),
      audioNoise: audioNoise,
      audioVocal: audioVocal,
      audioSentence: audioSentence,
      audioNurseryRhyme: audioNurseryRhyme,
      comorbidityIds: comorbidityIds,
    );
  }

  factory PatientModel.fromEntity(PatientEntity entity) {
    return PatientModel(
      id: entity.id,
      collectionSite: entity.collectionSite,
      identifier: entity.identifier,
      otherComorbidities: entity.otherComorbidities,
      smokerId: entity.smokerId,
      genderId: entity.genderId,
      weight: entity.weight,
      height: entity.height,
      bloodPressure: entity.bloodPressure,
      age: entity.age,
      heartRate: entity.heartRate,
      respiratoryRate: entity.respiratoryRate,
      saturation: entity.saturation,
      studyTypeId: entity.studyTypeId,
      collectorUserId: entity.collectorUserId,
      collectionDate: entity.collectionDate,
      respiratoryInsufficiency: entity.respiratoryInsufficiency?.toModel(),
      smokingData: entity.smokingData?.toModel(),
      audioNoise: entity.audioNoise,
      audioVocal: entity.audioVocal,
      audioSentence: entity.audioSentence,
      audioNurseryRhyme: entity.audioNurseryRhyme,
      comorbidityIds: entity.comorbidityIds,
    );
  }

  PatientsCompanion toCompanion() {
    return PatientsCompanion(
      id: id != null ? Value(id!) : const Value.absent(),
      collectionSite: Value(collectionSite),
      identifier: Value(identifier),
      otherComorbidities: Value(otherComorbidities),
      smokerId: Value(smokerId),
      genderId: Value(genderId),
      weight: Value(weight),
      height: Value(height),
      bloodPressure: Value(bloodPressure),
      age: Value(age),
      heartRate: Value(heartRate),
      respiratoryRate: Value(respiratoryRate),
      saturation: Value(saturation),
      studyTypeId: Value(studyTypeId),
      collectorUserId: Value(collectorUserId),
      collectionDate: Value(collectionDate),
      gasometryPaCo2: Value(respiratoryInsufficiency?.gasometryPaCo2),
      gasometryPaO2: Value(respiratoryInsufficiency?.gasometryPaO2),
      gasometryPH: Value(respiratoryInsufficiency?.gasometryPH),
      hospitalizationDays: Value(respiratoryInsufficiency?.hospitalizationDays),
      hospitalizationSiteId:
          Value(respiratoryInsufficiency?.hospitalizationSiteId),
      respiratoryInsufficiencyTypeId:
          Value(respiratoryInsufficiency?.respiratoryInsufficiencyTypeId),
      hemodynamicAssessment:
          Value(respiratoryInsufficiency?.hemodynamicAssessment),
      medicalDiagnosis: Value(respiratoryInsufficiency?.medicalDiagnosis),
      cigaretteTypeId: Value(smokingData?.cigaretteTypeId),
      carbonMonoxide: Value(smokingData?.carbonMonoxide),
      tobaccoLoad: Value(smokingData?.tobaccoLoad),
      tobaccoLoadTraditional: Value(smokingData?.tobaccoLoadTraditional),
      tobaccoLoadVaping: Value(smokingData?.tobaccoLoadVaping),
      consumptionDurationYears: Value(smokingData?.consumptionDurationYears),
      consumptionDurationMonths: Value(smokingData?.consumptionDurationMonths),
      nicotineQuantityId: Value(smokingData?.nicotineQuantityId),
      consumptionDurationTraditionalYears:
          Value(smokingData?.consumptionDurationTraditionalYears),
      consumptionDurationTraditionalMonths:
          Value(smokingData?.consumptionDurationTraditionalMonths),
      consumptionDurationVapingYears:
          Value(smokingData?.consumptionDurationVapingYears),
      consumptionDurationVapingMonths:
          Value(smokingData?.consumptionDurationVapingMonths),
      cessationTimeTraditionalYears:
          Value(smokingData?.cessationTimeTraditionalYears),
      cessationTimeTraditionalMonths:
          Value(smokingData?.cessationTimeTraditionalMonths),
      cessationTimeVapingYears:
          Value(smokingData?.cessationTimeVapingYears),
      cessationTimeVapingMonths:
          Value(smokingData?.cessationTimeVapingMonths),
      participationWeek: Value(smokingData?.participationWeek),
      cessationTimeId: Value(smokingData?.cessationTimeId),
      healthPerceptionId: Value(smokingData?.healthPerceptionId),
      comorbidityIds: Value(comorbidityIds?.join(',')),
    );
  }

  PatientModel copyWith({
    int? id,
    bool? synchronized,
    String? collectionSite,
    String? identifier,
    String? otherComorbidities,
    int? smokerId,
    int? genderId,
    double? weight,
    double? height,
    String? bloodPressure,
    int? age,
    int? heartRate,
    int? respiratoryRate,
    double? saturation,
    int? studyTypeId,
    int? collectorUserId,
    DateTime? collectionDate,
    RespiratoryInsufficiency? respiratoryInsufficiency,
    SmokingData? smokingData,
    dynamic audioNoise,
    dynamic audioVocal,
    dynamic audioSentence,
    dynamic audioNurseryRhyme,
    String? audioNoisePath,
    String? audioVocalPath,
    String? audioSentencePath,
    String? audioNurseryRhymePath,
    bool? audioNoiseSynchronized,
    bool? audioVocalSynchronized,
    bool? audioSentenceSynchronized,
    bool? audioNurseryRhymeSynchronized,
    List<int>? comorbidityIds,
  }) {
    return PatientModel(
      id: id ?? this.id,
      synchronized: synchronized ?? this.synchronized,
      collectionSite: collectionSite ?? this.collectionSite,
      identifier: identifier ?? this.identifier,
      otherComorbidities: otherComorbidities ?? this.otherComorbidities,
      smokerId: smokerId ?? this.smokerId,
      genderId: genderId ?? this.genderId,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      age: age ?? this.age,
      heartRate: heartRate ?? this.heartRate,
      respiratoryRate: respiratoryRate ?? this.respiratoryRate,
      saturation: saturation ?? this.saturation,
      studyTypeId: studyTypeId ?? this.studyTypeId,
      collectorUserId: collectorUserId ?? this.collectorUserId,
      collectionDate: collectionDate ?? this.collectionDate,
      respiratoryInsufficiency:
          respiratoryInsufficiency ?? this.respiratoryInsufficiency,
      smokingData: smokingData ?? this.smokingData,
      audioNoise: audioNoise ?? this.audioNoise,
      audioVocal: audioVocal ?? this.audioVocal,
      audioSentence: audioSentence ?? this.audioSentence,
      audioNurseryRhyme: audioNurseryRhyme ?? this.audioNurseryRhyme,
      audioNoisePath: audioNoisePath ?? this.audioNoisePath,
      audioVocalPath: audioVocalPath ?? this.audioVocalPath,
      audioSentencePath: audioSentencePath ?? this.audioSentencePath,
      audioNurseryRhymePath:
          audioNurseryRhymePath ?? this.audioNurseryRhymePath,
      audioNoiseSynchronized:
          audioNoiseSynchronized ?? this.audioNoiseSynchronized,
      audioVocalSynchronized:
          audioVocalSynchronized ?? this.audioVocalSynchronized,
      audioSentenceSynchronized:
          audioSentenceSynchronized ?? this.audioSentenceSynchronized,
      audioNurseryRhymeSynchronized:
          audioNurseryRhymeSynchronized ?? this.audioNurseryRhymeSynchronized,
      comorbidityIds: comorbidityIds ?? this.comorbidityIds,
    );
  }
}

class RespiratoryInsufficiency {
  double? gasometryPaO2;
  double? gasometryPaCo2;
  double? gasometryPH;
  int? hospitalizationDays;
  int? hospitalizationSiteId;
  int? respiratoryInsufficiencyTypeId;
  String? hemodynamicAssessment;
  String? medicalDiagnosis;

  RespiratoryInsufficiency({
    this.gasometryPaO2,
    this.gasometryPaCo2,
    this.gasometryPH,
    this.hospitalizationDays,
    this.hospitalizationSiteId,
    this.respiratoryInsufficiencyTypeId,
    this.hemodynamicAssessment,
    this.medicalDiagnosis,
  });

  factory RespiratoryInsufficiency.fromJson(Map<String, dynamic> json) {
    return RespiratoryInsufficiency(
      gasometryPaO2: json['gasometryPaO2'],
      gasometryPaCo2: json['gasometryPaCo2'],
      gasometryPH: json['gasometryPH'],
      hospitalizationDays: json['hospitalizationDays'],
      hospitalizationSiteId: json['hospitalizationSiteId'],
      respiratoryInsufficiencyTypeId: json['respiratoryInsufficiencyTypeId'],
      hemodynamicAssessment: json['hemodynamicAssessment'],
      medicalDiagnosis: json['medicalDiagnosis'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gasometryPaO2': gasometryPaO2,
      'gasometryPaCo2': gasometryPaCo2,
      'gasometryPH': gasometryPH,
      'hospitalizationDays': hospitalizationDays,
      'hospitalizationSiteId': hospitalizationSiteId,
      'respiratoryInsufficiencyTypeId': respiratoryInsufficiencyTypeId,
      'hemodynamicAssessment': hemodynamicAssessment,
      'medicalDiagnosis': medicalDiagnosis,
    };
  }

  RespiratoryInsufficiencyEntity toEntity() {
    return RespiratoryInsufficiencyEntity(
      gasometryPaO2: gasometryPaO2,
      gasometryPaCo2: gasometryPaCo2,
      gasometryPH: gasometryPH,
      hospitalizationDays: hospitalizationDays,
      hospitalizationSiteId: hospitalizationSiteId,
      respiratoryInsufficiencyTypeId: respiratoryInsufficiencyTypeId,
      hemodynamicAssessment: hemodynamicAssessment,
      medicalDiagnosis: medicalDiagnosis,
    );
  }

  factory RespiratoryInsufficiency.fromEntity(
      RespiratoryInsufficiencyEntity entity) {
    return RespiratoryInsufficiency(
      gasometryPaO2: entity.gasometryPaO2,
      gasometryPaCo2: entity.gasometryPaCo2,
      gasometryPH: entity.gasometryPH,
      hospitalizationDays: entity.hospitalizationDays,
      hospitalizationSiteId: entity.hospitalizationSiteId,
      respiratoryInsufficiencyTypeId: entity.respiratoryInsufficiencyTypeId,
      hemodynamicAssessment: entity.hemodynamicAssessment,
      medicalDiagnosis: entity.medicalDiagnosis,
    );
  }
}

class SmokingData {
  int? cigaretteTypeId;
  double? carbonMonoxide;
  double? tobaccoLoad;
  double? tobaccoLoadTraditional;
  double? tobaccoLoadVaping;
  int? consumptionDurationYears;
  int? consumptionDurationMonths;
  int? nicotineQuantityId;
  int? consumptionDurationTraditionalYears;
  int? consumptionDurationTraditionalMonths;
  int? consumptionDurationVapingYears;
  int? consumptionDurationVapingMonths;
  int? cessationTimeTraditionalYears;
  int? cessationTimeTraditionalMonths;
  int? cessationTimeVapingYears;
  int? cessationTimeVapingMonths;
  int? participationWeek;
  int? cessationTimeId;
  int? healthPerceptionId;

  SmokingData({
    this.cigaretteTypeId,
    this.carbonMonoxide,
    this.tobaccoLoad,
    this.tobaccoLoadTraditional,
    this.tobaccoLoadVaping,
    this.consumptionDurationYears,
    this.consumptionDurationMonths,
    this.nicotineQuantityId,
    this.consumptionDurationTraditionalYears,
    this.consumptionDurationTraditionalMonths,
    this.consumptionDurationVapingYears,
    this.consumptionDurationVapingMonths,
    this.cessationTimeTraditionalYears,
    this.cessationTimeTraditionalMonths,
    this.cessationTimeVapingYears,
    this.cessationTimeVapingMonths,
    this.participationWeek,
    this.cessationTimeId,
    this.healthPerceptionId,
  });

  factory SmokingData.fromJson(Map<String, dynamic> json) {
    return SmokingData(
      cigaretteTypeId: json['cigaretteTypeId'],
      carbonMonoxide: json['carbonMonoxide'],
      tobaccoLoad: json['tobaccoLoad'],
      tobaccoLoadTraditional: json['tobaccoLoadTraditional'],
      tobaccoLoadVaping: json['tobaccoLoadVaping'],
      consumptionDurationYears: json['consumptionDurationYears'],
      consumptionDurationMonths: json['consumptionDurationMonths'],
      nicotineQuantityId: json['nicotineQuantityId'],
      consumptionDurationTraditionalYears:
          json['consumptionDurationTraditionalYears'],
      consumptionDurationTraditionalMonths:
          json['consumptionDurationTraditionalMonths'],
      consumptionDurationVapingYears: json['consumptionDurationVapingYears'],
      consumptionDurationVapingMonths: json['consumptionDurationVapingMonths'],
      cessationTimeTraditionalYears: json['cessationTimeTraditionalYears'],
      cessationTimeTraditionalMonths: json['cessationTimeTraditionalMonths'],
      cessationTimeVapingYears: json['cessationTimeVapingYears'],
      cessationTimeVapingMonths: json['cessationTimeVapingMonths'],
      participationWeek: json['participationWeek'],
      cessationTimeId: json['cessationTimeId'],
      healthPerceptionId: json['healthPerceptionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cigaretteTypeId': cigaretteTypeId,
      'carbonMonoxide': carbonMonoxide,
      'tobaccoLoad': tobaccoLoad,
      'tobaccoLoadTraditional': tobaccoLoadTraditional,
      'tobaccoLoadVaping': tobaccoLoadVaping,
      'consumptionDurationYears': consumptionDurationYears,
      'consumptionDurationMonths': consumptionDurationMonths,
      'nicotineQuantityId': nicotineQuantityId,
      'consumptionDurationTraditionalYears':
          consumptionDurationTraditionalYears,
      'consumptionDurationTraditionalMonths':
          consumptionDurationTraditionalMonths,
      'consumptionDurationVapingYears': consumptionDurationVapingYears,
      'consumptionDurationVapingMonths': consumptionDurationVapingMonths,
      'cessationTimeTraditionalYears': cessationTimeTraditionalYears,
      'cessationTimeTraditionalMonths': cessationTimeTraditionalMonths,
      'cessationTimeVapingYears': cessationTimeVapingYears,
      'cessationTimeVapingMonths': cessationTimeVapingMonths,
      'participationWeek': participationWeek,
      'cessationTimeId': cessationTimeId,
      'healthPerceptionId': healthPerceptionId,
    };
  }

  SmokingDataEntity toEntity() {
    return SmokingDataEntity(
      cigaretteTypeId: cigaretteTypeId,
      carbonMonoxide: carbonMonoxide,
      tobaccoLoad: tobaccoLoad,
      tobaccoLoadTraditional: tobaccoLoadTraditional,
      tobaccoLoadVaping: tobaccoLoadVaping,
      consumptionDurationYears: consumptionDurationYears,
      consumptionDurationMonths: consumptionDurationMonths,
      nicotineQuantityId: nicotineQuantityId,
      consumptionDurationTraditionalYears: consumptionDurationTraditionalYears,
      consumptionDurationTraditionalMonths:
          consumptionDurationTraditionalMonths,
      consumptionDurationVapingYears: consumptionDurationVapingYears,
      consumptionDurationVapingMonths: consumptionDurationVapingMonths,
      cessationTimeTraditionalYears: cessationTimeTraditionalYears,
      cessationTimeTraditionalMonths:
          cessationTimeTraditionalMonths,
      cessationTimeVapingYears: cessationTimeVapingYears,
      cessationTimeVapingMonths: cessationTimeVapingMonths,
      participationWeek: participationWeek,
      cessationTimeId: cessationTimeId,
      healthPerceptionId: healthPerceptionId,
    );
  }

  factory SmokingData.fromEntity(SmokingDataEntity entity) {
    return SmokingData(
      cigaretteTypeId: entity.cigaretteTypeId,
      carbonMonoxide: entity.carbonMonoxide,
      tobaccoLoad: entity.tobaccoLoad,
      tobaccoLoadTraditional: entity.tobaccoLoadTraditional,
      tobaccoLoadVaping: entity.tobaccoLoadVaping,
      consumptionDurationYears: entity.consumptionDurationYears,
      consumptionDurationMonths: entity.consumptionDurationMonths,
      nicotineQuantityId: entity.nicotineQuantityId,
      consumptionDurationTraditionalYears:
          entity.consumptionDurationTraditionalYears,
      consumptionDurationTraditionalMonths:
          entity.consumptionDurationTraditionalMonths,
      consumptionDurationVapingYears: entity.consumptionDurationVapingYears,
      consumptionDurationVapingMonths: entity.consumptionDurationVapingMonths,
      cessationTimeTraditionalYears:
          entity.cessationTimeTraditionalYears,
      cessationTimeTraditionalMonths:
          entity.cessationTimeTraditionalMonths,
      cessationTimeVapingYears: entity.cessationTimeVapingYears,
      cessationTimeVapingMonths: entity.cessationTimeVapingMonths,
      participationWeek: entity.participationWeek,
      cessationTimeId: entity.cessationTimeId,
      healthPerceptionId: entity.healthPerceptionId,
    );
  }
}
