import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_e_commerce_app/utils/responsive.dart';

class ProductDetailView extends StatelessWidget {
  final String title;
  final String price;

  const ProductDetailView({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: AppResponsive.isMobile(context)
            ? _buildMobile()
            : _buildWide(), // ✅ Responsive switch
      ),
    );
  }

  /// 📱 Mobil görünüm
  Widget _buildMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(child: Center(child: Placeholder())),
        const SizedBox(height: 16),
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        Text(price, style: const TextStyle(fontSize: 20, color: Colors.grey)),
        const SizedBox(height: 16),
        const Text("Ürün açıklaması burada olacak.",
            style: TextStyle(fontSize: 16)),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.toNamed('/cart'),
            child: const Text("Sepete Ekle"),
          ),
        )
      ],
    );
  }

  /// 💻 Tablet & Desktop görünüm
  Widget _buildWide() {
    return Row(
      children: [
        /// Sol tarafta görsel
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              height: 300,
              color: Colors.grey[300],
              child: const Placeholder(),
            ),
          ),
        ),
        const SizedBox(width: 32),

        /// Sağ tarafta detaylar
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 28)),
              Text(price,
                  style: const TextStyle(fontSize: 22, color: Colors.grey)),
              const SizedBox(height: 16),
              const Text("Ürün açıklaması burada olacak.",
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 24),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed('/cart'),
                  child: const Text("Sepete Ekle"),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
