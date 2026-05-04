class CategoriesResponse {
  List<CategoryModel>? data;
  int? count;

  CategoriesResponse({this.data, this.count});

  CategoriesResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) => data?.add(CategoryModel.fromJson(v)));
    }
    count = json['count'];
  }
}

class CategoryModel {
  int? id;
  String? name;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryModel({this.id, this.name, this.description, this.image, this.createdAt, this.updatedAt});

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class ProductsResponse {
  List<ProductModel>? data;
  int? total;
  int? currentPage;
  int? lastPage;
  String? nextPageUrl;

  ProductsResponse({this.data, this.total, this.currentPage, this.lastPage, this.nextPageUrl});

  ProductsResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) => data?.add(ProductModel.fromJson(v)));
    }
    total = json['total'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    nextPageUrl = json['next_page_url'];
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  String? price;
  String? sku;
  int? categoryId;
  String? image;
  bool? isActive;
  CategoryModel? category;
  StockModel? stock;

  ProductModel({
    this.id, this.name, this.description, this.price,
    this.sku, this.categoryId, this.image, this.isActive,
    this.category, this.stock,
  });

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    sku = json['sku'];
    categoryId = json['category_id'];
    image = json['image'];
    isActive = json['is_active'];
    category = json['category'] != null ? CategoryModel.fromJson(json['category']) : null;
    stock = json['stock'] != null ? StockModel.fromJson(json['stock']) : null;
  }
}

class StockModel {
  int? id;
  int? productId;
  int? quantity;
  int? minQuantity;
  int? maxQuantity;

  StockModel({this.id, this.productId, this.quantity, this.minQuantity, this.maxQuantity});

  StockModel.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    minQuantity = json['min_quantity'];
    maxQuantity = json['max_quantity'];
  }
}