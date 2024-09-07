import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/domain/service_data/usecase/get_service_data.dart';

part 'service_data_event.dart';
part 'service_data_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final GetServiceDataUsercase _getServiceDataUseCase;

  ServiceBloc({required GetServiceDataUsercase getServiceDataUseCase})
      : _getServiceDataUseCase = getServiceDataUseCase,
        super(ServiceInitial()) {
    on<FetchServiceDataEvent>(_onFetchServiceDataEvent);
  }

  Future<void> _onFetchServiceDataEvent(
      FetchServiceDataEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceLoading());

    final result = await _getServiceDataUseCase.call();

    result.fold(
      (failure) => emit(ServiceError(failure.message,failure.code)),
      (serviceData) => emit(ServiceLoaded(serviceData)),
    );
  }
}
