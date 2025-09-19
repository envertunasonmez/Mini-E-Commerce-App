import 'package:flutter/material.dart';
import 'package:mini_e_commerce_app/core/constants/color_constants.dart';
import 'package:mini_e_commerce_app/core/theme/app_text_styles.dart';
import 'package:mini_e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:mini_e_commerce_app/core/widgets/custom_elevated_button.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock_outlined,
                size: 80,
                color: ColorConstants.primaryColor,
              ),
              const SizedBox(height: 16),
              Text("Giriş Yap", style: AppTextStyles.heading24.copyWith()),
              const SizedBox(height: 8),
              Text(
                "Hesabınıza erişmek için devam edin",
                style: AppTextStyles.bodyNormal.copyWith(),
              ),
              const SizedBox(height: 32),

              /// Email
              CustomTextFormField(
                hintText: "E-mail",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 16),

              /// Password
              CustomTextFormField(
                hintText: "Şifre",
                controller: passwordController,
                obscureText: true,
                prefixIcon: Icons.lock,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Şifremi Unuttum",
                    style: AppTextStyles.bodyNormal.copyWith(
                      color: ColorConstants.blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// Login Button
              CustomElevatedButton(
                title: "Giriş Yap",
                onPressed: () {
                  // TODO: Login işlemleri
                },
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hesabın yok mu? ",
                    style: AppTextStyles.bodyNormal.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorConstants.blackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: Register sayfasına git
                    },
                    child: Text(
                      "Kaydol",
                      style: AppTextStyles.bodyNormal.copyWith(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
