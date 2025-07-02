import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/smoker_entity.dart';

class GetSmokersUseCase {
  final RemoteDataSource remoteDataSource;

  GetSmokersUseCase({
    required this.remoteDataSource,
  });

  Future<List<SmokerEntity>> call() async {
    try {
      return remoteDataSource.getSmokers();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
