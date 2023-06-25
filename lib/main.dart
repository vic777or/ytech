import 'package:flutter/material.dart';
import 'core/routes/router.dart';
import 'core/utils/shared_preferences.dart';

final SharedFunction sharedFunction = SharedFunction();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routerConf,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
