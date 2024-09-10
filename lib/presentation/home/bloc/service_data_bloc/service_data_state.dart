part of 'service_data_bloc.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object> get props => [];
}

class ServiceInitial extends ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceLoaded extends ServiceState {
  final List<ServiceModels> serviceData;

  const ServiceLoaded(this.serviceData);

  @override
  List<Object> get props => [serviceData];
}

class ServiceError extends ServiceState {
  final String message;
  final int code;

  const ServiceError(this.message, this.code);

  @override
  List<Object> get props => [message];
}
