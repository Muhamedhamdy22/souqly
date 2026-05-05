import 'package:injectable/injectable.dart';
import 'package:souqly/features/cart/data/models/CartResponse.dart';
import 'package:souqly/features/cart/domain/repo/cart_repo.dart';

@injectable
class CartUseCase {
  CartRepo cartRepo;

  CartUseCase(this.cartRepo);

  Future<CartResponse> getCart() => cartRepo.getCart();
  Future<bool> addToCart(String productId) => cartRepo.addToCart(productId);
  Future<bool> updateCartItem(int itemId, int quantity) => cartRepo.updateCartItem(itemId, quantity);
  Future<bool> removeCartItem(int itemId) => cartRepo.removeCartItem(itemId);
  Future<bool> clearCart() => cartRepo.clearCart();
}