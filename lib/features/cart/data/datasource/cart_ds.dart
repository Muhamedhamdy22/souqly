import 'package:souqly/features/cart/data/models/CartResponse.dart';
abstract class CartDs {
  Future<CartResponse> getCart();
  Future<bool> addToCart(String productId);
  Future<bool> updateCartItem(int itemId, int quantity);
  Future<bool> removeCartItem(int itemId);
  Future<bool> clearCart();
}