import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String firstName;

  @HiveField(2)
  String lastName;

  @HiveField(3)
  DateTime birthday;

  @HiveField(4)
  String gender;

  @HiveField(5)
  String phoneNumber;

  @HiveField(6)
  String photo;

  @HiveField(7)
  String createdAt;

  @HiveField(8)
  String updatedAt;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.gender,
    required this.phoneNumber,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        birthday: DateTime.parse(json["birthday"]),
        gender: json["gender"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
        photo: json["photo"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "birthday": birthday.toIso8601String(),
        "gender": gender,
        "phone_number": phoneNumber,
        "photo": photo,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
