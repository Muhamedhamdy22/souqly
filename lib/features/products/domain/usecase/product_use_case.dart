import 'package:injectable/injectable.dart';
import 'package:souqly/features/products/data/models/ProductResponse.dart';
import 'package:souqly/features/products/domain/repo/product_repo.dart';
@injectable
class ProductUseCase {
  ProductRepo productRepo;
  ProductUseCase(this.productRepo);

 Future<ProductResponse> call(String catId){
    return productRepo.getAllProducts(catId);
  }
}