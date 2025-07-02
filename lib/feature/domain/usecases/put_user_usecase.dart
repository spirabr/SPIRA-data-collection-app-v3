import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/data/model/request/edit_user_body.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class PutUserUseCase {
  final RemoteDataSource remoteDataSource;

  PutUserUseCase({required this.remoteDataSource});

  Future<GenericResponseEntity?> call(EditUserBody body, int id) async {
    try {
      return remoteDataSource.putUser(body, id);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
