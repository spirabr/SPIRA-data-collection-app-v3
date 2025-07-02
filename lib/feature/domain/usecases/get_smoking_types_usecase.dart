import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/smoking_entity.dart';

class GetSmokingTypesUseCase {
  final RemoteDataSource remoteDataSource;

  GetSmokingTypesUseCase({
    required this.remoteDataSource,
  });

  Future<List<SmokingEntity>> call() async {
    try {
      return remoteDataSource.getSmokingTypes();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
