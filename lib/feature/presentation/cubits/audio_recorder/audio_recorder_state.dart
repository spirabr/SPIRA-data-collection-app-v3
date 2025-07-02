part of 'audio_recorder_cubit.dart';

abstract class AudioRecorderState extends Equatable {
  final int? duration;

  AudioRecorderState({required this.duration});

  List<Object?> get props => [
        duration,
      ];
}

class AudioRecorderInitial extends AudioRecorderState {
  AudioRecorderInitial({super.duration});
}

class AudioRecorderReady extends AudioRecorderState {
  AudioRecorderReady({super.duration});
}

class AudioRecorderRecording extends AudioRecorderState {
  AudioRecorderRecording({super.duration});

  AudioRecorderRecording copyWith({
    int? duration,
  }) {
    return AudioRecorderRecording(
      duration: duration ?? this.duration,
    );
  }

  @override
  List<Object?> get props => [
        duration,
      ];
}

class AudioRecorderStopped extends AudioRecorderState {
  AudioRecorderStopped({super.duration});
}

class AudioPlayerPlaying extends AudioRecorderState {
  AudioPlayerPlaying({super.duration});
}

class AudioPlayerStopped extends AudioRecorderState {
  AudioPlayerStopped({super.duration});
}

class AudioDeniedPermission extends AudioRecorderState {
  final PermissionStatus permissionStatus;

  AudioDeniedPermission({required this.permissionStatus, super.duration});

  AudioDeniedPermission copyWith({
    PermissionStatus? permissionStatus,
    int? duration,
  }) {
    return AudioDeniedPermission(
      permissionStatus: permissionStatus ?? this.permissionStatus,
      duration: duration,
    );
  }

  @override
  List<Object?> get props => [
        permissionStatus,
      ];
}
