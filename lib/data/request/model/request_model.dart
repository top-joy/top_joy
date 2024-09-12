import 'package:top_joy/domain/request/entity/request_model_entity.dart';

class RequestModel extends RequestModelEntity {
  RequestModel({
    required super.clientId,
    required super.date,
    required super.endTime,
    required super.price,
    required super.serviceId,
    required super.startTime,
    required super.status,
    required super.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'clientId': clientId,
      'date': date,
      'endTime': endTime,
      'price': price,
      'serviceId': serviceId,
      'startTime': startTime,
      'status': status,
      'userId': userId,
    };
  }
}
