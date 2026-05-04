import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/categories/data/datasource/category_ds.dart';
import 'package:souqly/features/categories/data/models/CategoryResponse.dart';
import 'package:souqly/features/categories/domain/repo/category_repo.dart';
@Injectable(as: CategoryRepo)
class CategoryRepoImpl implements CategoryRepo{
  CategoryDs categoryDs;
  CategoryRepoImpl(this.categoryDs);
  @override
  Future<CategoryResponse> getAllCategories() async{
    try{
      var response=await categoryDs.getAllCategories();
      return response;
    }catch (e){
      throw GeneralException("Something went wrong");
    }
  }
}