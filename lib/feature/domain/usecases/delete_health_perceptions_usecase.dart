import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class DeleteHealthPerceptionsUseCase {
  final RemoteDataSource remoteDataSource;

  DeleteHealthPerceptionsUseCase({required this.remoteDataSource});

  Future<GenericResponseEntity?> call(int id) async {
    try {
      return remoteDataSource.deleteHealthPerception(id);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
