import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/data/model/request/login_body.dart';
import 'package:spira/feature/domain/entities/login_response_entity.dart';

class PostLoginUseCase {
  final RemoteDataSource remoteDataSource;

  PostLoginUseCase({required this.remoteDataSource});

  Future<LoginResponseEntity?> call(LoginBody body) async {
    try {
      return remoteDataSource.postLogin(body);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
