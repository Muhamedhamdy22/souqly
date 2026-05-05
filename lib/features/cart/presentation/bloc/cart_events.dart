abstract class CartEvents {}

class GetCart extends CartEvents {}

class AddToCart extends CartEvents {
  final String productId;
  AddToCart(this.productId);
}

class UpdateCartItem extends CartEvents {
  final int itemId;
  final int quantity;
  UpdateCartItem(this.itemId, this.quantity);
}

class RemoveCartItem extends CartEvents {
  final int itemId;
  RemoveCartItem(this.itemId);
}

class ClearCart extends CartEvents {}