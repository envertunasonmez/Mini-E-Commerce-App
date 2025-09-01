import 'package:flutter/material.dart';
import 'package:mini_e_commerce_app/utils/responsive.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = [
      {"title": "Tişört", "price": "150₺"},
      {"title": "Pantolon", "price": "300₺"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Sepetim")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AppResponsive.isMobile(context)
            ? _buildMobile(cartItems)
            : _buildWide(cartItems), // ✅ Tablet & Desktop
      ),
    );
  }

  /// 📱 Mobil görünüm
  Widget _buildMobile(List<Map<String, String>> cartItems) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: cartItems.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: Text(item["title"]!),
                subtitle: Text(item["price"]!),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Toplam: 450₺",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ElevatedButton(onPressed: null, child: Text("Satın Al")),
          ],
        )
      ],
    );
  }

  /// 💻 Tablet & Desktop görünümü
  Widget _buildWide(List<Map<String, String>> cartItems) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🛒 Sol tarafta ürün listesi
        Expanded(
          flex: 2,
          child: Card(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: cartItems.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: const Icon(Icons.shopping_bag),
                  title: Text(item["title"]!),
                  subtitle: Text(item["price"]!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 16),

        /// 💳 Sağ tarafta toplam ve satın al
        Expanded(
          flex: 1,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text("Toplam: 450₺",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  ElevatedButton(onPressed: null, child: Text("Satın Al")),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
