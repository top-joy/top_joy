import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorHandler {
  static Failure handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.badCertificate:
        return const DioFailure(
          'Sizning ulanishingizda sertifikat bilan bog‘liq muammo mavjud. Iltimos, internet aloqangizni tekshiring.',
          DioExceptionType.badCertificate,
          code: 1001,
        );

      case DioExceptionType.connectionError:
        return const DioFailure(
          'Server bilan bog‘lanishda muammo yuz berdi. Iltimos, birozdan so‘ng yana urinib ko‘ring.',
          DioExceptionType.connectionError,
          code: 500,
        );

      case DioExceptionType.sendTimeout:
        return const DioFailure(
          'Ma’lumotlar yuborishda vaqt tugadi. Iltimos, tarmoqqa ulanishingizni tekshiring va qayta urinib ko‘ring.',
          DioExceptionType.sendTimeout,
          code: 1002,
        );

      case DioExceptionType.receiveTimeout:
        return const DioFailure(
          'Ma’lumotlar qabul qilish vaqti tugadi. Iltimos, qayta urinib ko‘ring.',
          DioExceptionType.receiveTimeout,
          code: 1003,
        );

      case DioExceptionType.cancel:
        return const DioFailure(
          'So‘rov bekor qilindi. Iltimos, yana urinib ko‘ring.',
          DioExceptionType.cancel,
          code: 1004,
        );

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
        return const NetworkFailure(
          'Tarmoq bilan bog‘liq muammo yuz berdi. Iltimos, internet aloqangizni tekshiring va qayta urinib ko‘ring.',
          code: 1005,
        );

      default:
        return const UnexpectedFailure(
          'Noma’lum xatolik yuz berdi. Iltimos, keyinroq yana urinib ko‘ring.',
          code: 1000,
        );
    }
  }

  static Failure handleGenericError(String e) {
    return const UnexpectedFailure(
      'Kutilmagan xatolik yuz berdi. Iltimos, qayta urinib ko‘ring.',
      code: 9999,
    );
  }
}
