import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/gender_entity.dart';

class GetGendersUseCase {
  final RemoteDataSource remoteDataSource;

  GetGendersUseCase({
    required this.remoteDataSource,
  });

  Future<List<GenderEntity>> call() async {
    try {
      return remoteDataSource.getGenders();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
