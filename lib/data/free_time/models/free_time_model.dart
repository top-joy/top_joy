import 'dart:convert';

FreeTimesModel freeTimesModelFromJson(String str) =>
    FreeTimesModel.fromJson(json.decode(str));

String freeTimesModelToJson(FreeTimesModel data) => json.encode(data.toJson());

class FreeTimesModel {
  int count;
  List<FreeTime> freeTimes;

  FreeTimesModel({
    required this.count,
    required this.freeTimes,
  });

  factory FreeTimesModel.fromJson(Map<String, dynamic> json) => FreeTimesModel(
        count: json["count"],
        freeTimes: List<FreeTime>.from(
            json["free_times"].map((x) => FreeTime.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "free_times": List<dynamic>.from(freeTimes.map((x) => x.toJson())),
      };
}

class FreeTime {
  String startTime;
  String endTime;
  bool status;

  FreeTime({
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  factory FreeTime.fromJson(Map<String, dynamic> json) => FreeTime(
        startTime: json["start_time"],
        endTime: json["end_time"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "end_time": endTime,
        "status": status,
      };
}
