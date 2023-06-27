abstract class AddCustomerState {}

class AddCustomerStateInitial extends AddCustomerState {}

class AddCustomerStateLoading extends AddCustomerState {}

class AddCustomerStateLoaded extends AddCustomerState {}

class AddCustomerStateFailure extends AddCustomerState {
  final String message;

  AddCustomerStateFailure({required this.message});
}
