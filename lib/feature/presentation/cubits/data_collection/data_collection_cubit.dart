import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spira/feature/core/app_const.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/data/datasources/local/local_data_source.dart';
import 'package:spira/feature/data/services/connectivity_service.dart';
import 'package:spira/feature/data/model/request/patient_model.dart';
import 'package:spira/feature/domain/entities/Audio_response_entity.dart';
import 'package:spira/feature/domain/entities/comorbidity_entity.dart';
import 'package:spira/feature/domain/entities/gender_entity.dart';
import 'package:spira/feature/domain/entities/health_perception_entity.dart';
import 'package:spira/feature/domain/entities/hospitalization_location_entity.dart';
import 'package:spira/feature/domain/entities/line_of_study_entity.dart';
import 'package:spira/feature/domain/entities/nicotine_amount_entity.dart';
import 'package:spira/feature/domain/entities/patient_response_entity.dart';
import 'package:spira/feature/domain/entities/recorder_audio_entity.dart';
import 'package:spira/feature/domain/entities/respiratory_failure_entity.dart';
import 'package:spira/feature/domain/entities/smoker_entity.dart';
import 'package:spira/feature/domain/entities/smoking_cessation_entity.dart';
import 'package:spira/feature/domain/entities/smoking_entity.dart';
import 'package:spira/feature/domain/usecases/post_audio_usecase.dart';
import 'package:spira/feature/domain/usecases/post_patient_data_usecase.dart';
import 'package:spira/feature/presentation/cubits/auth/auth_cubit.dart';

part 'data_collection_state.dart';

class DataCollectionCubit extends Cubit<DataCollectionState> {
  DataCollectionCubit() : super(DataCollectionState());

  // step 1 text fields
  TextEditingController collectionLocationController = TextEditingController();

  // step 2 text fields
  TextEditingController identifierController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController additionalComorbidityController =
      TextEditingController();

  // step 3 text fields
  TextEditingController heartRateController = TextEditingController();
  TextEditingController respiratoryRateController = TextEditingController();
  TextEditingController saturationController = TextEditingController();
  TextEditingController bloodPressureOneController = TextEditingController();
  TextEditingController bloodPressureTwoController = TextEditingController();

  // respiratory failure step text fields
  TextEditingController bloodGasOneController = TextEditingController();
  TextEditingController bloodGasTwoController = TextEditingController();
  TextEditingController bloodGasThreeController = TextEditingController();
  TextEditingController hospitalizationDaysController = TextEditingController();
  TextEditingController hemodynamicEvaluationController =
      TextEditingController();
  TextEditingController medicalDiagnosisController = TextEditingController();

  // traditional smoking text fields
  TextEditingController traditionalTobaccoLoadController =
      TextEditingController();
  TextEditingController traditionalCarbonMonoxideController =
      TextEditingController();
  TextEditingController traditionalConsumptionTimeOneController =
      TextEditingController();
  TextEditingController traditionalConsumptionTimeTwoController =
      TextEditingController();
  TextEditingController traditionalCessationTimeOneController =
      TextEditingController();
  TextEditingController traditionalCessationTimeTwoController =
      TextEditingController();

  // electronic smoking text fields
  TextEditingController electronicTobaccoLoadController =
      TextEditingController();
  TextEditingController electronicCarbonMonoxideController =
      TextEditingController();
  TextEditingController electronicConsumptionTimeOneController =
      TextEditingController();
  TextEditingController electronicConsumptionTimeTwoController =
      TextEditingController();
  TextEditingController electronicCessationTimeOneController =
      TextEditingController();
  TextEditingController electronicCessationTimeTwoController =
      TextEditingController();

  // last smoking dropdowns
  TextEditingController antiSmokingWeeksController = TextEditingController();

  Future<List<GenderEntity>> get genders async {
    return await GetIt.I.get<LocalDataSource>().getGenders();
  }

  Future<List<ComorbidityEntity>> get comorbidities async {
    return [
      ComorbidityEntity(id: 0, name: 'Sem comorbidades'),
      ...await GetIt.I.get<LocalDataSource>().getComorbidities(),
    ];
  }

