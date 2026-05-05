import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/api_manager.dart';
import 'package:souqly/core/Api/end_point.dart';
import 'package:souqly/core/cache_helper/cache_helper.dart';
import 'package:souqly/features/cart/data/datasource/cart_ds.dart';
@Injectable(as: CartDs)
class CartDsImpl implements CartDs {
  ApiManager apiManager;
  CacheHelper cacheHelper;
  CartDsImpl(this.apiManager , this.cacheHelper);
  @override
  Future<bool> addToCart(String productId) async{
    try {
      var response = await apiManager
          .post(endpoint: EndPoint.cart, data: {"productId": productId},
        options:Options(
          headers: {
            "token": cacheHelper.getString("token"),
          },
        ),
      );
      if(response.data["status"] == "success"){
        return true;
      }else{
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}