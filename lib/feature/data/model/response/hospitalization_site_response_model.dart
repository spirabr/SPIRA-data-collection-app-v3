import 'package:spira/feature/domain/entities/hospitalization_location_entity.dart';

class HospitalizationSiteModel {
  final int id;
  final String site;

  HospitalizationSiteModel({
    required this.id,
    required this.site,
  });

  factory HospitalizationSiteModel.fromJson(Map<String, dynamic> json) {
    return HospitalizationSiteModel(
      id: json['id'],
      site: json['name'] ?? json['site'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'site': site,
    };
  }

  HospitalizationLocationEntity toEntity() {
    return HospitalizationLocationEntity(
      id: id,
      name: site,
    );
  }

  static HospitalizationSiteModel fromEntity(
      HospitalizationLocationEntity entity) {
    return HospitalizationSiteModel(
      id: entity.id,
      site: entity.name,
    );
  }
}

class HospitalizationSitesResponseModel {
  final bool success;
  final String message;
  final List<HospitalizationSiteModel> data;

  HospitalizationSitesResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory HospitalizationSitesResponseModel.fromJson(
      Map<String, dynamic> json) {
    return HospitalizationSitesResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => HospitalizationSiteModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }

  List<HospitalizationLocationEntity> toEntity() {
    return data.map((item) => item.toEntity()).toList();
  }
}
