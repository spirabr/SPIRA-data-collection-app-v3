import 'package:dio/dio.dart';
import 'package:spira/feature/data/datasources/remote/remote_data_source.dart';
import 'package:spira/feature/domain/entities/nicotine_amount_entity.dart';

class GetNicotineAmountsUseCase {
  final RemoteDataSource remoteDataSource;

  GetNicotineAmountsUseCase({
    required this.remoteDataSource,
  });

  Future<List<NicotineAmountEntity>> call() async {
    try {
      return remoteDataSource.getNicotineAmounts();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
