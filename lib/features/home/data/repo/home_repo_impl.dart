import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/home/data/datasource/home_ds.dart';
import 'package:souqly/features/home/data/models/HomeResponse.dart';
import 'package:souqly/features/home/domain/repo/home_repo.dart';
@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo{
  HomeDs homeDs;
  HomeRepoImpl(this.homeDs);
  @override
  Future<HomeResponse> getCategories() async{
    try{
      var response=await homeDs.getCategories();
      return response;
    }catch(e){
      throw GeneralException("Something went wrong");
    }
  }
}