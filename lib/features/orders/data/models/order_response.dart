class OrdersResponse {
  List<OrderModel>? data;
  int? total;
  int? currentPage;
  int? lastPage;

  OrdersResponse({this.data, this.total, this.currentPage, this.lastPage});

  OrdersResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) => data?.add(OrderModel.fromJson(v)));
    }
    total = json['total'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
  }
}

class OrderModel {
  int? id;
  int? userId;
  String? status;
  String? address;
  String? phone;
  String? notes;
  String? paymentMethod;
  String? total;
  String? createdAt;
  List<OrderItem>? items;

  OrderModel({
    this.id, this.userId, this.status, this.address,
    this.phone, this.notes, this.paymentMethod,
    this.total, this.createdAt, this.items,
  });

  OrderModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    address = json['address'];
    phone = json['phone'];
    notes = json['notes'];
    paymentMethod = json['payment_method'];
    total = json['total']?.toString();
    createdAt = json['created_at'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) => items?.add(OrderItem.fromJson(v)));
    }
  }
}

class OrderItem {
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  String? price;
  OrderProduct? product;

  OrderItem({this.id, this.orderId, this.productId, this.quantity, this.price, this.product});

  OrderItem.fromJson(dynamic json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    price = json['price']?.toString();
    product = json['product'] != null ? OrderProduct.fromJson(json['product']) : null;
  }
}

class OrderProduct {
  int? id;
  String? name;
  dynamic image;

  OrderProduct({this.id, this.name, this.image});

  OrderProduct.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}

class CreateOrderRequest {
  String address;
  String phone;
  String paymentMethod;
  String? notes;

  CreateOrderRequest({
    required this.address,
    required this.phone,
    required this.paymentMethod,
    this.notes,
  });

  Map<String, dynamic> toJson() => {
    "address": address,
    "phone": phone,
    "payment_method": paymentMethod,
    if (notes != null) "notes": notes,
  };
}