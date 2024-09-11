import 'dart:convert';
import 'package:top_joy/data/service_data/models/service_models.dart';

FavoriteModel favoriteModelFromJson(String str) =>
    FavoriteModel.fromJson(json.decode(str));

String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());

class FavoriteModel {
  final int totalCount;
  final int count;
  final List<ServiceModels?> services;

  FavoriteModel({
    required this.totalCount,
    required this.count,
    required this.services,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      totalCount: json['total_count'] ?? 0,
      count: json["count"] ?? 0,
      services: (json["services"] as List?)
              ?.map(
                  (item) => item == null ? null : ServiceModels.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        "count": count,
        "services": services.map((item) => item?.toJson()).toList(),
      };
}
