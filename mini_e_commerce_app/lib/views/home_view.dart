import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/responsive.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {"title": "Tişört", "price": "150₺"},
      {"title": "Pantolon", "price": "300₺"},
      {"title": "Sneaker", "price": "600₺"},
      {"title": "Ceket", "price": "450₺"},
    ];

    // 📱 cihaz genişliğine göre sütun sayısı
    int crossAxisCount = AppResponsive.isMobile(context)
        ? 2
        : AppResponsive.isTablet(context)
            ? 3
            : 5;

    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Ticaret"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed('/cart');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: AppResponsive.isMobile(context) ? 0.75 : 0.8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return InkWell(
              onTap: () => Get.toNamed('/product', arguments: product),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(child: Placeholder()),
                      const SizedBox(height: 8),
                      Text(
                        product["title"]!,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        product["price"]!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Sepet"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
