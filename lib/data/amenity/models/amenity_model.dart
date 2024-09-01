class AmenityModel {
  String? id;
  String? name;
  String? url;
  String? createdAt;
  String? updatedAt;

  AmenityModel({
    this.id,
    this.name,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  factory AmenityModel.fromJson(Map<String, dynamic> json) => AmenityModel(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        url: json["url"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
