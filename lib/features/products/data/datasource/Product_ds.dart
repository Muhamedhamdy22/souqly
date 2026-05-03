import 'package:souqly/features/products/data/models/ProductResponse.dart';

abstract class ProductDs {
 Future<ProductResponse> getAllProducts(String catId);
}