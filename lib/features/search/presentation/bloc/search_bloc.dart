import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/home/domain/usecase/home_use_case.dart';
import 'package:souqly/features/search/presentation/bloc/search_events.dart';
import 'package:souqly/features/search/presentation/bloc/search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvents, SearchState> {
  final HomeUseCase homeUseCase;

  SearchBloc(this.homeUseCase) : super(const SearchState()) {
    on<LoadAllProducts>(_onLoad);
    on<SearchQueryChanged>(_onQueryChanged);
  }

  Future<void> _onLoad(LoadAllProducts event, Emitter<SearchState> emit) async {
    try {
      emit(state.copyWith(status: RequestStatus.loading));
      final response = await homeUseCase.getProducts();
      emit(state.copyWith(
        status: RequestStatus.success,
        allProducts: response.data ?? [],
      ));
    } catch (_) {
      emit(state.copyWith(status: RequestStatus.error));
    }
  }

  void _onQueryChanged(SearchQueryChanged event, Emitter<SearchState> emit) {
    final query = event.query.trim().toLowerCase();
    if (query.isEmpty) {
      emit(state.copyWith(query: '', results: []));
      return;
    }
    final results = state.allProducts
        .where((p) => (p.name ?? '').toLowerCase().contains(query))
        .toList();
    emit(state.copyWith(query: event.query, results: results));
  }
}