import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/log_in_page.dart';
import '../../features/customers_page/presentation/customers_page.dart';

// GoRouter configuration
final routerConf = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LogInPage(),
      routes: [
        GoRoute(
          path: 'CustomersPage',
          builder: (context, state) => const CustomersPage(),
        )
      ],
    ),
  ],
);
