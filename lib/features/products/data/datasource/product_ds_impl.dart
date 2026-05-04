import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/api_manager.dart';
import 'package:souqly/core/Api/end_point.dart';
import 'package:souqly/features/products/data/datasource/Product_ds.dart';
import 'package:souqly/features/products/data/models/ProductResponse.dart';
@Injectable(as: ProductDs)
class ProductDsImpl implements ProductDs{
  ApiManager apiManager;
  ProductDsImpl(this.apiManager);
  @override
  Future<ProductResponse> getAllProducts(String catId) async{
   try{
    var response=await apiManager.get(endpoint: EndPoint.products,
        queryParameters: {'category_id': catId}
    );
    return ProductResponse.fromJson(response.data);
   }catch(e){
      rethrow;
   }
  }
}