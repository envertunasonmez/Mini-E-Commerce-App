import 'package:flutter/material.dart';
import 'package:mini_e_commerce_app/features/auth/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini E - Commerce App',
      theme: ThemeData(),
      home: LoginView(),
    );
  }
}
