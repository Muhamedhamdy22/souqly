import 'package:souqly/features/products/data/models/ProductResponse.dart';

abstract class ProductRepo {
 Future<ProductResponse> getAllProducts(String catId);
}