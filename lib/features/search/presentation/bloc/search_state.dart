import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/home/data/models/HomeResponse.dart';

class SearchState {
  final RequestStatus status;
  final List<ProductModel> allProducts;
  final List<ProductModel> results;
  final String query;
  final String? errorMessage;

  const SearchState({
    this.status = RequestStatus.init,
    this.allProducts = const [],
    this.results = const [],
    this.query = '',
    this.errorMessage,
  });

  SearchState copyWith({
    RequestStatus? status,
    List<ProductModel>? allProducts,
    List<ProductModel>? results,
    String? query,
    String? errorMessage,
  }) {
    return SearchState(
      status: status ?? this.status,
      allProducts: allProducts ?? this.allProducts,
      results: results ?? this.results,
      query: query ?? this.query,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}