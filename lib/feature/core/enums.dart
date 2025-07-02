enum GenericLoadState {
  initial,
  loading,
  success,
  error,
  idle,
  unauthenticated,
}

enum DataCollectionStep {
  patientDataStepOne,
  patientDataStepTwo,
  patientDataStepThree,
  lineOfStudy,
  respiratoryFailure,
  smokingType,
  traditionalSmoking,
  electronicSmoking,
  bothTraditionalSmoking,
  bothElectronicSmoking,
  smokingLastStep,
  asthmaTraditionalSmoking,
  asthmaElectronicSmoking,
  controlTraditionalSmoking,
  controlElectronicSmoking,
  ambientNoise,
  sustentainedVowel,
  phrase,
  rhyme,
  submitData,
  processing,
  onlineSuccess,
  offlineSuccess,
}

enum InputType {
  text,
  number,
  decimal,
  email,
}

enum TwoTextFieldsType {
  slash,
  time,
}

enum SmokingFromOption {
  traditional,
  electronic,
  both,
  asthma,
  control,
}

enum AudioRecorderType {
  test,
  ambientNoise,
  sustentainedVowel,
  phrase,
  rhyme,
}

enum ModalStyle {
  blue,
  red,
}

enum SubmitLoadState {
  initial,
  loading,
  error,
  errorAmbientNoise,
  errorSustentainedVowel,
  errorPhrase,
  errorRhyme,
  errorOffline,
  successOnline,
  successOffline,
  unauthenticated,
}

enum UserManagementTab {
  active,
  inactive,
}

enum UserDetailsFrom {
  userManagement,
  profile,
  register,
  editUser,
  editProfile,
}

enum AppBarBackButtonStyle {
  trashCan,
  backArrow,
}
