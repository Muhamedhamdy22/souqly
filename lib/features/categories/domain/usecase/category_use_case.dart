import 'package:injectable/injectable.dart';
import 'package:souqly/features/categories/data/models/CategoryResponse.dart';
import 'package:souqly/features/categories/domain/repo/category_repo.dart';
@injectable
class CategoryUseCase {
  CategoryRepo categoryRepo;
  CategoryUseCase(this.categoryRepo);

 Future<CategoryResponse> call(){
    return categoryRepo.getAllCategories();
  }
}