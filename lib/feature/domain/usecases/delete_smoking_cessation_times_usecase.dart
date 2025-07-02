import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class DeleteSmokingCessationTimesUseCase {
  final RemoteDataSource remoteDataSource;

  DeleteSmokingCessationTimesUseCase({required this.remoteDataSource});

  Future<GenericResponseEntity?> call(int id) async {
    try {
      return remoteDataSource.deleteSmokingCessationTime(id);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
