import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class PatchUserUseCase {
  final RemoteDataSource remoteDataSource;

  PatchUserUseCase({required this.remoteDataSource});

  Future<GenericResponseEntity?> call(int id, bool active) async {
    try {
      return remoteDataSource.patchUser(id, active);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
