import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:spira/feature/core/enums.dart';
import 'package:spira/feature/domain/entities/gender_entity.dart';
import 'package:spira/feature/domain/entities/health_perception_entity.dart';
import 'package:spira/feature/domain/entities/hospitalization_location_entity.dart';
import 'package:spira/feature/domain/entities/line_of_study_entity.dart';
import 'package:spira/feature/domain/entities/nicotine_amount_entity.dart';
import 'package:spira/feature/domain/entities/respiratory_failure_entity.dart';
import 'package:spira/feature/domain/entities/smoker_entity.dart';
import 'package:spira/feature/domain/entities/smoking_cessation_entity.dart';
import 'package:spira/feature/domain/entities/smoking_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:spira/feature/domain/usecases/delete_genders_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_health_perceptions_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_hospitalization_locations_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_nicotine_amounts_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_respiratory_failures_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_smokers_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_smoking_cessation_times_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_smoking_types_usecase.dart';
import 'package:spira/feature/domain/usecases/delete_study_lines_usecase.dart';
import 'package:spira/feature/domain/usecases/get_genders_usecase.dart';
import 'package:spira/feature/domain/usecases/get_health_perceptions_usecase.dart';
import 'package:spira/feature/domain/usecases/get_hospitalization_locations_usecase.dart';
import 'package:spira/feature/domain/usecases/get_nicotine_amounts_usecase.dart';
import 'package:spira/feature/domain/usecases/get_respiratory_failures_usecase.dart';
import 'package:spira/feature/domain/usecases/get_smokers_usecase.dart';
import 'package:spira/feature/domain/usecases/get_smoking_cessation_times_usecase.dart';
import 'package:spira/feature/domain/usecases/get_smoking_types_usecase.dart';
import 'package:spira/feature/domain/usecases/get_study_lines_usecase.dart';
import 'package:spira/feature/domain/usecases/post_genders_usecase.dart';
import 'package:spira/feature/domain/usecases/post_health_perceptions_usecase.dart';
import 'package:spira/feature/domain/usecases/post_hospitalization_locations_usecase.dart';
import 'package:spira/feature/domain/usecases/post_nicotine_amounts_usecase.dart';
import 'package:spira/feature/domain/usecases/post_respiratory_failures_usecase.dart';
import 'package:spira/feature/domain/usecases/post_smokers_usecase.dart';
import 'package:spira/feature/domain/usecases/post_smoking_cessation_times_usecase.dart';
import 'package:spira/feature/domain/usecases/post_smoking_types_usecase.dart';
import 'package:spira/feature/domain/usecases/post_study_lines_usecase.dart';

part 'manage_fields_state.dart';

class ManageFieldsCubit extends Cubit<ManageFieldsState> {
  ManageFieldsCubit() : super(ManageFieldsState());

  // General
  TextEditingController genderController = TextEditingController();
  TextEditingController smokingOptionController = TextEditingController();
  TextEditingController studyLineController = TextEditingController();

  // Respiratory Insufficiency
  TextEditingController hospitalizationLocationController =
      TextEditingController();
  TextEditingController respiratoryInsufficiencyTypeController =
      TextEditingController();

  // Smoking
  TextEditingController smokingTypeController = TextEditingController();
  TextEditingController nicotineAmountController = TextEditingController();
  TextEditingController cessationTimeController = TextEditingController();
  TextEditingController healthPerceptionController = TextEditingController();

  Future<void> fetchGeneralFields() async {
    try {
      emit(state.copyWith(loadState: GenericLoadState.loading));
      List<GenderEntity> genderList =
          await GetIt.I.get<GetGendersUseCase>().call();
      List<SmokerEntity> smokerList =
          await GetIt.I.get<GetSmokersUseCase>().call();
      List<LineOfStudyEntity> studyLineList =
          await GetIt.I.get<GetStudyLinesUseCase>().call();
      emit(state.copyWith(
          loadState: GenericLoadState.success,
          genderEntities: genderList,
          smokingOptionEntities: smokerList,
          studyLineEntities: studyLineList));
    } catch (_) {
      emit(state.copyWith(loadState: GenericLoadState.error));
    }
  }

