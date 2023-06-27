import 'package:equatable/equatable.dart';

abstract class CustomersEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCustomersEvent extends CustomersEvent {
  final dynamic pageSize;
  final dynamic pageNumber;

  GetCustomersEvent({required this.pageSize, required this.pageNumber});
}
