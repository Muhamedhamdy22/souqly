import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/api_manager.dart';
import 'package:souqly/core/Api/end_point.dart';
import 'package:souqly/core/cache_helper/cache_helper.dart';
import 'package:souqly/features/cart/data/datasource/cart_ds.dart';
import 'package:souqly/features/cart/data/models/CartResponse.dart';

@Injectable(as: CartDs)
class CartDsImpl implements CartDs {
  ApiManager apiManager;
  CacheHelper cacheHelper;

  CartDsImpl(this.apiManager, this.cacheHelper);

  Options get _authOptions {
    final token = cacheHelper.getString("token");
    return Options(
      headers: {"Authorization": "Bearer $token"},
    );
  }

  @override
  Future<CartResponse> getCart() async {
    try {
      var response = await apiManager.get(
        endpoint: EndPoint.cart,
        options: _authOptions,
      );
      return CartResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> addToCart(String productId) async {
    try {
      var response = await apiManager.post(
        endpoint: EndPoint.cart,
        data: {"product_id": productId, "quantity": 1},
        options: _authOptions,
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateCartItem(int itemId, int quantity) async {
    try {
      var response = await apiManager.put(
        endpoint: "${EndPoint.cart}/$itemId",
        data: {"quantity": quantity},
        options: _authOptions,
      );
      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> removeCartItem(int itemId) async {
    try {
      var response = await apiManager.delete(
        endpoint: "${EndPoint.cart}/$itemId",
        options: _authOptions,
      );
      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> clearCart() async {
    try {
      var response = await apiManager.delete(
        endpoint: EndPoint.cart,
        options: _authOptions,
      );
      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }
}