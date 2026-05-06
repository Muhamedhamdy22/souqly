import 'package:souqly/features/orders/data/models/order_response.dart';

enum OrderStatus { init, loading, success, error }

class OrderState {
  OrderStatus getOrdersStatus;
  OrderStatus createOrderStatus;
  OrdersResponse? ordersResponse;
  OrderModel? selectedOrder;
  String? errorMessage;

  OrderState({
    this.getOrdersStatus = OrderStatus.init,
    this.createOrderStatus = OrderStatus.init,
    this.ordersResponse,
    this.selectedOrder,
    this.errorMessage,
  });

  OrderState copyWith({
    OrderStatus? getOrdersStatus,
    OrderStatus? createOrderStatus,
    OrdersResponse? ordersResponse,
    OrderModel? selectedOrder,
    String? errorMessage,
  }) {
    return OrderState(
      getOrdersStatus: getOrdersStatus ?? this.getOrdersStatus,
      createOrderStatus: createOrderStatus ?? this.createOrderStatus,
      ordersResponse: ordersResponse ?? this.ordersResponse,
      selectedOrder: selectedOrder ?? this.selectedOrder,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}