  Future<List<SmokerEntity>> get smokers async {
    return await GetIt.I.get<LocalDataSource>().getSmokers();
  }

  Future<List<LineOfStudyEntity>> get linesOfStudy async {
    return await GetIt.I.get<LocalDataSource>().getStudyLines();
  }

  Future<List<HospitalizationLocationEntity>>
      get hospitalizationLocations async {
    return await GetIt.I.get<LocalDataSource>().getHospitalizationLocations();
  }

  Future<List<RespiratoryFailureEntity>> get respiratoryFailures async {
    return await GetIt.I.get<LocalDataSource>().getRespiratoryFailures();
  }

  Future<List<SmokingEntity>> get smokingTypes async {
    return await GetIt.I.get<LocalDataSource>().getSmokingTypes();
  }

  Future<List<NicotineAmountEntity>> get nicotineAmounts async {
    return await GetIt.I.get<LocalDataSource>().getNicotineAmounts();
  }

  Future<List<SmokingCessationEntity>> get smokingCessations async {
     final lista = await GetIt.I.get<LocalDataSource>().getSmokingCessationTimes();
     return lista;
  }

  Future<List<HealthPerceptionEntity>> get healthPerceptions async {
    return await GetIt.I.get<LocalDataSource>().getHealthPerceptions();
  }

  void setGender(GenderEntity gender) {
    emit(state.copyWith(gender: gender));
  }

  void setComorbidities(List<ComorbidityEntity> comorbidities) {
    emit(state.copyWith(comorbidities: comorbidities));
  }

  void setSmoker(SmokerEntity smoker) {
    emit(state.copyWith(smoker: smoker));
  }

  void setLineOfStudy(LineOfStudyEntity lineOfStudy) {
    emit(state.copyWith(lineOfStudy: lineOfStudy));
  }

  void setHospitalizationLocation(HospitalizationLocationEntity location) {
    emit(state.copyWith(hospitalizationLocation: location));
  }

  void setRespiratoryFailure(RespiratoryFailureEntity failure) {
    emit(state.copyWith(respiratoryFailure: failure));
  }

  void setSmokingType(SmokingEntity smokingType) {
    emit(state.copyWith(smokingType: smokingType));
  }

  void setNicotineAmount(NicotineAmountEntity nicotineAmount) {
    emit(state.copyWith(nicotineAmount: nicotineAmount));
  }

  void setSmokingCessation(SmokingCessationEntity smokingCessation) {
    emit(state.copyWith(smokingCessation: smokingCessation));
  }

  void setHealthPerception(HealthPerceptionEntity healthPerception) {
    emit(state.copyWith(healthPerception: healthPerception));
  }

  void setAmbientNoisePath(RecordedAudioEntity? audio) {
    if (audio == null) {
      emit(state.eraseAmbientNoisePath());
      return;
    }
    emit(state.copyWith(ambientNoise: audio));
  }

  void setSustentainedVowelPath(RecordedAudioEntity? audio) {
    if (audio == null) {
      emit(state.eraseSustentainedVowelPath());
      return;
    }
    emit(state.copyWith(sustentainedVowel: audio));
  }

  void setPhrasePath(RecordedAudioEntity? audio) {
    if (audio == null) {
      emit(state.erasePhrasePath());
      return;
    }
    emit(state.copyWith(phrase: audio));
  }

  void setRhymePath(RecordedAudioEntity? audio) {
    if (audio == null) {
      emit(state.eraseRhymePath());
      return;
    }
    emit(state.copyWith(rhyme: audio));
  }

