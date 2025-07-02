import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';

class PostLogoutUsecase {
  final RemoteDataSource remoteDataSource;

  PostLogoutUsecase({required this.remoteDataSource});

  Future<void> call() async {
    try {
      return remoteDataSource.postLogout();
    } on DioException catch (_) {}
  }
}
