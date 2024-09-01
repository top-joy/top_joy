import 'dart:convert';
import '../../service_data/models/service_models.dart';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  final int count;
  final List<Banner> banners;

  BannerModel({
    required this.count,
    required this.banners,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    try {
      return BannerModel(
        count: json["count"] ?? 0,
        banners: List<Banner>.from(
          json["banners"]?.map((x) => Banner.fromJson(x)) ?? [],
        ),
      );
    } catch (e) {
      throw FormatException("Invalid format for BannerModel", e);
    }
  }

  Map<String, dynamic> toJson() => {
        "count": count,
        "banners": banners.map((x) => x.toJson()).toList(),
      };
}

class Banner {
  final String id;
  final String serviceId;
  final String url;
  final ServiceModels? service;
  final String createdAt;
  final String updatedAt;

  Banner({
    required this.id,
    required this.serviceId,
    required this.url,
    this.service,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    try {
      return Banner(
        id: json["id"] ?? '',
        serviceId: json["service_id"] ?? '',
        url: json["url"] ?? '',
        service:
            json["service"] != null ? ServiceModels.fromJson(json["service"]) : null,
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
      );
    } catch (e) {
      throw FormatException("Invalid format for Banner", e);
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_id": serviceId,
        "url": url,
        "service": service?.toJson(),
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
