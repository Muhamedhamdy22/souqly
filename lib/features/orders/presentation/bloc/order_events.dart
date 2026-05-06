import 'package:souqly/features/orders/data/models/order_response.dart';

abstract class OrderEvents {}

class GetOrders extends OrderEvents {}

class GetOrder extends OrderEvents {
  final int id;
  GetOrder(this.id);
}

class CreateOrder extends OrderEvents {
  final CreateOrderRequest request;
  CreateOrder(this.request);
}