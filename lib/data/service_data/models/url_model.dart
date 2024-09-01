class UrlModel {
  final String url;

  const UrlModel({
    required this.url,
  });

  factory UrlModel.fromJson(Map<String, dynamic> json) {
    return UrlModel(
      url: json["url"] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "url": url,
    };
  }
}
