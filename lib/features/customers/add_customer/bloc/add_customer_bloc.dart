import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ytech/features/customers/add_customer/bloc/add_customer_event.dart';
import 'package:ytech/features/customers/add_customer/bloc/add_customer_state.dart';
import 'package:ytech/features/customers/add_customer/data/add_customer_api.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  final DioAddCustomer dioAddCustomer;

  AddCustomerBloc(this.dioAddCustomer) : super(AddCustomerStateInitial()) {
    on<AddEvent>(_addCustomer);
  }

  void _addCustomer(AddEvent event, Emitter<AddCustomerState> emit) async {
    try {
      emit(AddCustomerStateLoading());
      var res = await dioAddCustomer.addCustomer(
          addCustomerBodyModel: event.addCustomerBodyModel);

      emit(AddCustomerStateLoaded());
    } catch (err) {
      emit(
        AddCustomerStateFailure(message: err.toString()),
      );
    }
  }
}
