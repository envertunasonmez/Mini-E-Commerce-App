import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_e_commerce_app/app/controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _Header(),
                    const SizedBox(height: 24),
                    _EmailField(controller: controller),
                    const SizedBox(height: 16),
                    _PasswordField(controller: controller),
                    const SizedBox(height: 24),
                    _RegisterButton(controller: controller),
                    const _LoginTextButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.person_add, size: 80, color: Colors.green),
        SizedBox(height: 16),
        Text(
          "Kayıt Ol",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  final RegisterController controller;
  const _EmailField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "E-posta",
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  final RegisterController controller;
  const _PasswordField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
          controller: controller.passwordController,
          obscureText: controller.obscurePassword.value,
          decoration: InputDecoration(
            labelText: "Şifre",
            prefixIcon: const Icon(Icons.lock),
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(controller.obscurePassword.value
                  ? Icons.visibility_off
                  : Icons.visibility),
              onPressed: () {
                controller.obscurePassword.value =
                    !controller.obscurePassword.value;
              },
            ),
          ),
        ));
  }
}

class _RegisterButton extends StatelessWidget {
  final RegisterController controller;
  const _RegisterButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: controller.register,
        child: const Text("Kayıt Ol"),
      ),
    );
  }
}

class _LoginTextButton extends StatelessWidget {
  const _LoginTextButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.back();
      },
      child: const Text("Zaten hesabın var mı? Giriş Yap"),
    );
  }
}
