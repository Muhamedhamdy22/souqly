import 'package:injectable/injectable.dart';
import 'package:souqly/features/orders/data/models/order_response.dart';
import 'package:souqly/features/orders/domain/repo/order_repo.dart';

@injectable
class OrderUseCase {
  OrderRepo orderRepo;

  OrderUseCase(this.orderRepo);

  Future<OrdersResponse> getOrders() => orderRepo.getOrders();
  Future<OrderModel> getOrder(int id) => orderRepo.getOrder(id);
  Future<OrderModel> createOrder(CreateOrderRequest request) => orderRepo.createOrder(request);
}