  Future<void> submitCollectionData() async {
    emit(state.copyWith(loadState: SubmitLoadState.loading));
    final loginResponseModel =
        await GetIt.I.get<LocalDataSource>().getFirstLoginResponse();
    final patient = PatientModel(
      collectionSite: collectionLocationController.text,
      identifier: identifierController.text,
      otherComorbidities: (additionalComorbidityController.text.isEmpty
          ? null
          : additionalComorbidityController.text),
      smokerId: state.smoker?.id,
      genderId: state.gender?.id,
      weight: double.tryParse(weightController.text.replaceAll(",", ".")),
      height: double.tryParse(heightController.text),
      bloodPressure:
          '${bloodPressureOneController.text}/${bloodPressureTwoController.text}',
      age: int.tryParse(ageController.text),
      heartRate: int.tryParse(heartRateController.text),
      respiratoryRate: int.tryParse(respiratoryRateController.text),
      saturation:
          double.tryParse(saturationController.text.replaceAll(",", ".")),
      studyTypeId: state.lineOfStudy?.id,
      // user logged in at the time of collection
      collectorUserId: loginResponseModel?.user.id,
      collectionDate: DateTime.now(),
      comorbidityIds: getComorbidityIds(),
      respiratoryInsufficiency: isRespiratoryFailureStep()
          ? RespiratoryInsufficiency(
              gasometryPaO2: double.tryParse(
                  bloodGasOneController.text.replaceAll(",", ".")),
              gasometryPaCo2: double.tryParse(
                  bloodGasTwoController.text.replaceAll(",", ".")),
              gasometryPH: double.tryParse(
                  bloodGasThreeController.text.replaceAll(",", ".")),
              hospitalizationDays:
                  int.tryParse(hospitalizationDaysController.text),
              hospitalizationSiteId: state.hospitalizationLocation?.id,
              respiratoryInsufficiencyTypeId: state.respiratoryFailure?.id,
              hemodynamicAssessment:
                  (hemodynamicEvaluationController.text.isEmpty
                      ? null
                      : hemodynamicEvaluationController.text),
              medicalDiagnosis: (medicalDiagnosisController.text.isEmpty
                  ? null
                  : medicalDiagnosisController.text),
            )
          : null,
      smokingData: isSmokingTypeStep() || isControlStep() || isAsthmaStep()
          ? SmokingData(
              cigaretteTypeId: state.smokingType?.id,
              carbonMonoxide: isTraditionalSmoking() ||
                      isBothSmoking() ||
                      isAsthmaStep() ||
                      isControlStep()
                  ? double.tryParse(traditionalCarbonMonoxideController.text
                      .replaceAll(",", "."))
                  : isElectronicSmoking()
                      ? double.tryParse(electronicCarbonMonoxideController.text
                          .replaceAll(",", "."))
                      : null,
              tobaccoLoad: isTraditionalSmoking()
                  ? double.tryParse(traditionalTobaccoLoadController.text
                      .replaceAll(",", "."))
                  : (isElectronicSmoking()
                      ? double.tryParse(electronicTobaccoLoadController.text
                          .replaceAll(",", "."))
                      : null),
              tobaccoLoadTraditional:
                  isBothSmoking() || isAsthmaStep() || isControlStep()
                      ? double.tryParse(traditionalTobaccoLoadController.text
                          .replaceAll(",", "."))
                      : null,
              tobaccoLoadVaping: isBothSmoking() ||
                      isAsthmaStep() ||
                      isControlStep()
                  ? double.tryParse(
                      electronicTobaccoLoadController.text.replaceAll(",", "."))
                  : null,
              consumptionDurationYears: isTraditionalSmoking()
                  ? int.tryParse(traditionalConsumptionTimeOneController.text)
                  : (isElectronicSmoking()
                      ? int.tryParse(
                          electronicConsumptionTimeOneController.text)
                      : null),
              consumptionDurationMonths: isTraditionalSmoking()
                  ? int.tryParse(traditionalConsumptionTimeTwoController.text)
                  : (isElectronicSmoking()
                      ? int.tryParse(
                          electronicConsumptionTimeTwoController.text)
                      : null),
              nicotineQuantityId: state.nicotineAmount?.id,
              consumptionDurationTraditionalYears: isBothSmoking() ||
                      isAsthmaStep() ||
                      isControlStep()
                  ? int.tryParse(traditionalConsumptionTimeOneController.text)
                  : null,
              consumptionDurationTraditionalMonths: isBothSmoking() ||
                      isAsthmaStep() ||
                      isControlStep()
                  ? int.tryParse(traditionalConsumptionTimeTwoController.text)
                  : null,
              consumptionDurationVapingYears: isBothSmoking() ||
                      isAsthmaStep() ||
                      isControlStep()
                  ? int.tryParse(electronicConsumptionTimeOneController.text)
                  : null,
              consumptionDurationVapingMonths: isBothSmoking() ||
                      isAsthmaStep() ||
                      isControlStep()
                  ? int.tryParse(electronicConsumptionTimeTwoController.text)
                  : null,
              cessationTimeTraditionalYears: isAsthmaStep() || isControlStep()
                  ? int.tryParse(traditionalCessationTimeOneController.text)
                  : null,
              cessationTimeTraditionalMonths: isAsthmaStep() || isControlStep()
                  ? int.tryParse(traditionalCessationTimeTwoController.text)
                  : null,
              cessationTimeVapingYears: isAsthmaStep() || isControlStep()
                  ? int.tryParse(electronicCessationTimeOneController.text)
                  : null,
              cessationTimeVapingMonths: isAsthmaStep() || isControlStep()
                  ? int.tryParse(electronicCessationTimeTwoController.text)
                  : null,
              participationWeek: int.tryParse(antiSmokingWeeksController.text),
              cessationTimeId: state.smokingCessation?.id,
              healthPerceptionId: state.healthPerception?.id,
            )
          : null,
    );
    if (await GetIt.I.get<ConnectivityService>().isConnected()) {
      try {
        int? id = await submitOnlineCollectionData(patient);
        if (id != null && id > 0) {
          bool ambientNoise = await submitAmbientNoise(id);
          bool sustentainedVowel = await submitSustentainedVowel(id);
          bool phrase = state.phrase != null ? await submitPhrase(id) : true;
          bool rhyme = await submitRhyme(id);
          if (!ambientNoise || !sustentainedVowel || !phrase || !rhyme) {
            await GetIt.I.get<LocalDataSource>().insertPatient(
                patient,
                true,
                state.ambientNoise!,
                ambientNoise,
                state.sustentainedVowel!,
                sustentainedVowel,
                state.phrase,
                phrase,
                state.rhyme!,
                rhyme);
            emit(state.copyWith(
                loadState: SubmitLoadState.initial,
                step: DataCollectionStep.offlineSuccess));
            return;
          }

          emit(state.copyWith(
              loadState: SubmitLoadState.initial,
              step: DataCollectionStep.onlineSuccess));
        } else {
          await GetIt.I.get<LocalDataSource>().insertPatient(
              patient,
              false,
              state.ambientNoise!,
              false,
              state.sustentainedVowel!,
              false,
              state.phrase,
              false,
              state.rhyme!,
              false);
          if (id == -1) {
            await GetIt.I<AuthCubit>().logout();
            emit(state.copyWith(loadState: SubmitLoadState.unauthenticated));
          } else {
            emit(state.copyWith(
                loadState: SubmitLoadState.initial,
                step: DataCollectionStep.offlineSuccess));
          }
        }
      } catch (e) {
        await GetIt.I.get<LocalDataSource>().insertPatient(
            patient,
            false,
            state.ambientNoise!,
            false,
            state.sustentainedVowel!,
            false,
            state.phrase,
            false,
            state.rhyme!,
            false);
        emit(state.copyWith(
            loadState: SubmitLoadState.error,
            step: DataCollectionStep.offlineSuccess));
      }
    } else {
      try {
        await GetIt.I.get<LocalDataSource>().insertPatient(
            patient,
            false,
            state.ambientNoise!,
            false,
            state.sustentainedVowel!,
            false,
            state.phrase,
            false,
            state.rhyme!,
            false);
        emit(state.copyWith(
            loadState: SubmitLoadState.initial,
            step: DataCollectionStep.offlineSuccess));
      } catch (e) {
        emit(state.copyWith(
            loadState: SubmitLoadState.errorOffline,
            step: DataCollectionStep.offlineSuccess));
      }
    }
  }

