class ProductResponse {
  ProductResponse({
      this.currentPage, 
      this.data, 
      this.firstPageUrl, 
      this.from, 
      this.lastPage, 
      this.lastPageUrl, 
      this.links, 
      this.nextPageUrl, 
      this.path, 
      this.perPage, 
      this.prevPageUrl, 
      this.to, 
      this.total,});

  ProductResponse.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['last_page'] = lastPage;
    map['last_page_url'] = lastPageUrl;
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    map['total'] = total;
    return map;
  }

}

class Links {
  Links({
      this.url, 
      this.label, 
      this.page, 
      this.active,});

  Links.fromJson(dynamic json) {
    url = json['url'];
    label = json['label'];
    page = json['page'];
    active = json['active'];
  }
  dynamic url;
  String? label;
  dynamic page;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['page'] = page;
    map['active'] = active;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.description, 
      this.price, 
      this.sku, 
      this.categoryId, 
      this.image, 
      this.isActive, 
      this.createdAt, 
      this.updatedAt, 
      this.category, 
      this.stock,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    sku = json['sku'];
    categoryId = json['category_id'];
    image = json['image'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    stock = json['stock'] != null ? Stock.fromJson(json['stock']) : null;
  }
  int? id;
  String? name;
  String? description;
  String? price;
  String? sku;
  int? categoryId;
  dynamic image;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  Category? category;
  Stock? stock;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['sku'] = sku;
    map['category_id'] = categoryId;
    map['image'] = image;
    map['is_active'] = isActive;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (stock != null) {
      map['stock'] = stock?.toJson();
    }
    return map;
  }

}

class Stock {
  Stock({
      this.id, 
      this.productId, 
      this.quantity, 
      this.minQuantity, 
      this.maxQuantity, 
      this.lastRestocked, 
      this.createdAt, 
      this.updatedAt,});

  Stock.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    minQuantity = json['min_quantity'];
    maxQuantity = json['max_quantity'];
    lastRestocked = json['last_restocked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? productId;
  int? quantity;
  int? minQuantity;
  int? maxQuantity;
  String? lastRestocked;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['quantity'] = quantity;
    map['min_quantity'] = minQuantity;
    map['max_quantity'] = maxQuantity;
    map['last_restocked'] = lastRestocked;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Category {
  Category({
      this.id, 
      this.name, 
      this.description, 
      this.image, 
      this.createdAt, 
      this.updatedAt,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? description;
  dynamic image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}