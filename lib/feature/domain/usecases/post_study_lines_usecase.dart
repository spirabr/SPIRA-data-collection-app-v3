import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class PostStudyLinesUseCase {
  final RemoteDataSource remoteDataSource;

  PostStudyLinesUseCase({required this.remoteDataSource});

  Future<GenericResponseEntity?> call(String name) async {
    try {
      return remoteDataSource.postStudyLine(name);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
