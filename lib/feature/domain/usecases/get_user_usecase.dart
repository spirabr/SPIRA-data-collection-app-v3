import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/users_response_entity.dart';

class GetUserUseCase {
  final RemoteDataSource remoteDataSource;

  GetUserUseCase({
    required this.remoteDataSource,
  });

  Future<UsersResponseEntity> call({int page = 0}) async {
    try {
      return remoteDataSource.getUsers(page: page);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
