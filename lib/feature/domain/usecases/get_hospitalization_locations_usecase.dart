import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/hospitalization_location_entity.dart';

class GetHospitalizationLocationsUseCase {
  final RemoteDataSource remoteDataSource;

  GetHospitalizationLocationsUseCase({
    required this.remoteDataSource,
  });

  Future<List<HospitalizationLocationEntity>> call() async {
    try {
      return remoteDataSource.getHospitalizationLocations();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