  Future<int?> submitOnlineCollectionData(PatientModel patient) async {
    final PostPatientDataUseCase postPatientDataUseCase =
        GetIt.I.get<PostPatientDataUseCase>();
    PatientResponseEntity? response =
        await postPatientDataUseCase.call(patient);
    if ((response?.success ?? false) && response?.data?.id != null) {
      return response!.data!.id!;
    } else {
      if (!(response?.authenticated ?? true)) {
        return -1;
      }
      emit(state.copyWith(loadState: SubmitLoadState.error));
      return null;
    }
  }

  Future<bool> submitAmbientNoise(int id) async {
    final PostAudioDataUseCase postAudioDataUseCase =
        GetIt.I.get<PostAudioDataUseCase>();
    try {
      AudioResponseEntity? response = await postAudioDataUseCase.call(
          id, 'ambient_noise', state.ambientNoise?.path ?? '');

      if (response?.success == null || response?.success == false) {
        emit(state.copyWith(loadState: SubmitLoadState.errorAmbientNoise));
        return false;
      }
      return true;
    } catch (_) {
      emit(state.copyWith(loadState: SubmitLoadState.errorAmbientNoise));
      return false;
    }
  }

  Future<bool> submitSustentainedVowel(int id) async {
    final PostAudioDataUseCase postAudioDataUseCase =
        GetIt.I.get<PostAudioDataUseCase>();
    try {
      AudioResponseEntity? response = await postAudioDataUseCase.call(
          id, 'sustentained_vowel', state.sustentainedVowel?.path ?? '');

      if (response?.success == null || response?.success == false) {
        emit(state.copyWith(loadState: SubmitLoadState.errorSustentainedVowel));
        return false;
      }
      return true;
    } catch (_) {
      emit(state.copyWith(loadState: SubmitLoadState.errorSustentainedVowel));
      return false;
    }
  }

