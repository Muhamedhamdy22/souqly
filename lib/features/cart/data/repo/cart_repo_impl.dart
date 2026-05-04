import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/cart/data/datasource/cart_ds.dart';
import 'package:souqly/features/cart/data/models/CartResponse.dart';
import 'package:souqly/features/cart/domain/repo/cart_repo.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  CartDs cartDs;

  CartRepoImpl(this.cartDs);

  @override
  Future<CartResponse> getCart() async {
    try {
      return await cartDs.getCart();
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }

  @override
  Future<bool> addToCart(String productId) async {
    try {
      return await cartDs.addToCart(productId);
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }

  @override
  Future<bool> updateCartItem(int itemId, int quantity) async {
    try {
      return await cartDs.updateCartItem(itemId, quantity);
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }

  @override
  Future<bool> removeCartItem(int itemId) async {
    try {
      return await cartDs.removeCartItem(itemId);
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }

  @override
  Future<bool> clearCart() async {
    try {
      return await cartDs.clearCart();
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }
}