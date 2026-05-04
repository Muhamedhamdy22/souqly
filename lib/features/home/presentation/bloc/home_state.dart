import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/home/data/models/HomeResponse.dart';

class HomeState {
  RequestStatus? getCategoriesRequestStatus;
  HomeResponse? model;
  String? errorMessage;
  HomeState({
    this.getCategoriesRequestStatus=RequestStatus.init,
    this.model,
    this.errorMessage,
  });

  HomeState copyWith({
    RequestStatus? getCategoriesRequestStatus,
    HomeResponse? model,
    String? errorMessage,
  }) {
    return HomeState(
      getCategoriesRequestStatus: getCategoriesRequestStatus ?? this.getCategoriesRequestStatus,
      model: model ?? this.model,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}