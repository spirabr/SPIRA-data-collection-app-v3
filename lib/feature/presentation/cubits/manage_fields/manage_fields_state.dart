part of 'manage_fields_cubit.dart';

// ignore: must_be_immutable
class ManageFieldsState extends Equatable {
  ManageFieldsState({
    this.loadState = GenericLoadState.initial,
    this.genderToBeAdded = const [],
    this.smokingOptionToBeAdded = const [],
    this.studyLineToBeAdded = const [],
    this.hospitalizationLocationToBeAdded = const [],
    this.respiratoryInsufficiencyTypeToBeAdded = const [],
    this.smokingTypeToBeAdded = const [],
    this.nicotineAmountToBeAdded = const [],
    this.cessationTimeToBeAdded = const [],
    this.healthPerceptionToBeAdded = const [],
    this.genderToBeRemoved = const [],
    this.smokingOptionToBeRemoved = const [],
    this.studyLineToBeRemoved = const [],
    this.hospitalizationLocationToBeRemoved = const [],
    this.respiratoryInsufficiencyTypeToBeRemoved = const [],
    this.smokingTypeToBeRemoved = const [],
    this.nicotineAmountToBeRemoved = const [],
    this.cessationTimeToBeRemoved = const [],
    this.healthPerceptionToBeRemoved = const [],
    this.genderEntities = const [],
    this.smokingOptionEntities = const [],
    this.studyLineEntities = const [],
    this.hospitalizationLocationEntities = const [],
    this.respiratoryInsufficiencyTypeEntities = const [],
    this.smokingTypeEntities = const [],
    this.nicotineAmountEntities = const [],
    this.cessationTimeEntities = const [],
    this.healthPerceptionEntities = const [],
  });

  GenericLoadState loadState;
  List<GenderEntity> genderToBeAdded;
  List<SmokerEntity> smokingOptionToBeAdded;
  List<LineOfStudyEntity> studyLineToBeAdded;
  List<HospitalizationLocationEntity> hospitalizationLocationToBeAdded;
  List<RespiratoryFailureEntity> respiratoryInsufficiencyTypeToBeAdded;
  List<SmokingEntity> smokingTypeToBeAdded;
  List<NicotineAmountEntity> nicotineAmountToBeAdded;
  List<SmokingCessationEntity> cessationTimeToBeAdded;
  List<HealthPerceptionEntity> healthPerceptionToBeAdded;

  List<GenderEntity> genderToBeRemoved;
  List<SmokerEntity> smokingOptionToBeRemoved;
  List<LineOfStudyEntity> studyLineToBeRemoved;
  List<HospitalizationLocationEntity> hospitalizationLocationToBeRemoved;
  List<RespiratoryFailureEntity> respiratoryInsufficiencyTypeToBeRemoved;
  List<SmokingEntity> smokingTypeToBeRemoved;
  List<NicotineAmountEntity> nicotineAmountToBeRemoved;
  List<SmokingCessationEntity> cessationTimeToBeRemoved;
  List<HealthPerceptionEntity> healthPerceptionToBeRemoved;

  List<GenderEntity> genderEntities;
  List<SmokerEntity> smokingOptionEntities;
  List<LineOfStudyEntity> studyLineEntities;
  List<HospitalizationLocationEntity> hospitalizationLocationEntities;
  List<RespiratoryFailureEntity> respiratoryInsufficiencyTypeEntities;
  List<SmokingEntity> smokingTypeEntities;
  List<NicotineAmountEntity> nicotineAmountEntities;
  List<SmokingCessationEntity> cessationTimeEntities;
  List<HealthPerceptionEntity> healthPerceptionEntities;

