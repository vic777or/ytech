import 'package:ytech/features/customers/customers_page/data/customers_models/customers_model.dart';

abstract class CustomersState {}

class CustomersStateInitial extends CustomersState {}

class CustomersStateLoading extends CustomersState {}

class CustomersStateLoaded extends CustomersState {
  final CustomersModel customersModel;
  final bool hasMoreData;

  CustomersStateLoaded(
      {required this.customersModel, required this.hasMoreData});
}

class CustomersStateFailure extends CustomersState {
  final String message;

  CustomersStateFailure({required this.message});
}
