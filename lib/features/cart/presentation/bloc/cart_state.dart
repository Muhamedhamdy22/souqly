import 'package:souqly/features/cart/data/models/CartResponse.dart';

enum CartStatus { init, loading, success, error }

class CartState {
  CartStatus getCartStatus;
  CartStatus addToCartStatus;
  CartStatus updateStatus;
  CartStatus removeStatus;
  CartStatus clearStatus;
  CartResponse? cartResponse;
  String? errorMessage;

  CartState({
    this.getCartStatus = CartStatus.init,
    this.addToCartStatus = CartStatus.init,
    this.updateStatus = CartStatus.init,
    this.removeStatus = CartStatus.init,
    this.clearStatus = CartStatus.init,
    this.cartResponse,
    this.errorMessage,
  });

  CartState copyWith({
    CartStatus? getCartStatus,
    CartStatus? addToCartStatus,
    CartStatus? updateStatus,
    CartStatus? removeStatus,
    CartStatus? clearStatus,
    CartResponse? cartResponse,
    String? errorMessage,
  }) {
    return CartState(
      getCartStatus: getCartStatus ?? this.getCartStatus,
      addToCartStatus: addToCartStatus ?? this.addToCartStatus,
      updateStatus: updateStatus ?? this.updateStatus,
      removeStatus: removeStatus ?? this.removeStatus,
      clearStatus: clearStatus ?? this.clearStatus,
      cartResponse: cartResponse ?? this.cartResponse,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}