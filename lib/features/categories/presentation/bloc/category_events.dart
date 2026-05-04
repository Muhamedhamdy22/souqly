abstract class CategoryEvents {}

class GetCategoriesEvent extends CategoryEvents {}

class ChangeSelectedCategoryIndexEvent extends CategoryEvents {
  final int index;

  ChangeSelectedCategoryIndexEvent(this.index);
}



