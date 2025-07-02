import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/data/model/request/new_user_body.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class PostUserUseCase {
  final RemoteDataSource remoteDataSource;

  PostUserUseCase({required this.remoteDataSource});

  Future<GenericResponseEntity?> call(NewUserBody body) async {
    try {
      return remoteDataSource.postUser(body);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