  Future<bool> submitPhrase(int id) async {
    final PostAudioDataUseCase postAudioDataUseCase =
        GetIt.I.get<PostAudioDataUseCase>();
    try {
      AudioResponseEntity? response = await postAudioDataUseCase.call(
          id, 'phrase', state.phrase?.path ?? '');

      if (response?.success == null || response?.success == false) {
        emit(state.copyWith(loadState: SubmitLoadState.errorPhrase));
        return false;
      }
      return true;
    } catch (_) {
      emit(state.copyWith(loadState: SubmitLoadState.errorPhrase));
      return false;
    }
  }

  Future<bool> submitRhyme(int id) async {
    final PostAudioDataUseCase postAudioDataUseCase =
        GetIt.I.get<PostAudioDataUseCase>();
    try {
      AudioResponseEntity? response =
          await postAudioDataUseCase.call(id, 'rhyme', state.rhyme?.path ?? '');

      if (response?.success == null || response?.success == false) {
        emit(state.copyWith(loadState: SubmitLoadState.errorRhyme));
        return false;
      }
      return true;
    } catch (_) {
      emit(state.copyWith(loadState: SubmitLoadState.errorRhyme));
      return false;
    }
  }

  List<int>? getComorbidityIds() {
    if (state.comorbidities?.any((comorbidity) => comorbidity.id == 0) ??
        false) {
      return [];
    }
    return state.comorbidities?.map((e) => e.id).toList();
  }

  bool isRespiratoryFailureStep() {
    return state.lineOfStudy?.id == 2;
  }

  bool isSmokingTypeStep() {
    return state.lineOfStudy?.id == 3;
  }

  bool isControlStep() {
    return state.lineOfStudy?.id == 4;
  }

  bool isAsthmaStep() {
    return state.lineOfStudy?.id == 1;
  }

  bool isTraditionalSmoking() {
    return isSmokingTypeStep() && state.smokingType?.id == 1;
  }

  bool isElectronicSmoking() {
    return isSmokingTypeStep() && state.smokingType?.id == 2;
  }

  bool isBothSmoking() {
    return isSmokingTypeStep() && state.smokingType?.id == 3;
  }

