import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/api_manager.dart';
import 'package:souqly/core/Api/end_point.dart';
import 'package:souqly/features/home/data/datasource/home_ds.dart';
import 'package:souqly/features/home/data/models/HomeResponse.dart';
@Injectable(as: HomeDs)
class HomeDsImpl implements HomeDs{
  ApiManager apiManager;
  HomeDsImpl(this.apiManager);
  @override
  Future<HomeResponse> getCategories() async{
    try {
  var response = await apiManager.get(endpoint: EndPoint.categories);
  return HomeResponse.fromJson(response.data);
  }catch(e){
      rethrow;
  }
  }
}