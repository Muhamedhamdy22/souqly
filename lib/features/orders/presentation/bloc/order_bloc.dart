import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:souqly/core/Api/error_handling.dart';
import 'package:souqly/features/orders/domain/usecase/order_use_case.dart';
import 'package:souqly/features/orders/presentation/bloc/order_events.dart';
import 'package:souqly/features/orders/presentation/bloc/order_state.dart';

@injectable
class OrderBloc extends Bloc<OrderEvents, OrderState> {
  OrderUseCase orderUseCase;

  OrderBloc(this.orderUseCase) : super(OrderState()) {
    on<GetOrders>(_getOrders);
    on<GetOrder>(_getOrder);
    on<CreateOrder>(_createOrder);
  }

  _getOrders(GetOrders event, Emitter<OrderState> emit) async {
    try {
      emit(state.copyWith(getOrdersStatus: OrderStatus.loading));
      var response = await orderUseCase.getOrders();
      emit(state.copyWith(
        getOrdersStatus: OrderStatus.success,
        ordersResponse: response,
      ));
    } on BaseException catch (e) {
      emit(state.copyWith(
        getOrdersStatus: OrderStatus.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(getOrdersStatus: OrderStatus.error));
    }
  }

  _getOrder(GetOrder event, Emitter<OrderState> emit) async {
    try {
      var order = await orderUseCase.getOrder(event.id);
      emit(state.copyWith(selectedOrder: order));
    } catch (e) {
      emit(state.copyWith(getOrdersStatus: OrderStatus.error));
    }
  }

  _createOrder(CreateOrder event, Emitter<OrderState> emit) async {
    try {
      emit(state.copyWith(createOrderStatus: OrderStatus.loading));
      var order = await orderUseCase.createOrder(event.request);
      emit(state.copyWith(
        createOrderStatus: OrderStatus.success,
        selectedOrder: order,
      ));
    } on BaseException catch (e) {
      emit(state.copyWith(
        createOrderStatus: OrderStatus.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(createOrderStatus: OrderStatus.error));
    }
  }
}