import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/comorbidity_entity.dart';

class GetComorbitiesUseCase {
  final RemoteDataSource remoteDataSource;

  GetComorbitiesUseCase({required this.remoteDataSource});

  Future<List<ComorbidityEntity?>> call() async {
    try {
      return remoteDataSource.getComorbidities();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
