import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_e_commerce_app/app/routes/app_pages.dart';
import 'package:mini_e_commerce_app/app/routes/app_routes.dart';
import 'package:mini_e_commerce_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini E-Ticaret',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.login, // ✅ route sabitlerinden geliyor
      getPages: AppPages.pages,      // ✅ sayfalar AppPages içinden geliyor
    );
  }
}
