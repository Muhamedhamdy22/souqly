import 'package:injectable/injectable.dart';
import 'package:souqly/features/cart/domain/repo/cart_repo.dart';
@injectable
class CartUseCase {
  CartRepo cartRepo;
  CartUseCase(this.cartRepo);
 Future<bool> call(String id) => cartRepo.addToCart(id);
}