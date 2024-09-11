// import 'package:dartz/dartz.dart';
// import 'package:top_joy/core/error/failure.dart';
// import 'package:top_joy/data/favorite/model/favorite_add_request.dart';
// import '../../../domain/dioClient/repositories/dio_client_repository.dart';

// abstract class FavoriteDataSource {
//   Future<Either<Failure, void>> addFavorite(FavoriteAddRequest request);
//   Future<Either<Failure, void>> deleteFavorite(FavoriteAddRequest request);

// }

// class FavoriteDataSourceImpl extends FavoriteDataSource {
//   final DioClientRepository dioClientRepository;

//   FavoriteDataSourceImpl(this.dioClientRepository);

//   @override
//   Future<Either<Failure, void>> addFavorite(FavoriteAddRequest request) async {
//     try {
//       final response = await dioClientRepository.postData(
//           '/api/v1/favorite', request.toJson());
//       if (response.statusCode == 200) {
//         return const Right(null);
//       } else {
//         return Left(ServerFailure(
//             'Failed to add favorite. Status code: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> deleteFavorite(
//       FavoriteAddRequest request) async {
//     try {
//       final response = await dioClientRepository.deleteData(
//           '/api/v1/favorite?user_id=${request.userId}&service_id=${request.serviceId}');
//       if (response.statusCode == 200) {
//         return const Right(null);
//       } else {
//         return Left(ServerFailure(
//             'Failed to delete favorite. Status code: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
// }
