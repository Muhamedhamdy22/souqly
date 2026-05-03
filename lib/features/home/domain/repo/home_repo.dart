import 'package:souqly/features/home/data/models/HomeResponse.dart';

abstract class HomeRepo {

  Future<HomeResponse> getCategories();
}