import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/Audio_response_entity.dart';

class PostAudioDataUseCase {
  final RemoteDataSource remoteDataSource;

  PostAudioDataUseCase({required this.remoteDataSource});

  Future<AudioResponseEntity?> call(
      int patientId, String audioType, String audioPath) async {
    try {
      return remoteDataSource.postAudio(patientId, audioType, audioPath);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
