import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/cart/data/datasource/cart_ds.dart';
import 'package:souqly/features/cart/domain/repo/cart_repo.dart';

class CartRepoImpl implements CartRepo{
  CartDs cartDs;
  CartRepoImpl(this.cartDs);
  @override
  Future<bool> addToCart(String productId) {
   try{
      var response = cartDs.addToCart(productId);
      return response;
   }catch(e){
     throw GeneralException("Something went wrong");
   }
  }
}