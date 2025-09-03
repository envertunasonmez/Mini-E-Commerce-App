import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_e_commerce_app/app/controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profilim"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Favoriler"),
              Tab(text: "Geçmiş"),
              Tab(text: "Hesap"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FavoritesTab(),
            HistoryTab(),
            AccountTab(),
          ],
        ),
      ),
    );
  }
}

/// Favoriler Sekmesi
class FavoritesTab extends StatelessWidget {
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.favorites.isEmpty) {
        return const Center(child: Text("Favori ürün yok."));
      }
      return ListView.builder(
        itemCount: controller.favorites.length,
        itemBuilder: (context, index) {
          final item = controller.favorites[index];
          return ListTile(
            leading: const Icon(Icons.favorite, color: Colors.red),
            title: Text(item["title"]!),
            subtitle: Text(item["price"]!),
          );
        },
      );
    });
  }
}

/// Geçmiş Satın Alımlar Sekmesi
class HistoryTab extends StatelessWidget {
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.purchaseHistory.isEmpty) {
        return const Center(child: Text("Geçmiş satın alım yok."));
      }
      return ListView.builder(
        itemCount: controller.purchaseHistory.length,
        itemBuilder: (context, index) {
          final item = controller.purchaseHistory[index];
          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(item["title"]!),
            subtitle: Text(item["price"]!),
            trailing: Text(item["date"]!),
          );
        },
      );
    });
  }
}

/// Hesap Bilgileri Sekmesi
class AccountTab extends StatelessWidget {
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email: ${controller.userEmail}"),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: controller.logout,
            child: const Text("Çıkış Yap"),
          ),
        ],
      ),
    );
  }
}
