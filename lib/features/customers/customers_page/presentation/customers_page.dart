import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ytech/features/customers/customers_page/bloc/customers_bloc.dart';
import 'package:ytech/features/customers/customers_page/bloc/customers_event.dart';
import 'package:ytech/features/customers/customers_page/bloc/customers_state.dart';
import 'package:ytech/features/customers/customers_page/data/customers_api.dart';
import 'package:ytech/features/customers/customers_page/data/customers_models/customers_model.dart';

import 'widgets/customer_item.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  dynamic lastPageIndex = 1;
  dynamic itemCount = 0;
  List<CustomersData> customers = List.from([]);
  final CustomersBloc _customersBloc = CustomersBloc(DioCustomers());
  static const _pageSize = 5;
  bool hasMoreData = true;
  getCustomers() {
    _customersBloc
        .add(GetCustomersEvent(pageSize: _pageSize, pageNumber: lastPageIndex));
  }

  @override
  void dispose() {
    _customersBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _customersBloc
        ..add(
            GetCustomersEvent(pageSize: _pageSize, pageNumber: lastPageIndex)),
      child: Container(
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(
            vertical: Adaptive.px(60), horizontal: Adaptive.px(120)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CUSTOMERS',
                  style: TextStyle(fontSize: Adaptive.px(40)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              horizontal: Adaptive.px(50),
                              vertical: Adaptive.px(20))),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                      ))),
                  onPressed: () {
                    context.go('/AddCustomerLayoutPage');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: Adaptive.px(15),
                      ),
                      Text("ADD CUSTOMER",
                          style: TextStyle(
                            fontSize: Adaptive.px(16),
                          ),
                          textScaleFactor: 1.0),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Adaptive.px(20),
            ),
            BlocConsumer<CustomersBloc, CustomersState>(
              listener: (context, state) {
                if (state is CustomersStateLoaded) {
                  List<CustomersData> tmp =
                      state.customersModel.result?.data ?? List.from([]);
                  for (CustomersData customersData in tmp) {
                    customers.add(customersData);
                  }
                  hasMoreData = state.hasMoreData;
                  itemCount += tmp.length;
                  lastPageIndex++;
                }
              },
              builder: (context, state) {
                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  height: 500,
                  child: InfiniteListView(
                    loadingWidget:
                        const Center(child: CircularProgressIndicator()),
                    itemBuilder: (_, i) {
                      if (state is CustomersStateLoaded) {
                        return CustomerItem(
                          customersData: customers[i],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    shrinkWrap: true,
                    nextData: () {
                      getCustomers();
                    },
                    itemCount: itemCount,
                    hasNext: hasMoreData,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
