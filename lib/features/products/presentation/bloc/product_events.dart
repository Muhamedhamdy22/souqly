abstract class ProductEvents {}

class GetProductsEvent extends ProductEvents {
  String catId;

  GetProductsEvent(this.catId);
}