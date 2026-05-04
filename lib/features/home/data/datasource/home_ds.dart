import 'package:souqly/features/home/data/models/HomeResponse.dart';

abstract class HomeDs {

  Future<HomeResponse> getCategories();
}