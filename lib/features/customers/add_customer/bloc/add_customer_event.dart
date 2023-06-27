import 'package:equatable/equatable.dart';
import 'package:ytech/features/customers/add_customer/data/add_customer_models/add_customer_body_model.dart';

abstract class AddCustomerEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddEvent extends AddCustomerEvent {
  final AddCustomerBodyModel addCustomerBodyModel;

  AddEvent({required this.addCustomerBodyModel});
}
