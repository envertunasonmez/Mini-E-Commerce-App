import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController extends GetxController {
  var favorites = <Map<String, String>>[].obs;
  var purchaseHistory = <Map<String, String>>[].obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userEmail => _auth.currentUser?.email ?? "Bilinmiyor";

  @override
  void onInit() {
    super.onInit();
    // Örnek veri
    favorites.addAll([
      {"title": "Tişört", "price": "150₺"},
      {"title": "Sneaker", "price": "600₺"},
    ]);
    purchaseHistory.addAll([
      {"title": "Pantolon", "price": "300₺", "date": "01/08/2025"},
      {"title": "Ceket", "price": "450₺", "date": "20/07/2025"},
    ]);
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login');
  }
}
