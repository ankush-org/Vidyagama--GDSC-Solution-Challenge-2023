import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsc/Pages/Auth/P0_startup.dart';
import 'package:gsc/Pages/Auth/P2A_sign_up.dart';
import 'package:gsc/Pages/Auth/P2B_topics.dart';
import 'package:gsc/Pages/Home/P3A_home.dart';
import 'package:gsc/TMP/Home/h01.dart';
import '../Pages./BaseScaffold.dart';
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

final navigatorKey = GlobalKey<NavigatorState>(); //used for nav auth

class BaseMaterialApp extends StatelessWidget {
  const BaseMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData.dark(),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: HomeScaffold()
        // StreamBuilder<User?>(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return const HomeScaffold();
        //     } else if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasError) {
        //       return const Center(child: Text(("Error")));
        //     } else {
        //       return const InitPage();
        //     }
        //   },
        // ),
        );
    //Alternate Routing
    //     MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routeInformationParser: AppNavRouter().grouter.routeInformationParser,
    //   routerDelegate: AppNavRouter().grouter.routerDelegate,
    // );
  }
}
