import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsc/Pages/Auth/P0_startup.dart';
import 'package:gsc/Pages/Home/P3A_home.dart';
import 'package:gsc/TMP/Home/h01.dart';
import '../Backend/Routes/app_route_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          }
          return InitPage();
        },
      ),
    );
    // MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routeInformationParser: AppNavRouter().grouter.routeInformationParser,
    //   routerDelegate: AppNavRouter().grouter.routerDelegate,
    // );
  }
}
