import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class PostGendersUseCase {
  final RemoteDataSource remoteDataSource;

  PostGendersUseCase({required this.remoteDataSource});

  Future<GenericResponseEntity?> call(String name) async {
    try {
      return remoteDataSource.postGender(name);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
