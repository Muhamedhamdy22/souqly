import 'package:souqly/features/categories/data/models/CategoryResponse.dart';

abstract class CategoryDs {
 Future<CategoryResponse> getAllCategories();
}