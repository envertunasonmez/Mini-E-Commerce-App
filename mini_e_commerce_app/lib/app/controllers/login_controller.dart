import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_e_commerce_app/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obscurePassword = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Hata",
        "Lütfen tüm alanları doldurun",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAllNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Giriş Hatası",
        e.message ?? "Bilinmeyen hata",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
