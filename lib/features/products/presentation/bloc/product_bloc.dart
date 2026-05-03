import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/products/domain/usecase/product_use_case.dart';
import 'package:souqly/features/products/presentation/bloc/product_events.dart';
import 'package:souqly/features/products/presentation/bloc/product_state.dart';
@injectable
class ProductBloc extends Bloc<ProductEvents , ProductState> {
  ProductUseCase getProductUseCase;
  ProductBloc(this.getProductUseCase) : super(ProductState()) {
    on<GetProductsEvent>((event, emit) async{
      emit(state.copyWith(productStatus: RequestStatus.loading));
      try{
        var result=await getProductUseCase.call(event.catId);

        emit (state.copyWith(productStatus: RequestStatus.success, productResponse: result));

      }catch(e){
        emit(state.copyWith(productStatus: RequestStatus.error));
      }
    });
  }
}
