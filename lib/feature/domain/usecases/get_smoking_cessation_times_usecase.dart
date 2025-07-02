import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/smoking_cessation_entity.dart';

class GetSmokingCessationTimesUseCase {
  final RemoteDataSource remoteDataSource;

  GetSmokingCessationTimesUseCase({
    required this.remoteDataSource,
  });

  Future<List<SmokingCessationEntity>> call() async {
    try {
      return remoteDataSource.getSmokingCessationTimes();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