  Future submitGeneralFields() async {
    List<String> errorList = [];
    await EasyLoading.show();
    for (GenderEntity gender in state.genderToBeAdded) {
      try {
        final response =
            await GetIt.I.get<PostGendersUseCase>().call(gender.name);
        if (response != null && !response.success) {
          errorList.add(
              "Ocorreu um erro ao adicionar a opção de sexo: ${gender.name}");
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao adicionar a opção de sexo: ${gender.name}");
      }
    }
    for (SmokerEntity smoker in state.smokingOptionToBeAdded) {
      try {
        final response =
            await GetIt.I.get<PostSmokersUseCase>().call(smoker.name);
        if (response != null && !response.success) {
          errorList.add(
              "Ocorreu um erro ao adicionar opção de fumante: ${smoker.name}");
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao adicionar opção de fumante: ${smoker.name}");
      }
    }
    for (LineOfStudyEntity studyLine in state.studyLineToBeAdded) {
      try {
        final response =
            await GetIt.I.get<PostStudyLinesUseCase>().call(studyLine.name);
        if (response != null && !response.success) {
          errorList.add(
              "Ocorreu um erro ao adicionar a opção de linha de estudo: ${studyLine.name}");
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao adicionar a opção de linha de estudo: ${studyLine.name}");
      }
    }

    for (GenderEntity gender in state.genderToBeRemoved) {
      try {
        final response =
            await GetIt.I.get<DeleteGendersUseCase>().call(gender.id);
        if (response != null && !response.success) {
          if (response.message.contains("violates foreign key constraint")) {
            errorList.add(
                "Não é possível remover a opção de sexo: ${gender.name}, pois está vinculada a uma coleta.");
          } else {
            errorList.add(
                "Ocorreu um erro ao remover a opção de sexo: ${gender.name}");
          }
        }
      } catch (_) {
        errorList
            .add("Ocorreu um erro ao remover a opção de sexo: ${gender.name}");
      }
    }
    for (SmokerEntity smoker in state.smokingOptionToBeRemoved) {
      try {
        final response =
            await GetIt.I.get<DeleteSmokersUseCase>().call(smoker.id);
        if (response != null && !response.success) {
          if (response.message.contains("violates foreign key constraint")) {
            errorList.add(
                "Não é possível remover a opção de fumante: ${smoker.name}, pois está vinculada a uma coleta.");
          } else {
            errorList.add(
                "Ocorreu um erro ao remover a opção de fumante: ${smoker.name}");
          }
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao remover a opção de fumante: ${smoker.name}");
      }
    }
    for (LineOfStudyEntity studyLine in state.studyLineToBeRemoved) {
      try {
        final response =
            await GetIt.I.get<DeleteStudyLinesUseCase>().call(studyLine.id);
        if (response != null && !response.success) {
          if (response.message.contains("violates foreign key constraint")) {
            errorList.add(
                "Não é possível remover a opção de linha de estudo: ${studyLine.name}, pois está vinculada a uma coleta.");
          } else {
            errorList.add(
                "Ocorreu um erro ao remover a opção de linha de estudo: ${studyLine.name}");
          }
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao remover a opção de linha de estudo: ${studyLine.name}");
      }
    }
    await EasyLoading.dismiss();
    return errorList;
  }

  Future<void> fetchRespiratoryFailureFields() async {
    try {
      emit(state.copyWith(loadState: GenericLoadState.loading));
      List<HospitalizationLocationEntity> hospitalizationLocationList =
          await GetIt.I.get<GetHospitalizationLocationsUseCase>().call();
      List<RespiratoryFailureEntity> respiratoryFailureList =
          await GetIt.I.get<GetRespiratoryFailuresUseCase>().call();
      emit(state.copyWith(
          loadState: GenericLoadState.success,
          hospitalizationLocationEntities: hospitalizationLocationList,
          respiratoryInsufficiencyTypeEntities: respiratoryFailureList));
    } catch (_) {
      emit(state.copyWith(loadState: GenericLoadState.error));
    }
  }

  Future submitRespiratoryFailureFields() async {
    List<String> errorList = [];
    await EasyLoading.show();
    for (HospitalizationLocationEntity location
        in state.hospitalizationLocationToBeAdded) {
      try {
        final response = await GetIt.I
            .get<PostHospitalizationLocationsUseCase>()
            .call(location.name);
        if (response != null && !response.success) {
          errorList.add(
              "Ocorreu um erro ao adicionar a opção de local de internação: ${location.name}");
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao adicionar a opção de local de internação: ${location.name}");
      }
    }
    for (RespiratoryFailureEntity type
        in state.respiratoryInsufficiencyTypeToBeAdded) {
      try {
        final response =
            await GetIt.I.get<PostRespiratoryFailuresUseCase>().call(type.name);
        if (response != null && !response.success) {
          errorList.add(
              "Ocorreu um erro ao adicionar a opção de insuficiência respiratória: ${type.name}");
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao adicionar a opção de insuficiência respiratória: ${type.name}");
      }
    }

    for (HospitalizationLocationEntity location
        in state.hospitalizationLocationToBeRemoved) {
      try {
        final response = await GetIt.I
            .get<DeleteHospitalizationLocationsUseCase>()
            .call(location.id);
        if (response != null && !response.success) {
          if (response.message.contains("violates foreign key constraint")) {
            errorList.add(
                "Não é possível remover a opção de local de internação: ${location.name}, pois está vinculada a uma coleta.");
          } else {
            errorList.add(
                "Ocorreu um erro ao remover a opção de local de internação: ${location.name}");
          }
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao remover a opção de local de internação: ${location.name}");
      }
    }
    for (RespiratoryFailureEntity type
        in state.respiratoryInsufficiencyTypeToBeRemoved) {
      try {
        final response =
            await GetIt.I.get<DeleteRespiratoryFailuresUseCase>().call(type.id);
        if (response != null && !response.success) {
          if (response.message.contains("violates foreign key constraint")) {
            errorList.add(
                "Não é possível remover a opção de insuficiência respiratória: ${type.name}, pois está vinculada a uma coleta.");
          } else {
            errorList.add(
                "Ocorreu um erro ao remover a opção de insuficiência respiratória: ${type.name}");
          }
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao remover a opção de insuficiência respiratória: ${type.name}");
      }
    }
    await EasyLoading.dismiss();
    return errorList;
  }

  Future<void> fetchSmokingFields() async {
    try {
      emit(state.copyWith(loadState: GenericLoadState.loading));
      List<SmokingEntity> smokingTypeList =
          await GetIt.I.get<GetSmokingTypesUseCase>().call();
      List<NicotineAmountEntity> nicotineAmountList =
          await GetIt.I.get<GetNicotineAmountsUseCase>().call();
      List<SmokingCessationEntity> cessationTimeList =
          await GetIt.I.get<GetSmokingCessationTimesUseCase>().call();
      List<HealthPerceptionEntity> healthPerceptionList =
          await GetIt.I.get<GetHealthPerceptionsUseCase>().call();
      emit(state.copyWith(
          loadState: GenericLoadState.success,
          smokingTypeEntities: smokingTypeList,
          nicotineAmountEntities: nicotineAmountList,
          cessationTimeEntities: cessationTimeList,
          healthPerceptionEntities: healthPerceptionList));
    } catch (_) {
      emit(state.copyWith(loadState: GenericLoadState.error));
    }
  }

  Future submitSmokingFields() async {
    List<String> errorList = [];
    await EasyLoading.show();
    for (SmokingEntity type in state.smokingTypeToBeAdded) {
      try {
        final response =
            await GetIt.I.get<PostSmokingTypesUseCase>().call(type.name);
        if (response != null && !response.success) {
          errorList.add(
              "Ocorreu um erro ao adicionar a opção de tipo de tabagismo: ${type.name}");
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao adicionar a opção de tipo de tabagismo: ${type.name}");
      }
    }
    for (NicotineAmountEntity amount in state.nicotineAmountToBeAdded) {
      try {
        final response =
            await GetIt.I.get<PostNicotineAmountsUseCase>().call(amount.name);
        if (response != null && !response.success) {
          errorList.add(
              "Ocorreu um erro ao adicionar a opção de quantidade de nicotina: ${amount.name}");
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao adicionar a opção de quantidade de nicotina: ${amount.name}");
      }
    }
    for (SmokingCessationEntity time in state.cessationTimeToBeAdded) {
      try {
        final response = await GetIt.I
            .get<PostSmokingCessationTimesUseCase>()
            .call(time.name);
        if (response != null && !response.success) {
          errorList.add(
              "Ocorreu um erro ao adicionar a opção de tempo de cessação: ${time.name}");
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao adicionar a opção de tempo de cessação: ${time.name}");
      }
    }
    for (HealthPerceptionEntity perception in state.healthPerceptionToBeAdded) {
      try {
        final response = await GetIt.I
            .get<PostHealthPerceptionsUseCase>()
            .call(perception.name);
        if (response != null && !response.success) {
          errorList.add(
              "Ocorreu um erro ao adicionar a opção de percepção de saúde: ${perception.name}");
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao adicionar a opção de percepção de saúde: ${perception.name}");
      }
    }

    for (SmokingEntity type in state.smokingTypeToBeRemoved) {
      try {
        final response =
            await GetIt.I.get<DeleteSmokingTypesUseCase>().call(type.id);
        if (response != null && !response.success) {
          if (response.message.contains("violates foreign key constraint")) {
            errorList.add(
                "Não é possível remover a opção de tipo de tabagismo: ${type.name}, pois está vinculada a uma coleta.");
          } else {
            errorList.add(
                "Ocorreu um erro ao remover a opção de tipo de tabagismo: ${type.name}");
          }
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao remover a opção de tipo de tabagismo: ${type.name}");
      }
    }
    for (NicotineAmountEntity amount in state.nicotineAmountToBeRemoved) {
      try {
        final response =
            await GetIt.I.get<DeleteNicotineAmountsUseCase>().call(amount.id);
        if (response != null && !response.success) {
          if (response.message.contains("violates foreign key constraint")) {
            errorList.add(
                "Não é possível remover a opção de quantidade de nicotina: ${amount.name}, pois está vinculada a uma coleta.");
          } else {
            errorList.add(
                "Ocorreu um erro ao remover a opção de quantidade de nicotina: ${amount.name}");
          }
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao remover a opção de quantidade de nicotina: ${amount.name}");
      }
    }
    for (SmokingCessationEntity time in state.cessationTimeToBeRemoved) {
      try {
        final response = await GetIt.I
            .get<DeleteSmokingCessationTimesUseCase>()
            .call(time.id);
        if (response != null && !response.success) {
          if (response.message.contains("violates foreign key constraint")) {
            errorList.add(
                "Não é possível remover a opção de tempo de cessação: ${time.name}, pois está vinculada a uma coleta.");
          } else {
            errorList.add(
                "Ocorreu um erro ao remover a opção de tempo de cessação: ${time.name}");
          }
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao remover a opção de tempo de cessação: ${time.name}");
      }
    }
    for (HealthPerceptionEntity perception
        in state.healthPerceptionToBeRemoved) {
      try {
        final response = await GetIt.I
            .get<DeleteHealthPerceptionsUseCase>()
            .call(perception.id);
        if (response != null && !response.success) {
          errorList.add(
              "Ocorreu um erro ao remover a opção de percepção de saúde: ${perception.name}");
        }
      } catch (_) {
        errorList.add(
            "Ocorreu um erro ao remover a opção de percepção de saúde: ${perception.name}");
      }
    }
    await EasyLoading.dismiss();
    return errorList;
  }

  void addGender(String gender) {
    if (gender.trim().isEmpty) return;
    List<GenderEntity> genderToBeAdded = List.from(state.genderToBeAdded);
    genderToBeAdded.add(GenderEntity(id: -1, name: gender));
    emit(state.copyWith(genderToBeAdded: genderToBeAdded));
  }

  void removeGender(String gender) {
    if (state.genderToBeAdded.contains(GenderEntity(id: -1, name: gender))) {
      List<GenderEntity> genderToBeAdded = List.from(state.genderToBeAdded);
      genderToBeAdded.removeWhere((element) => element.name == gender);
      emit(state.copyWith(genderToBeAdded: genderToBeAdded));
    } else {
      List<GenderEntity> genderToBeRemoved = List.from(state.genderToBeRemoved);
      GenderEntity? genderEntity = state.genderEntities
          .firstWhereOrNull((element) => element.name == gender);
      if (genderEntity != null) {
        genderToBeRemoved.add(genderEntity);
        emit(state.copyWith(genderToBeRemoved: genderToBeRemoved));
      }
    }
  }

  Map<GenderEntity, bool> getGenderList() {
    List<GenderEntity> rawGenderList = List.from(state.genderEntities);
    rawGenderList.addAll(state.genderToBeAdded);

    Map<GenderEntity, bool> resultMap = {};

    for (GenderEntity item in rawGenderList) {
      resultMap[item] = !state.genderToBeRemoved.contains(item);
    }

    return resultMap;
  }

  void updateGenderList(Map<GenderEntity, bool> genderList) {
    for (GenderEntity key in genderList.keys) {
      if (genderList[key] == false) {
        removeGender(key.name);
      } else {
        List<GenderEntity> list = List.from(state.genderToBeRemoved);
        list.remove(key);
        emit(state.copyWith(genderToBeRemoved: list));
      }
    }
  }

  void addSmokerOption(String option) {
    if (option.trim().isEmpty) return;
    List<SmokerEntity> smokingOptionToBeAdded =
        List.from(state.smokingOptionToBeAdded);
    smokingOptionToBeAdded.add(SmokerEntity(id: -1, name: option));
    emit(state.copyWith(smokingOptionToBeAdded: smokingOptionToBeAdded));
  }

  void removeSmokerOption(String option) {
    SmokerEntity tempSmokerEntity = SmokerEntity(id: -1, name: option);
    if (state.smokingOptionToBeAdded.contains(tempSmokerEntity)) {
      List<SmokerEntity> smokingOptionToBeAdded =
          List.from(state.smokingOptionToBeAdded);
      smokingOptionToBeAdded.removeWhere((element) => element.name == option);
      emit(state.copyWith(smokingOptionToBeAdded: smokingOptionToBeAdded));
    } else {
      List<SmokerEntity> smokingOptionToBeRemoved =
          List.from(state.smokingOptionToBeRemoved);
      SmokerEntity? smokerEntity = state.smokingOptionEntities
          .firstWhereOrNull((element) => element.name == option);
      if (smokerEntity != null) {
        smokingOptionToBeRemoved.add(smokerEntity);
        emit(
            state.copyWith(smokingOptionToBeRemoved: smokingOptionToBeRemoved));
      }
    }
  }

  Map<SmokerEntity, bool> getSmokerOptionList() {
    List<SmokerEntity> rawSmokerList = List.from(state.smokingOptionEntities);
    rawSmokerList.addAll(state.smokingOptionToBeAdded);

    Map<SmokerEntity, bool> resultMap = {};

    for (SmokerEntity item in rawSmokerList) {
      resultMap[item] = !state.smokingOptionToBeRemoved.contains(item);
    }

    return resultMap;
  }

  void updateSmokerOptionList(Map<SmokerEntity, bool> smokerList) {
    for (SmokerEntity key in smokerList.keys) {
      if (smokerList[key] == false) {
        removeSmokerOption(key.name);
      } else {
        List<SmokerEntity> list = List.from(state.smokingOptionToBeRemoved);
        list.remove(key);
        emit(state.copyWith(smokingOptionToBeRemoved: list));
      }
    }
  }

  void addStudyLine(String line) {
    if (line.trim().isEmpty) return;
    List<LineOfStudyEntity> studyLineToBeAdded =
        List.from(state.studyLineToBeAdded);
    studyLineToBeAdded.add(LineOfStudyEntity(id: -1, name: line));
    emit(state.copyWith(studyLineToBeAdded: studyLineToBeAdded));
  }

  void removeStudyLine(String line) {
    LineOfStudyEntity tempStudyLineEntity =
        LineOfStudyEntity(id: -1, name: line);
    if (state.studyLineToBeAdded.contains(tempStudyLineEntity)) {
      List<LineOfStudyEntity> studyLineToBeAdded =
          List.from(state.studyLineToBeAdded);
      studyLineToBeAdded.removeWhere((element) => element.name == line);
      emit(state.copyWith(studyLineToBeAdded: studyLineToBeAdded));
    } else {
      List<LineOfStudyEntity> studyLineToBeRemoved =
          List.from(state.studyLineToBeRemoved);
      LineOfStudyEntity? studyLineEntity = state.studyLineEntities
          .firstWhereOrNull((element) => element.name == line);
      if (studyLineEntity != null) {
        studyLineToBeRemoved.add(studyLineEntity);
        emit(state.copyWith(studyLineToBeRemoved: studyLineToBeRemoved));
      }
    }
  }

  Map<LineOfStudyEntity, bool> getStudyLineList() {
    List<LineOfStudyEntity> rawStudyLineList =
        List.from(state.studyLineEntities);
    rawStudyLineList.addAll(state.studyLineToBeAdded);

    Map<LineOfStudyEntity, bool> resultMap = {};

    for (LineOfStudyEntity item in rawStudyLineList) {
      resultMap[item] = !state.studyLineToBeRemoved.contains(item);
    }

    return resultMap;
  }

  void updateStudyLineList(Map<LineOfStudyEntity, bool> studyLineList) {
    for (LineOfStudyEntity key in studyLineList.keys) {
      if (studyLineList[key] == false) {
        removeStudyLine(key.name);
      } else {
        List<LineOfStudyEntity> list = List.from(state.studyLineToBeRemoved);
        list.remove(key);
        emit(state.copyWith(studyLineToBeRemoved: list));
      }
    }
  }

  void addHospitalizationLocation(String location) {
    if (location.trim().isEmpty) return;
    List<HospitalizationLocationEntity> hospitalizationLocationToBeAdded =
        List.from(state.hospitalizationLocationToBeAdded);
    hospitalizationLocationToBeAdded
        .add(HospitalizationLocationEntity(id: -1, name: location));
    emit(state.copyWith(
        hospitalizationLocationToBeAdded: hospitalizationLocationToBeAdded));
  }

  void removeHospitalizationLocation(String location) {
    HospitalizationLocationEntity tempLocationEntity =
        HospitalizationLocationEntity(id: -1, name: location);
    if (state.hospitalizationLocationToBeAdded.contains(tempLocationEntity)) {
      List<HospitalizationLocationEntity> hospitalizationLocationToBeAdded =
          List.from(state.hospitalizationLocationToBeAdded);
      hospitalizationLocationToBeAdded
          .removeWhere((element) => element.name == location);
      emit(state.copyWith(
          hospitalizationLocationToBeAdded: hospitalizationLocationToBeAdded));
    } else {
      List<HospitalizationLocationEntity> hospitalizationLocationToBeRemoved =
          List.from(state.hospitalizationLocationToBeRemoved);
      HospitalizationLocationEntity? locationEntity = state
          .hospitalizationLocationEntities
          .firstWhereOrNull((element) => element.name == location);
      if (locationEntity != null) {
        hospitalizationLocationToBeRemoved.add(locationEntity);
        emit(state.copyWith(
            hospitalizationLocationToBeRemoved:
                hospitalizationLocationToBeRemoved));
      }
    }
  }

  Map<HospitalizationLocationEntity, bool> getHospitalizationLocationList() {
    List<HospitalizationLocationEntity> rawLocationList =
        List.from(state.hospitalizationLocationEntities);
    rawLocationList.addAll(state.hospitalizationLocationToBeAdded);

    Map<HospitalizationLocationEntity, bool> resultMap = {};

    for (HospitalizationLocationEntity item in rawLocationList) {
      resultMap[item] =
          !state.hospitalizationLocationToBeRemoved.contains(item);
    }

    return resultMap;
  }

  void updateHospitalizationLocationList(
      Map<HospitalizationLocationEntity, bool> locationList) {
    for (HospitalizationLocationEntity key in locationList.keys) {
      if (locationList[key] == false) {
        removeHospitalizationLocation(key.name);
      } else {
        List<HospitalizationLocationEntity> list =
            List.from(state.hospitalizationLocationToBeRemoved);
        list.remove(key);
        emit(state.copyWith(hospitalizationLocationToBeRemoved: list));
      }
    }
  }

  void addRespiratoryInsufficiencyType(String type) {
    if (type.trim().isEmpty) return;
    List<RespiratoryFailureEntity> respiratoryInsufficiencyTypeToBeAdded =
        List.from(state.respiratoryInsufficiencyTypeToBeAdded);
    respiratoryInsufficiencyTypeToBeAdded
        .add(RespiratoryFailureEntity(id: -1, name: type));
    emit(state.copyWith(
        respiratoryInsufficiencyTypeToBeAdded:
            respiratoryInsufficiencyTypeToBeAdded));
  }

  void removeRespiratoryInsufficiencyType(String type) {
    RespiratoryFailureEntity tempTypeEntity =
        RespiratoryFailureEntity(id: -1, name: type);
    if (state.respiratoryInsufficiencyTypeToBeAdded.contains(tempTypeEntity)) {
      List<RespiratoryFailureEntity> respiratoryInsufficiencyTypeToBeAdded =
          List.from(state.respiratoryInsufficiencyTypeToBeAdded);
      respiratoryInsufficiencyTypeToBeAdded
          .removeWhere((element) => element.name == type);
      emit(state.copyWith(
          respiratoryInsufficiencyTypeToBeAdded:
              respiratoryInsufficiencyTypeToBeAdded));
    } else {
      List<RespiratoryFailureEntity> respiratoryInsufficiencyTypeToBeRemoved =
          List.from(state.respiratoryInsufficiencyTypeToBeRemoved);
      RespiratoryFailureEntity? typeEntity = state
          .respiratoryInsufficiencyTypeEntities
          .firstWhereOrNull((element) => element.name == type);
      if (typeEntity != null) {
        respiratoryInsufficiencyTypeToBeRemoved.add(typeEntity);
        emit(state.copyWith(
            respiratoryInsufficiencyTypeToBeRemoved:
                respiratoryInsufficiencyTypeToBeRemoved));
      }
    }
  }

  Map<RespiratoryFailureEntity, bool> getRespiratoryInsufficiencyTypeList() {
    List<RespiratoryFailureEntity> rawTypeList =
        List.from(state.respiratoryInsufficiencyTypeEntities);
    rawTypeList.addAll(state.respiratoryInsufficiencyTypeToBeAdded);

    Map<RespiratoryFailureEntity, bool> resultMap = {};

    for (RespiratoryFailureEntity item in rawTypeList) {
      resultMap[item] =
          !state.respiratoryInsufficiencyTypeToBeRemoved.contains(item);
    }

    return resultMap;
  }

  void updateRespiratoryInsufficiencyTypeList(
      Map<RespiratoryFailureEntity, bool> typeList) {
    for (RespiratoryFailureEntity key in typeList.keys) {
      if (typeList[key] == false) {
        removeRespiratoryInsufficiencyType(key.name);
      } else {
        List<RespiratoryFailureEntity> list =
            List.from(state.respiratoryInsufficiencyTypeToBeRemoved);
        list.remove(key);
        emit(state.copyWith(respiratoryInsufficiencyTypeToBeRemoved: list));
      }
    }
  }

  void addSmokingType(String type) {
    if (type.trim().isEmpty) return;
    List<SmokingEntity> smokingTypeToBeAdded =
        List.from(state.smokingTypeToBeAdded);
    smokingTypeToBeAdded.add(SmokingEntity(id: -1, name: type));
    emit(state.copyWith(smokingTypeToBeAdded: smokingTypeToBeAdded));
  }

  void removeSmokingType(String type) {
    SmokingEntity tempTypeEntity = SmokingEntity(id: -1, name: type);
    if (state.smokingTypeToBeAdded.contains(tempTypeEntity)) {
      List<SmokingEntity> smokingTypeToBeAdded =
          List.from(state.smokingTypeToBeAdded);
      smokingTypeToBeAdded.removeWhere((element) => element.name == type);
      emit(state.copyWith(smokingTypeToBeAdded: smokingTypeToBeAdded));
    } else {
      List<SmokingEntity> smokingTypeToBeRemoved =
          List.from(state.smokingTypeToBeRemoved);
      SmokingEntity? typeEntity = state.smokingTypeEntities
          .firstWhereOrNull((element) => element.name == type);
      if (typeEntity != null) {
        smokingTypeToBeRemoved.add(typeEntity);
        emit(state.copyWith(smokingTypeToBeRemoved: smokingTypeToBeRemoved));
      }
    }
  }

  Map<SmokingEntity, bool> getSmokingTypeList() {
    List<SmokingEntity> rawTypeList = List.from(state.smokingTypeEntities);
    rawTypeList.addAll(state.smokingTypeToBeAdded);

    Map<SmokingEntity, bool> resultMap = {};

    for (SmokingEntity item in rawTypeList) {
      resultMap[item] = !state.smokingTypeToBeRemoved.contains(item);
    }

    return resultMap;
  }

  void updateSmokingTypeList(Map<SmokingEntity, bool> typeList) {
    for (SmokingEntity key in typeList.keys) {
      if (typeList[key] == false) {
        removeSmokingType(key.name);
      } else {
        List<SmokingEntity> list = List.from(state.smokingTypeToBeRemoved);
        list.remove(key);
        emit(state.copyWith(smokingTypeToBeRemoved: list));
      }
    }
  }

  void addNicotineAmount(String amount) {
    if (amount.trim().isEmpty) return;
    List<NicotineAmountEntity> nicotineAmountToBeAdded =
        List.from(state.nicotineAmountToBeAdded);
    nicotineAmountToBeAdded.add(NicotineAmountEntity(id: -1, name: amount));
    emit(state.copyWith(nicotineAmountToBeAdded: nicotineAmountToBeAdded));
  }

  void removeNicotineAmount(String amount) {
    NicotineAmountEntity tempAmountEntity =
        NicotineAmountEntity(id: -1, name: amount);
    if (state.nicotineAmountToBeAdded.contains(tempAmountEntity)) {
      List<NicotineAmountEntity> nicotineAmountToBeAdded =
          List.from(state.nicotineAmountToBeAdded);
      nicotineAmountToBeAdded.removeWhere((element) => element.name == amount);
      emit(state.copyWith(nicotineAmountToBeAdded: nicotineAmountToBeAdded));
    } else {
      List<NicotineAmountEntity> nicotineAmountToBeRemoved =
          List.from(state.nicotineAmountToBeRemoved);
      NicotineAmountEntity? amountEntity = state.nicotineAmountEntities
          .firstWhereOrNull((element) => element.name == amount);
      if (amountEntity != null) {
        nicotineAmountToBeRemoved.add(amountEntity);
        emit(state.copyWith(
            nicotineAmountToBeRemoved: nicotineAmountToBeRemoved));
      }
    }
  }

  Map<NicotineAmountEntity, bool> getNicotineAmountList() {
    List<NicotineAmountEntity> rawAmountList =
        List.from(state.nicotineAmountEntities);
    rawAmountList.addAll(state.nicotineAmountToBeAdded);

    Map<NicotineAmountEntity, bool> resultMap = {};

    for (NicotineAmountEntity item in rawAmountList) {
      resultMap[item] = !state.nicotineAmountToBeRemoved.contains(item);
    }

    return resultMap;
  }

  void updateNicotineAmountList(Map<NicotineAmountEntity, bool> amountList) {
    for (NicotineAmountEntity key in amountList.keys) {
      if (amountList[key] == false) {
        removeNicotineAmount(key.name);
      } else {
        List<NicotineAmountEntity> list =
            List.from(state.nicotineAmountToBeRemoved);
        list.remove(key);
        emit(state.copyWith(nicotineAmountToBeRemoved: list));
      }
    }
  }

  void addCessationTime(String time) {
    if (time.trim().isEmpty) return;
    List<SmokingCessationEntity> cessationTimeToBeAdded =
        List.from(state.cessationTimeToBeAdded);
    cessationTimeToBeAdded.add(SmokingCessationEntity(id: -1, name: time));
    emit(state.copyWith(cessationTimeToBeAdded: cessationTimeToBeAdded));
  }

  void removeCessationTime(String time) {
    SmokingCessationEntity tempTimeEntity =
        SmokingCessationEntity(id: -1, name: time);
    if (state.cessationTimeToBeAdded.contains(tempTimeEntity)) {
      List<SmokingCessationEntity> cessationTimeToBeAdded =
          List.from(state.cessationTimeToBeAdded);
      cessationTimeToBeAdded.removeWhere((element) => element.name == time);
      emit(state.copyWith(cessationTimeToBeAdded: cessationTimeToBeAdded));
    } else {
      List<SmokingCessationEntity> cessationTimeToBeRemoved =
          List.from(state.cessationTimeToBeRemoved);
      SmokingCessationEntity? timeEntity = state.cessationTimeEntities
          .firstWhereOrNull((element) => element.name == time);
      if (timeEntity != null) {
        cessationTimeToBeRemoved.add(timeEntity);
        emit(
            state.copyWith(cessationTimeToBeRemoved: cessationTimeToBeRemoved));
      }
    }
  }

  Map<SmokingCessationEntity, bool> getCessationTimeList() {
    List<SmokingCessationEntity> rawTimeList =
        List.from(state.cessationTimeEntities);
    rawTimeList.addAll(state.cessationTimeToBeAdded);

    Map<SmokingCessationEntity, bool> resultMap = {};

    for (SmokingCessationEntity item in rawTimeList) {
      resultMap[item] = !state.cessationTimeToBeRemoved.contains(item);
    }

    return resultMap;
  }

  void updateCessationTimeList(Map<SmokingCessationEntity, bool> timeList) {
    for (SmokingCessationEntity key in timeList.keys) {
      if (timeList[key] == false) {
        removeCessationTime(key.name);
      } else {
        List<SmokingCessationEntity> list =
            List.from(state.cessationTimeToBeRemoved);
        list.remove(key);
        emit(state.copyWith(cessationTimeToBeRemoved: list));
      }
    }
  }

  void addHealthPerception(String perception) {
    if (perception.trim().isEmpty) return;
    List<HealthPerceptionEntity> healthPerceptionToBeAdded =
        List.from(state.healthPerceptionToBeAdded);
    healthPerceptionToBeAdded
        .add(HealthPerceptionEntity(id: -1, name: perception));
    emit(state.copyWith(healthPerceptionToBeAdded: healthPerceptionToBeAdded));
  }

  void removeHealthPerception(String perception) {
    HealthPerceptionEntity tempPerceptionEntity =
        HealthPerceptionEntity(id: -1, name: perception);
    if (state.healthPerceptionToBeAdded.contains(tempPerceptionEntity)) {
      List<HealthPerceptionEntity> healthPerceptionToBeAdded =
          List.from(state.healthPerceptionToBeAdded);
      healthPerceptionToBeAdded
          .removeWhere((element) => element.name == perception);
      emit(
          state.copyWith(healthPerceptionToBeAdded: healthPerceptionToBeAdded));
    } else {
      List<HealthPerceptionEntity> healthPerceptionToBeRemoved =
          List.from(state.healthPerceptionToBeRemoved);
      HealthPerceptionEntity? perceptionEntity = state.healthPerceptionEntities
          .firstWhereOrNull((element) => element.name == perception);
      if (perceptionEntity != null) {
        healthPerceptionToBeRemoved.add(perceptionEntity);
        emit(state.copyWith(
            healthPerceptionToBeRemoved: healthPerceptionToBeRemoved));
      }
    }
  }

  Map<HealthPerceptionEntity, bool> getHealthPerceptionList() {
    List<HealthPerceptionEntity> rawPerceptionList =
        List.from(state.healthPerceptionEntities);
    rawPerceptionList.addAll(state.healthPerceptionToBeAdded);

    Map<HealthPerceptionEntity, bool> resultMap = {};

    for (HealthPerceptionEntity item in rawPerceptionList) {
      resultMap[item] = !state.healthPerceptionToBeRemoved.contains(item);
    }

    return resultMap;
  }

  void updateHealthPerceptionList(
      Map<HealthPerceptionEntity, bool> perceptionList) {
    for (HealthPerceptionEntity key in perceptionList.keys) {
      if (perceptionList[key] == false) {
        removeHealthPerception(key.name);
      } else {
        List<HealthPerceptionEntity> list =
            List.from(state.healthPerceptionToBeRemoved);
        list.remove(key);
        emit(state.copyWith(healthPerceptionToBeRemoved: list));
      }
    }
  }
}
