import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/api_manager.dart';
import 'package:souqly/core/Api/end_point.dart';
import 'package:souqly/features/categories/data/datasource/category_ds.dart';
import 'package:souqly/features/categories/data/models/CategoryResponse.dart';
@Injectable(as: CategoryDs)
class CategoryDsImpl implements CategoryDs{
  ApiManager apiManager;
  CategoryDsImpl(this.apiManager);
  @override
  Future<CategoryResponse> getAllCategories() async{
    try{
      var response = await apiManager.get(endpoint: EndPoint.categories);
      return CategoryResponse.fromJson(response.data);
    }catch(e){
      rethrow;
    }
  }
}