import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/products/data/models/ProductResponse.dart';

class ProductState {
  RequestStatus? productStatus;
  ProductResponse? productResponse;

  ProductState({this.productStatus = RequestStatus.init, this.productResponse});

  ProductState copyWith({
    RequestStatus? productStatus,
    ProductResponse? productResponse,
  }) {
    return ProductState(
      productStatus: productStatus ?? this.productStatus,
      productResponse: productResponse ?? this.productResponse,
    );
  }
}
