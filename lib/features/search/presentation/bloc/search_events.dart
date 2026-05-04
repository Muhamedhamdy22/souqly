abstract class SearchEvents {}

class LoadAllProducts extends SearchEvents {}

class SearchQueryChanged extends SearchEvents {
  final String query;
  SearchQueryChanged(this.query);
}