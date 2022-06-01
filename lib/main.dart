import 'package:demorealcarpark/view/map/view/map_view.dart';
import 'package:demorealcarpark/view/splash/view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Car Park',
      theme: ThemeData.dark().copyWith(
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0
        ),
      ),
      home:  const SplashView(),
    );
  }
}

