import 'package:spira/feature/data/model/request/patient_model.dart';

class PatientEntity {
  int? id;
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
  RespiratoryInsufficiencyEntity? respiratoryInsufficiency;
  SmokingDataEntity? smokingData;
  dynamic audioNoise;
  dynamic audioVocal;
  dynamic audioSentence;
  dynamic audioNurseryRhyme;
  String? audioNoisePath;
  String? audioVocalPath;
  String? audioSentencePath;
  String? audioNurseryRhymePath;
  List<int>? comorbidityIds;

  PatientEntity({
    this.id,
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
    this.comorbidityIds,
  });

  PatientModel toModel() {
    return PatientModel(
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
      respiratoryInsufficiency: respiratoryInsufficiency?.toModel(),
      smokingData: smokingData?.toModel(),
      audioNoise: audioNoise,
      audioVocal: audioVocal,
      audioSentence: audioSentence,
      audioNurseryRhyme: audioNurseryRhyme,
      comorbidityIds: comorbidityIds,
    );
  }
}

class RespiratoryInsufficiencyEntity {
  double? gasometryPaO2;
  double? gasometryPaCo2;
  double? gasometryPH;
  int? hospitalizationDays;
  int? hospitalizationSiteId;
  int? respiratoryInsufficiencyTypeId;
  String? hemodynamicAssessment;
  String? medicalDiagnosis;

  RespiratoryInsufficiencyEntity({
    this.gasometryPaO2,
    this.gasometryPaCo2,
    this.gasometryPH,
    this.hospitalizationDays,
    this.hospitalizationSiteId,
    this.respiratoryInsufficiencyTypeId,
    this.hemodynamicAssessment,
    this.medicalDiagnosis,
  });

  RespiratoryInsufficiency toModel() {
    return RespiratoryInsufficiency(
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
}

class SmokingDataEntity {
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

  SmokingDataEntity({
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

  SmokingData toModel() {
    return SmokingData(
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
}
