import 'package:souqly/features/home/data/models/HomeResponse.dart';

abstract class HomeRepo {
  Future<CategoriesResponse> getCategories();
  Future<ProductsResponse> getProducts();
}