// import 'package:dartz/dartz.dart';
// import 'package:hive/hive.dart';
// import 'package:top_joy/data/favorite/model/favorite_model.dart';
// import 'package:top_joy/data/user/models/user_model.dart';
// import 'package:top_joy/injection.dart';
// import '../../../core/error/failure.dart';
// import '../../../domain/dioClient/repositories/dio_client_repository.dart';

// abstract class FavoriteGetSource {
//   Future<Either<Failure, List<FavoriteModel>>> getFavorite();
// }

// class FavoriteGetSourceImpl implements FavoriteGetSource {
//   final DioClientRepository dioClientRepository;

//   FavoriteGetSourceImpl({required this.dioClientRepository});

//   @override
//   Future<Either<Failure, List<FavoriteModel>>> getFavorite() async {
//     try {
//       // `userBox` dan `UserModel` olish
//       final userBox = getIt<Box<UserModel>>();
//       final UserModel? userModel = userBox.get('user');

//       // `userModel` mavjudligini tekshirish
//       if (userModel == null) {
//         return const Left(ServerFailure('User not found in cache'));
//       }

//       // API so'rovi yuborish
//       final response = await dioClientRepository
//           .getData('/api/v1/favorites?user_id=${userModel.id}');

//       // So'rov javobini tekshirish
//       if (response.statusCode == 200) {
//         final data = response.data;

//         if (data is List) {
//           final List<FavoriteModel> favorites = data
//               .map((json) => FavoriteModel.fromJson(json))
//               .toList();
//           return Right(favorites);
//         } else {
//           return const Left(ServerFailure('Unexpected data format'));
//         }
//       } else {
//         return Left(
//             ServerFailure('Failed to load favorites: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
// }
