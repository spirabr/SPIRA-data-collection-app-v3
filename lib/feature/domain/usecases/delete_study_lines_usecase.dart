import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class DeleteStudyLinesUseCase {
  final RemoteDataSource remoteDataSource;

  DeleteStudyLinesUseCase({required this.remoteDataSource});

  Future<GenericResponseEntity?> call(int id) async {
    try {
      return remoteDataSource.deleteStudyLine(id);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