  void nextStep() {
    switch (state.step) {
      case DataCollectionStep.patientDataStepOne:
        emit(state.copyWith(
          step: DataCollectionStep.patientDataStepTwo,
          stepProgressValue: StepProgressValue.patientData,
        ));
        break;
      case DataCollectionStep.patientDataStepTwo:
        emit(state.copyWith(
          step: DataCollectionStep.patientDataStepThree,
          stepProgressValue: StepProgressValue.patientData,
        ));
        break;
      case DataCollectionStep.patientDataStepThree:
        emit(state.copyWith(
          step: DataCollectionStep.lineOfStudy,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.lineOfStudy:
        if (state.lineOfStudy != null) {
          switch (state.lineOfStudy!.id) {
            case 1:
              emit(state.copyWith(
                step: DataCollectionStep.asthmaTraditionalSmoking,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
              break;
            case 2:
              emit(state.copyWith(
                step: DataCollectionStep.respiratoryFailure,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
              break;
            case 3:
              emit(state.copyWith(
                step: DataCollectionStep.smokingType,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
              break;
            case 4:
              emit(state.copyWith(
                step: DataCollectionStep.controlTraditionalSmoking,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
              break;
            default:
              emit(state.copyWith(
                step: DataCollectionStep.ambientNoise,
                stepProgressValue: StepProgressValue.ambientNoise,
              ));
              break;
          }
        }
        break;
      case DataCollectionStep.smokingType:
        if (state.smokingType != null) {
          switch (state.smokingType!.id) {
            case 1:
              emit(state.copyWith(
                step: DataCollectionStep.traditionalSmoking,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
              break;
            case 2:
              emit(state.copyWith(
                step: DataCollectionStep.electronicSmoking,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
              break;
            case 3:
              emit(state.copyWith(
                step: DataCollectionStep.bothTraditionalSmoking,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
              break;
            default:
              emit(state.copyWith(
                step: DataCollectionStep.ambientNoise,
                stepProgressValue: StepProgressValue.ambientNoise,
              ));
              break;
          }
        }
        break;
      case DataCollectionStep.respiratoryFailure:
        emit(state.copyWith(
          step: DataCollectionStep.ambientNoise,
          stepProgressValue: StepProgressValue.ambientNoise,
        ));
        break;
      case DataCollectionStep.traditionalSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.smokingLastStep,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.electronicSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.smokingLastStep,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.bothTraditionalSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.bothElectronicSmoking,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.bothElectronicSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.smokingLastStep,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.asthmaTraditionalSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.asthmaElectronicSmoking,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
      case DataCollectionStep.asthmaElectronicSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.ambientNoise,
          stepProgressValue: StepProgressValue.ambientNoise,
        ));
      case DataCollectionStep.controlTraditionalSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.controlElectronicSmoking,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.controlElectronicSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.ambientNoise,
          stepProgressValue: StepProgressValue.ambientNoise,
        ));
        break;
      case DataCollectionStep.smokingLastStep:
        emit(state.copyWith(
          step: DataCollectionStep.ambientNoise,
          stepProgressValue: StepProgressValue.ambientNoise,
        ));
        break;
      case DataCollectionStep.ambientNoise:
        emit(state.copyWith(
          step: DataCollectionStep.sustentainedVowel,
          stepProgressValue: StepProgressValue.sustentainedVowel,
        ));
        break;
      case DataCollectionStep.sustentainedVowel:
        emit(state.copyWith(
          step: DataCollectionStep.phrase,
          stepProgressValue: StepProgressValue.phrase,
        ));
        break;
      case DataCollectionStep.phrase:
        emit(state.copyWith(
          step: DataCollectionStep.rhyme,
          stepProgressValue: StepProgressValue.rhyme,
        ));
        break;
      case DataCollectionStep.rhyme:
        emit(state.copyWith(
          step: DataCollectionStep.submitData,
          stepProgressValue: StepProgressValue.submitData,
        ));
        break;
      case DataCollectionStep.submitData:
        emit(state.copyWith(
          step: DataCollectionStep.processing,
          stepProgressValue: StepProgressValue.submitData,
        ));
        break;

      default:
    }
  }

  void previousStep() {
    switch (state.step) {
      case DataCollectionStep.patientDataStepTwo:
        emit(state.copyWith(
          step: DataCollectionStep.patientDataStepOne,
          stepProgressValue: StepProgressValue.patientData,
        ));
        break;
      case DataCollectionStep.patientDataStepThree:
        emit(state.copyWith(
          step: DataCollectionStep.patientDataStepTwo,
          stepProgressValue: StepProgressValue.patientData,
        ));
        break;
      case DataCollectionStep.lineOfStudy:
        emit(state.copyWith(
          step: DataCollectionStep.patientDataStepThree,
          stepProgressValue: StepProgressValue.patientData,
        ));
        break;
      case DataCollectionStep.respiratoryFailure:
        emit(state.copyWith(
          step: DataCollectionStep.lineOfStudy,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.smokingType:
        emit(state.copyWith(
          step: DataCollectionStep.lineOfStudy,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.traditionalSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.smokingType,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.electronicSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.smokingType,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.bothTraditionalSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.smokingType,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.bothElectronicSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.bothTraditionalSmoking,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.smokingLastStep:
        if (state.smokingType != null) {
          switch (state.smokingType!.id) {
            case 1:
              emit(state.copyWith(
                step: DataCollectionStep.traditionalSmoking,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
              break;
            case 2:
              emit(state.copyWith(
                step: DataCollectionStep.electronicSmoking,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
              break;
            case 3:
              emit(state.copyWith(
                step: DataCollectionStep.bothElectronicSmoking,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
              break;
            default:
              emit(state.copyWith(
                step: DataCollectionStep.smokingType,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
              break;
          }
        }
        break;
      case DataCollectionStep.asthmaTraditionalSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.lineOfStudy,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.asthmaElectronicSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.asthmaTraditionalSmoking,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.controlTraditionalSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.lineOfStudy,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.controlElectronicSmoking:
        emit(state.copyWith(
          step: DataCollectionStep.controlTraditionalSmoking,
          stepProgressValue: StepProgressValue.lineOfStudy,
        ));
        break;
      case DataCollectionStep.ambientNoise:
        switch (state.lineOfStudy!.id) {
          case 1:
            emit(state.copyWith(
              step: DataCollectionStep.asthmaElectronicSmoking,
              stepProgressValue: StepProgressValue.lineOfStudy,
            ));
            break;
          case 2:
            emit(state.copyWith(
              step: DataCollectionStep.respiratoryFailure,
              stepProgressValue: StepProgressValue.lineOfStudy,
            ));
            break;
          case 3:
            if (state.smokingType != null &&
                (state.smokingType!.id == 1 ||
                    state.smokingType!.id == 2 ||
                    state.smokingType!.id == 3)) {
              emit(state.copyWith(
                step: DataCollectionStep.smokingLastStep,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
            } else {
              emit(state.copyWith(
                step: DataCollectionStep.smokingType,
                stepProgressValue: StepProgressValue.lineOfStudy,
              ));
            }
            break;
          case 4:
            emit(state.copyWith(
              step: DataCollectionStep.controlElectronicSmoking,
              stepProgressValue: StepProgressValue.lineOfStudy,
            ));
            break;
          default:
            emit(state.copyWith(
              step: DataCollectionStep.smokingType,
              stepProgressValue: StepProgressValue.ambientNoise,
            ));
            break;
        }
      case DataCollectionStep.sustentainedVowel:
        emit(state.copyWith(
          step: DataCollectionStep.ambientNoise,
          stepProgressValue: StepProgressValue.ambientNoise,
        ));

      case DataCollectionStep.phrase:
        emit(state.copyWith(
          step: DataCollectionStep.sustentainedVowel,
          stepProgressValue: StepProgressValue.sustentainedVowel,
        ));

      case DataCollectionStep.rhyme:
        emit(state.copyWith(
          step: DataCollectionStep.phrase,
          stepProgressValue: StepProgressValue.phrase,
        ));
        break;

      case DataCollectionStep.submitData:
        emit(state.copyWith(
          step: DataCollectionStep.rhyme,
          stepProgressValue: StepProgressValue.rhyme,
        ));
        break;
      case DataCollectionStep.processing:
        emit(state.copyWith(
          step: DataCollectionStep.submitData,
          stepProgressValue: StepProgressValue.submitData,
        ));
        break;
      default:
    }
  }
}
