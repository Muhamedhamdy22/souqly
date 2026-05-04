import 'package:injectable/injectable.dart';
import 'package:souqly/features/home/data/models/HomeResponse.dart';
import 'package:souqly/features/home/domain/repo/home_repo.dart';
@injectable
class HomeUseCase {
  HomeRepo homeRepo;
  HomeUseCase(this.homeRepo);

  Future<HomeResponse> call(){
    return homeRepo.getCategories();
  }
}