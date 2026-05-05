abstract class HomeEvents {}

class GetCategories extends HomeEvents {}

class GetProducts extends HomeEvents {}

class CarouselIndexChanged extends HomeEvents {
  final int index;
  CarouselIndexChanged(this.index);
}