import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/line_of_study_entity.dart';

class GetStudyLinesUseCase {
  final RemoteDataSource remoteDataSource;

  GetStudyLinesUseCase({
    required this.remoteDataSource,
  });

  Future<List<LineOfStudyEntity>> call() async {
    try {
      return remoteDataSource.getStudyLines();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
