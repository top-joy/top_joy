import '../../amenity/models/amenity_model.dart';
import '../../working_hour/models/working_hour_model.dart';
import 'url_model.dart';

class ServiceModels {
  final String id;
  final String categoryId;
  final String businessMerchantId;
  final String name;
  final String description;
  final int duration;
  final int price;
  final String address;
  final double? latitude;
  final double? longitude;
  final double? distance;
  final List<UrlModel> url;
  final String? thumbnail;
  final List<AmenityModel>? amenities;
  final List<WorkingHourModel>? workingHours;
  final int view;
  final bool book;
  final String createdAt;
  final String? updatedAt;
  final String phone_1;

  ServiceModels({
    required this.id,
    required this.categoryId,
    required this.phone_1,
    required this.businessMerchantId,
    required this.name,
    required this.description,
    required this.duration,
    required this.price,
    required this.address,
    this.latitude,
    this.longitude,
    this.distance,
    required this.url,
    this.thumbnail,
    this.amenities,
    this.workingHours,
    required this.view,
    required this.book,
    required this.createdAt,
    this.updatedAt,
  });

  factory ServiceModels.fromJson(Map<String, dynamic> json) {
    return ServiceModels(
      id: json['id'] ?? '',
      categoryId: json['category_id'] ?? '',
      businessMerchantId: json['business_merchant_id'] ?? '',
      name: json['name'] ?? '',
      phone_1: json['phone_1'] ?? '',
      description: json['description'] ?? '',
      duration: json['duration'] ?? 0,
      price: json['price'] ?? 0,
      address: json['address'] ?? '',
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      distance: json['distance']?.toDouble(),
      url: json['url'] != null
          ? List<UrlModel>.from(json['url'].map((x) => UrlModel.fromJson(x)))
          : [],
      thumbnail: json['thumbnail'],
      amenities: json['amenities'] != null
          ? List<AmenityModel>.from(
              json['amenities'].map((x) => AmenityModel.fromJson(x)))
          : [],
      workingHours: json['working_hours'] != null
          ? List<WorkingHourModel>.from(
              json['working_hours'].map((x) => WorkingHourModel.fromJson(x)))
          : [],
      view: json['view'] ?? 0,
      book: json['book'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'phone_1': phone_1,
      'business_merchant_id': businessMerchantId,
      'name': name,
      'description': description,
      'duration': duration,
      'price': price,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'distance': distance,
      'url': url.map((e) => e.toJson()).toList(),
      'thumbnail': thumbnail,
      'amenities': amenities?.map((e) => e.toJson()).toList(),
      'working_hours': workingHours?.map((e) => e.toJson()).toList(),
      'view': view,
      'book': book,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
