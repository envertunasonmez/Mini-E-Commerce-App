import 'package:get/get.dart';
import 'package:mini_e_commerce_app/views/cart_view.dart';
import 'package:mini_e_commerce_app/views/home_view.dart';
import 'package:mini_e_commerce_app/views/login_view.dart';
import 'package:mini_e_commerce_app/views/product_detail_view.dart';
import 'package:mini_e_commerce_app/views/register_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterView(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoutes.product,
      page: () => const ProductDetailView(
        title: "Tişört",
        price: "150₺",
      ),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartView(),
    ),
  ];
}
