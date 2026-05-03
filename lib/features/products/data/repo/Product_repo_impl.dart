import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/products/data/datasource/Product_ds.dart';
import 'package:souqly/features/products/data/models/ProductResponse.dart';
import 'package:souqly/features/products/domain/repo/product_repo.dart';
@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo{
  ProductDs productDs;
  ProductRepoImpl(this.productDs);
  @override
  Future<ProductResponse> getAllProducts(String catId) async{
    try{
     var response=await productDs.getAllProducts(catId);
      return response;
    }catch(e){
      throw GeneralException("Something went wrong");
    }
  }
}