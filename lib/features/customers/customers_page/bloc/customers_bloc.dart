import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ytech/features/customers/customers_page/bloc/customers_event.dart';
import 'package:ytech/features/customers/customers_page/bloc/customers_state.dart';
import 'package:ytech/features/customers/customers_page/data/customers_api.dart';

class CustomersBloc extends Bloc<CustomersEvent, CustomersState> {
  final DioCustomers dioCustomers;

  CustomersBloc(this.dioCustomers) : super(CustomersStateInitial()) {
    on<GetCustomersEvent>(_getCustomers);
  }

  void _getCustomers(
      GetCustomersEvent event, Emitter<CustomersState> emit) async {
    try {
      //  emit(CustomersStateLoading());
      var res = await dioCustomers.getCustomers(
          pageSize: event.pageSize, pageNumber: event.pageNumber);

      emit(CustomersStateLoaded(
          customersModel: res,
          hasMoreData: res.result?.data?.isNotEmpty ?? true));
    } catch (err) {
      emit(
        CustomersStateFailure(message: err.toString()),
      );
    }
  }
}