  ManageFieldsState copyWith({
    GenericLoadState? loadState,
    List<GenderEntity>? genderToBeAdded,
    List<SmokerEntity>? smokingOptionToBeAdded,
    List<LineOfStudyEntity>? studyLineToBeAdded,
    List<HospitalizationLocationEntity>? hospitalizationLocationToBeAdded,
    List<RespiratoryFailureEntity>? respiratoryInsufficiencyTypeToBeAdded,
    List<SmokingEntity>? smokingTypeToBeAdded,
    List<NicotineAmountEntity>? nicotineAmountToBeAdded,
    List<SmokingCessationEntity>? cessationTimeToBeAdded,
    List<HealthPerceptionEntity>? healthPerceptionToBeAdded,
    List<GenderEntity>? genderToBeRemoved,
    List<SmokerEntity>? smokingOptionToBeRemoved,
    List<LineOfStudyEntity>? studyLineToBeRemoved,
    List<HospitalizationLocationEntity>? hospitalizationLocationToBeRemoved,
    List<RespiratoryFailureEntity>? respiratoryInsufficiencyTypeToBeRemoved,
    List<SmokingEntity>? smokingTypeToBeRemoved,
    List<NicotineAmountEntity>? nicotineAmountToBeRemoved,
    List<SmokingCessationEntity>? cessationTimeToBeRemoved,
    List<HealthPerceptionEntity>? healthPerceptionToBeRemoved,
    List<GenderEntity>? genderEntities,
    List<SmokerEntity>? smokingOptionEntities,
    List<LineOfStudyEntity>? studyLineEntities,
    List<HospitalizationLocationEntity>? hospitalizationLocationEntities,
    List<RespiratoryFailureEntity>? respiratoryInsufficiencyTypeEntities,
    List<SmokingEntity>? smokingTypeEntities,
    List<NicotineAmountEntity>? nicotineAmountEntities,
    List<SmokingCessationEntity>? cessationTimeEntities,
    List<HealthPerceptionEntity>? healthPerceptionEntities,
  }) {
    return ManageFieldsState(
      loadState: loadState ?? this.loadState,
      genderToBeAdded: genderToBeAdded ?? this.genderToBeAdded,
      smokingOptionToBeAdded:
          smokingOptionToBeAdded ?? this.smokingOptionToBeAdded,
      studyLineToBeAdded: studyLineToBeAdded ?? this.studyLineToBeAdded,
      hospitalizationLocationToBeAdded: hospitalizationLocationToBeAdded ??
          this.hospitalizationLocationToBeAdded,
      respiratoryInsufficiencyTypeToBeAdded:
          respiratoryInsufficiencyTypeToBeAdded ??
              this.respiratoryInsufficiencyTypeToBeAdded,
      smokingTypeToBeAdded: smokingTypeToBeAdded ?? this.smokingTypeToBeAdded,
      nicotineAmountToBeAdded:
          nicotineAmountToBeAdded ?? this.nicotineAmountToBeAdded,
      cessationTimeToBeAdded:
          cessationTimeToBeAdded ?? this.cessationTimeToBeAdded,
      healthPerceptionToBeAdded:
          healthPerceptionToBeAdded ?? this.healthPerceptionToBeAdded,
      genderToBeRemoved: genderToBeRemoved ?? this.genderToBeRemoved,
      smokingOptionToBeRemoved:
          smokingOptionToBeRemoved ?? this.smokingOptionToBeRemoved,
      studyLineToBeRemoved: studyLineToBeRemoved ?? this.studyLineToBeRemoved,
      hospitalizationLocationToBeRemoved: hospitalizationLocationToBeRemoved ??
          this.hospitalizationLocationToBeRemoved,
      respiratoryInsufficiencyTypeToBeRemoved:
          respiratoryInsufficiencyTypeToBeRemoved ??
              this.respiratoryInsufficiencyTypeToBeRemoved,
      smokingTypeToBeRemoved:
          smokingTypeToBeRemoved ?? this.smokingTypeToBeRemoved,
      nicotineAmountToBeRemoved:
          nicotineAmountToBeRemoved ?? this.nicotineAmountToBeRemoved,
      cessationTimeToBeRemoved:
          cessationTimeToBeRemoved ?? this.cessationTimeToBeRemoved,
      healthPerceptionToBeRemoved:
          healthPerceptionToBeRemoved ?? this.healthPerceptionToBeRemoved,
      genderEntities: genderEntities ?? this.genderEntities,
      smokingOptionEntities:
          smokingOptionEntities ?? this.smokingOptionEntities,
      studyLineEntities: studyLineEntities ?? this.studyLineEntities,
      hospitalizationLocationEntities: hospitalizationLocationEntities ??
          this.hospitalizationLocationEntities,
      respiratoryInsufficiencyTypeEntities:
          respiratoryInsufficiencyTypeEntities ??
              this.respiratoryInsufficiencyTypeEntities,
      smokingTypeEntities: smokingTypeEntities ?? this.smokingTypeEntities,
      nicotineAmountEntities:
          nicotineAmountEntities ?? this.nicotineAmountEntities,
      cessationTimeEntities:
          cessationTimeEntities ?? this.cessationTimeEntities,
      healthPerceptionEntities:
          healthPerceptionEntities ?? this.healthPerceptionEntities,
    );
  }

  @override
  List<Object?> get props => [
        loadState,
        genderToBeAdded,
        smokingOptionToBeAdded,
        studyLineToBeAdded,
        hospitalizationLocationToBeAdded,
        respiratoryInsufficiencyTypeToBeAdded,
        smokingTypeToBeAdded,
        nicotineAmountToBeAdded,
        cessationTimeToBeAdded,
        healthPerceptionToBeAdded,
        genderToBeRemoved,
        smokingOptionToBeRemoved,
        studyLineToBeRemoved,
        hospitalizationLocationToBeRemoved,
        respiratoryInsufficiencyTypeToBeRemoved,
        smokingTypeToBeRemoved,
        nicotineAmountToBeRemoved,
        cessationTimeToBeRemoved,
        healthPerceptionToBeRemoved,
        genderEntities,
        smokingOptionEntities,
        studyLineEntities,
        hospitalizationLocationEntities,
        respiratoryInsufficiencyTypeEntities,
        smokingTypeEntities,
        nicotineAmountEntities,
        cessationTimeEntities,
        healthPerceptionEntities,
      ];
}
