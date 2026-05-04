import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/home/data/datasource/home_ds.dart';
import 'package:souqly/features/home/data/models/HomeResponse.dart';
import 'package:souqly/features/home/domain/repo/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDs homeDs;
  HomeRepoImpl(this.homeDs);

  @override
  Future<CategoriesResponse> getCategories() async {
    try {
      return await homeDs.getCategories();
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }

  @override
  Future<ProductsResponse> getProducts() async {
    try {
      return await homeDs.getProducts();
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }
}