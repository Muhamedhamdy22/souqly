import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/api_manager.dart';
import 'package:souqly/core/Api/end_point.dart';
import 'package:souqly/core/cache_helper/cache_helper.dart';
import 'package:souqly/features/orders/data/datasourse/order_ds.dart';
import 'package:souqly/features/orders/data/models/order_response.dart';

@Injectable(as: OrderDs)
class OrderDsImpl implements OrderDs {
  ApiManager apiManager;
  CacheHelper cacheHelper;

  OrderDsImpl(this.apiManager, this.cacheHelper);

  Options get _authOptions => Options(
    headers: {"Authorization": "Bearer ${cacheHelper.getString("token")}"},
  );

  @override
  Future<OrdersResponse> getOrders() async {
    try {
      var response = await apiManager.get(
        endpoint: EndPoint.orders,
        options: _authOptions,
      );
      return OrdersResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OrderModel> getOrder(int id) async {
    try {
      var response = await apiManager.get(
        endpoint: "${EndPoint.orders}/$id",
        options: _authOptions,
      );
      return OrderModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OrderModel> createOrder(CreateOrderRequest request) async {
    try {
      var response = await apiManager.post(
        endpoint: EndPoint.orders,
        data: request.toJson(),
        options: _authOptions,
      );
      return OrderModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}