class CartResponse {
  List<CartItem>? items;
  String? total;

  CartResponse({this.items, this.total});

  CartResponse.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) => items?.add(CartItem.fromJson(v)));
    }
    total = json['total']?.toString();
  }
}

class CartItem {
  int? id;
  int? userId;
  int? productId;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  CartProduct? product;

  CartItem({this.id, this.userId, this.productId, this.quantity, this.product});

  CartItem.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null ? CartProduct.fromJson(json['product']) : null;
  }
}

class CartProduct {
  int? id;
  String? name;
  String? description;
  String? price;
  String? sku;
  int? categoryId;
  dynamic image;
  bool? isActive;

  CartProduct({this.id, this.name, this.description, this.price, this.sku,
    this.categoryId, this.image, this.isActive});

  CartProduct.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    sku = json['sku'];
    categoryId = json['category_id'];
    image = json['image'];
    isActive = json['is_active'];
  }
}