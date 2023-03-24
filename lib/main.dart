import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsc/Pages/Auth/P0_startup.dart';
import '../Backend/Routes/app_route_config.dart';

void main(List<String> args) {
  runApp(
    const ProviderScope(
      child: BaseMaterialApp(),
    ),
  );
}

class BaseMaterialApp extends StatelessWidget {
  const BaseMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitPage(),
    );
    // MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routeInformationParser: AppNavRouter().grouter.routeInformationParser,
    //   routerDelegate: AppNavRouter().grouter.routerDelegate,
    // );
  }
}
