import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/respiratory_failure_entity.dart';

class GetRespiratoryFailuresUseCase {
  final RemoteDataSource remoteDataSource;

  GetRespiratoryFailuresUseCase({
    required this.remoteDataSource,
  });

  Future<List<RespiratoryFailureEntity>> call() async {
    try {
      return remoteDataSource.getRespiratoryFailures();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
