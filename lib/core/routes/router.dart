import 'package:go_router/go_router.dart';
import 'package:ytech/features/customers/add_customer/presentation/add_customer_layout_page.dart';
import 'package:ytech/features/customers/customers_page/presentation/customers_layout_page.dart';

import '../../features/auth/presentation/log_in_page.dart';

// GoRouter configuration
final routerConf = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LogInPage(),
      routes: [
        GoRoute(
          path: 'CustomersLayoutPage',
          builder: (context, state) => const CustomersLayoutPage(),
        ),
        GoRoute(
          path: 'AddCustomerLayoutPage',
          builder: (context, state) => const AddCustomerLayoutPage(),
        ),
      ],
    ),
  ],
);
