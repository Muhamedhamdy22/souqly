import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/orders/data/datasourse/order_ds.dart';
import 'package:souqly/features/orders/data/models/order_response.dart';
import 'package:souqly/features/orders/domain/repo/order_repo.dart';

@Injectable(as: OrderRepo)
class OrderRepoImpl implements OrderRepo {
  OrderDs orderDs;

  OrderRepoImpl(this.orderDs);

  @override
  Future<OrdersResponse> getOrders() async {
    try {
      return await orderDs.getOrders();
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }

  @override
  Future<OrderModel> getOrder(int id) async {
    try {
      return await orderDs.getOrder(id);
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }

  @override
  Future<OrderModel> createOrder(CreateOrderRequest request) async {
    try {
      return await orderDs.createOrder(request);
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }
}