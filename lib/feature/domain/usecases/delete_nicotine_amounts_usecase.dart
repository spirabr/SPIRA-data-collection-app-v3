import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class DeleteNicotineAmountsUseCase {
  final RemoteDataSource remoteDataSource;

  DeleteNicotineAmountsUseCase({required this.remoteDataSource});

  Future<GenericResponseEntity?> call(int id) async {
    try {
      return remoteDataSource.deleteNicotineAmount(id);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
