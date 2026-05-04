import 'package:souqly/features/categories/data/models/CategoryResponse.dart';

abstract class CategoryRepo {
 Future<CategoryResponse> getAllCategories();
}