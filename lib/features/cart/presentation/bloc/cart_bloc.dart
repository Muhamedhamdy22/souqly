import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/cart/domain/usecase/cart_usecase.dart';
import 'package:souqly/features/cart/presentation/bloc/cart_events.dart';
import 'package:souqly/features/cart/presentation/bloc/cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvents, CartState> {
  CartUseCase cartUseCase;

  CartBloc(this.cartUseCase) : super(CartState()) {
    on<GetCart>(_getCart);
    on<AddToCart>(_addToCart);
    on<UpdateCartItem>(_updateCartItem);
    on<RemoveCartItem>(_removeCartItem);
    on<ClearCart>(_clearCart);
  }

  _getCart(GetCart event, Emitter<CartState> emit) async {
    try {
      emit(state.copyWith(getCartStatus: CartStatus.loading));
      var response = await cartUseCase.getCart();
      emit(state.copyWith(
        getCartStatus: CartStatus.success,
        cartResponse: response,
      ));
    } on BaseException catch (e) {
      emit(state.copyWith(getCartStatus: CartStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(state.copyWith(getCartStatus: CartStatus.error));
    }
  }

  _addToCart(AddToCart event, Emitter<CartState> emit) async {
    try {
      emit(state.copyWith(addToCartStatus: CartStatus.loading));
      await cartUseCase.addToCart(event.productId);
      var response = await cartUseCase.getCart();
      emit(state.copyWith(
        addToCartStatus: CartStatus.success,
        cartResponse: response,
      ));
    } on BaseException catch (e) {
      emit(state.copyWith(addToCartStatus: CartStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(state.copyWith(addToCartStatus: CartStatus.error));
    }
  }

  _updateCartItem(UpdateCartItem event, Emitter<CartState> emit) async {
    try {
      emit(state.copyWith(updateStatus: CartStatus.loading));
      await cartUseCase.updateCartItem(event.itemId, event.quantity);
      var response = await cartUseCase.getCart();
      emit(state.copyWith(
        updateStatus: CartStatus.success,
        cartResponse: response,
      ));
    } on BaseException catch (e) {
      emit(state.copyWith(updateStatus: CartStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(state.copyWith(updateStatus: CartStatus.error));
    }
  }

  _removeCartItem(RemoveCartItem event, Emitter<CartState> emit) async {
    try {
      emit(state.copyWith(removeStatus: CartStatus.loading));
      await cartUseCase.removeCartItem(event.itemId);
      var response = await cartUseCase.getCart();
      emit(state.copyWith(
        removeStatus: CartStatus.success,
        cartResponse: response,
      ));
    } on BaseException catch (e) {
      emit(state.copyWith(removeStatus: CartStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(state.copyWith(removeStatus: CartStatus.error));
    }
  }

  _clearCart(ClearCart event, Emitter<CartState> emit) async {
    try {
      emit(state.copyWith(clearStatus: CartStatus.loading));
      await cartUseCase.clearCart();
      emit(state.copyWith(
        clearStatus: CartStatus.success,
        cartResponse: null,
      ));
    } on BaseException catch (e) {
      emit(state.copyWith(clearStatus: CartStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(state.copyWith(clearStatus: CartStatus.error));
    }
  }
}