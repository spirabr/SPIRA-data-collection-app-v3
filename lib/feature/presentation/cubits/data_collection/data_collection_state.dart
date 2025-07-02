part of 'data_collection_cubit.dart';

// ignore: must_be_immutable
class DataCollectionState extends Equatable {
  DataCollectionState({
    this.loadState = SubmitLoadState.initial,
    this.step = DataCollectionStep.patientDataStepOne,
    this.stepProgressValue = StepProgressValue.patientData,
    this.gender,
    this.comorbidities,
    this.smoker,
    this.lineOfStudy,
    this.hospitalizationLocation,
    this.respiratoryFailure,
    this.smokingType,
    this.nicotineAmount,
    this.smokingCessation,
    this.healthPerception,
    this.ambientNoise,
    this.sustentainedVowel,
    this.phrase,
    this.rhyme,
  });

  SubmitLoadState loadState;
  DataCollectionStep step;
  double stepProgressValue;

  // step 2 dropdowns
  GenderEntity? gender;
  List<ComorbidityEntity>? comorbidities;

  // step 3 dropdowns
  SmokerEntity? smoker;

  // step 4 dropdowns
  LineOfStudyEntity? lineOfStudy;

  // respiratory failure step dropdowns
  HospitalizationLocationEntity? hospitalizationLocation;
  RespiratoryFailureEntity? respiratoryFailure;

  // smoking type selection dropdowns
  SmokingEntity? smokingType;

  // electronic smoking dropdowns
  NicotineAmountEntity? nicotineAmount;

  // last smoking dropdowns
  SmokingCessationEntity? smokingCessation;
  HealthPerceptionEntity? healthPerception;

  // audio recorder paths
  RecordedAudioEntity? ambientNoise;
  RecordedAudioEntity? sustentainedVowel;
  RecordedAudioEntity? phrase;
  RecordedAudioEntity? rhyme;

  DataCollectionState copyWith({
    SubmitLoadState? loadState,
    DataCollectionStep? step,
    double? stepProgressValue,
    GenderEntity? gender,
    List<ComorbidityEntity>? comorbidities,
    SmokerEntity? smoker,
    LineOfStudyEntity? lineOfStudy,
    HospitalizationLocationEntity? hospitalizationLocation,
    RespiratoryFailureEntity? respiratoryFailure,
    SmokingEntity? smokingType,
    NicotineAmountEntity? nicotineAmount,
    SmokingCessationEntity? smokingCessation,
    HealthPerceptionEntity? healthPerception,
    RecordedAudioEntity? ambientNoise,
    RecordedAudioEntity? sustentainedVowel,
    RecordedAudioEntity? phrase,
    RecordedAudioEntity? rhyme,
  }) {
    return DataCollectionState(
      loadState: loadState ?? this.loadState,
      step: step ?? this.step,
      stepProgressValue: stepProgressValue ?? this.stepProgressValue,
      gender: gender ?? this.gender,
      comorbidities: comorbidities ?? this.comorbidities,
      smoker: smoker ?? this.smoker,
      lineOfStudy: lineOfStudy ?? this.lineOfStudy,
      hospitalizationLocation:
          hospitalizationLocation ?? this.hospitalizationLocation,
      respiratoryFailure: respiratoryFailure ?? this.respiratoryFailure,
      smokingType: smokingType ?? this.smokingType,
      nicotineAmount: nicotineAmount ?? this.nicotineAmount,
      smokingCessation: smokingCessation ?? this.smokingCessation,
      healthPerception: healthPerception ?? this.healthPerception,
      ambientNoise: ambientNoise ?? this.ambientNoise,
      sustentainedVowel: sustentainedVowel ?? this.sustentainedVowel,
      phrase: phrase ?? this.phrase,
      rhyme: rhyme ?? this.rhyme,
    );
  }

  DataCollectionState eraseAmbientNoisePath() {
    return copyWith()..ambientNoise = null;
  }

  DataCollectionState eraseSustentainedVowelPath() {
    return copyWith()..sustentainedVowel = null;
  }

  DataCollectionState erasePhrasePath() {
    return copyWith()..phrase = null;
  }

  DataCollectionState eraseRhymePath() {
    return copyWith()..rhyme = null;
  }

  @override
  List<Object?> get props => [
        loadState,
        step,
        stepProgressValue,
        gender,
        comorbidities,
        smoker,
        lineOfStudy,
        hospitalizationLocation,
        respiratoryFailure,
        smokingType,
        nicotineAmount,
        smokingCessation,
        healthPerception,
        ambientNoise,
        sustentainedVowel,
        phrase,
        rhyme,
      ];
}
