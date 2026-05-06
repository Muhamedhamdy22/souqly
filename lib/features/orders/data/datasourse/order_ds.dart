import 'package:souqly/features/orders/data/models/order_response.dart';

abstract class OrderDs {
  Future<OrdersResponse> getOrders();
  Future<OrderModel> getOrder(int id);
  Future<OrderModel> createOrder(CreateOrderRequest request);
}