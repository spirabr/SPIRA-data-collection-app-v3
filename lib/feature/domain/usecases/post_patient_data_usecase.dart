import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/data/model/request/patient_model.dart';
import 'package:spira/feature/domain/entities/patient_response_entity.dart';

class PostPatientDataUseCase {
  final RemoteDataSource remoteDataSource;

  PostPatientDataUseCase({required this.remoteDataSource});

  Future<PatientResponseEntity?> call(PatientModel body) async {
    try {
      return remoteDataSource.postPatientData(body);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
