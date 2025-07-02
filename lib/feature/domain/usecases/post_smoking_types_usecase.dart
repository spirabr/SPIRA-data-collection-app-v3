import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class PostSmokingTypesUseCase {
  final RemoteDataSource remoteDataSource;

  PostSmokingTypesUseCase({required this.remoteDataSource});

  Future<GenericResponseEntity?> call(String name) async {
    try {
      return remoteDataSource.postSmokingType(name);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
