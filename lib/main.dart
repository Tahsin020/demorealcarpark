import 'package:demorealcarpark/product/constants/color.dart';
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
      theme: ThemeData.light().copyWith(
        textTheme: const TextTheme(
          headline5: TextStyle(color: Colors.black87),
          headline6: TextStyle(color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(onPrimary: dataColors, primary: const Color.fromARGB(255, 82, 161, 13))),
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            elevation: 0),
      ),
      home: const SplashView(),
    );
  }
}
