import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/generic_response_entity.dart';

class DeleteHospitalizationLocationsUseCase {
  final RemoteDataSource remoteDataSource;

  DeleteHospitalizationLocationsUseCase({required this.remoteDataSource});

  Future<GenericResponseEntity?> call(int id) async {
    try {
      return remoteDataSource.deleteHospitalizationLocation(id);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
