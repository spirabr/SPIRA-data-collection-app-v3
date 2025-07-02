import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/health_perception_entity.dart';

class GetHealthPerceptionsUseCase {
  final RemoteDataSource remoteDataSource;

  GetHealthPerceptionsUseCase({
    required this.remoteDataSource,
  });

  Future<List<HealthPerceptionEntity>> call() async {
    try {
      return remoteDataSource.getHealthPerceptions();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
