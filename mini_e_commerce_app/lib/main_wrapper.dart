import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_e_commerce_app/app/widgets/floating_nav_bar.dart';
import 'package:mini_e_commerce_app/data/services/auth_service.dart';
import 'package:mini_e_commerce_app/views/login_view.dart';
import 'package:mini_e_commerce_app/views/home_view.dart';
import 'package:mini_e_commerce_app/views/cart_view.dart';
import 'package:mini_e_commerce_app/views/profile_view.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final AuthService authService = Get.put(AuthService());
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const CartView(),
    ProfileView()
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!authService.isLoggedIn) {
        return LoginView();
      }

      return Scaffold(
        body: Stack(
          children: [
            _screens[_currentIndex],
            FloatingNavBar(
              currentIndex: _currentIndex,
              onTap: _onTap,
            ),
          ],
        ),
      );
    });
  }
}
