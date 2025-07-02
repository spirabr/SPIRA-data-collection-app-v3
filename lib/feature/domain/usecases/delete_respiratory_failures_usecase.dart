import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class DeleteRespiratoryFailuresUseCase {
  final RemoteDataSource remoteDataSource;

  DeleteRespiratoryFailuresUseCase({required this.remoteDataSource});

  Future<GenericResponseEntity?> call(int id) async {
    try {
      return remoteDataSource.deleteRespiratoryFailures(id);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
