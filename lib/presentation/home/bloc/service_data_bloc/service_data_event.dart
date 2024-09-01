part of 'service_data_bloc.dart';


abstract class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

class FetchServiceDataEvent extends ServiceEvent {}
