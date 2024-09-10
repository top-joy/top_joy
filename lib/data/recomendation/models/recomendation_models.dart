import 'dart:convert';

import 'package:top_joy/data/service_data/models/service_models.dart';

RecomendationModels recommendationFromJson(String str) =>
    RecomendationModels.fromJson(json.decode(str));

String recommendationToJson(RecomendationModels data) => json.encode(data.toJson());

class RecomendationModels {
  int count;
  List<ServiceModels> services;

  RecomendationModels({
    required this.count,
    required this.services,
  });

  factory RecomendationModels.fromJson(Map<String, dynamic> json) => RecomendationModels(
        count: json["count"],
        services: List<ServiceModels>.from(
            json["services"].map((x) => ServiceModels.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}
