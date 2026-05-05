import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/home/data/models/HomeResponse.dart';

class HomeState {
  RequestStatus? getCategoriesRequestStatus;
  RequestStatus? getProductsRequestStatus;
  CategoriesResponse? categoriesModel;
  ProductsResponse? productsModel;
  String? errorMessage;

  HomeState({
    this.getCategoriesRequestStatus = RequestStatus.init,
    this.getProductsRequestStatus = RequestStatus.init,
    this.categoriesModel,
    this.productsModel,
    this.errorMessage,
  });

  HomeState copyWith({
    RequestStatus? getCategoriesRequestStatus,
    RequestStatus? getProductsRequestStatus,
    CategoriesResponse? categoriesModel,
    ProductsResponse? productsModel,
    String? errorMessage,
  }) {
    return HomeState(
      getCategoriesRequestStatus: getCategoriesRequestStatus ?? this.getCategoriesRequestStatus,
      getProductsRequestStatus: getProductsRequestStatus ?? this.getProductsRequestStatus,
      categoriesModel: categoriesModel ?? this.categoriesModel,
      productsModel: productsModel ?? this.productsModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}