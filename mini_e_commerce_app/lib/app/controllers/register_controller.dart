import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_e_commerce_app/app/routes/app_routes.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obscurePassword = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Hata",
        "Lütfen tüm alanları doldurun",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Get.snackbar(
        "Başarılı",
        "Kayıt işlemi başarılı! Şimdi giriş yapabilirsiniz.",
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAllNamed(AppRoutes.login);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Kayıt Hatası",
        e.message ?? "Bilinmeyen hata",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
