class WorkingHourModel {
  String day;
  String startTime;
  String endTime;

  WorkingHourModel({
    required this.day,
    required this.startTime,
    required this.endTime,
  });

  factory WorkingHourModel.fromJson(Map<String, dynamic> json) {
    return WorkingHourModel(
      day: json['day'] ?? '',
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'day': day,
        'start_time': startTime,
        'end_time': endTime,
      };
}
