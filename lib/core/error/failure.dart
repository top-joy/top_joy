import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  final int code;

  const Failure(this.message, {this.code = 0});
}

class DioFailure extends Failure {
  final DioExceptionType errorType;

  const DioFailure(super.message, this.errorType, {super.code});
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message, {super.code});
}

class LocationFailure extends Failure {
  LocationFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.code});
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message, {super.code});
}
