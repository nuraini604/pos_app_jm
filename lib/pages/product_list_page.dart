import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'product_name': 'Caramel Coffee Jelly Frappuccino',
      'price': 70,
      'stock': 23,
      'image_path': 'assets/images/caramel_coffee_jelly.jpg',
    },
    {
      'product_name': 'Mocha Jelly Frappuccino',
      'price': 35,
      'stock': 0,
      'image_path': 'assets/images/mocha_jelly.jpg',
    },
    {
      'product_name': 'Caramel Java Chip Frappuccino',
      'price': 40,
      'stock': 23,
      'image_path': 'assets/images/caramel_java_chip.jpg',
    },
    {
      'product_name': 'Java Chip Frappuccino',
      'price': 55,
      'stock': 23,
      'image_path': 'assets/images/java_chip.jpg',
    },
  ];

  ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sugar Crave'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search menu...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Chip(
                  label: const Text('Beverages'),
                  backgroundColor: Colors.redAccent,
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.fastfood, color: Colors.grey),
                const SizedBox(width: 8),
                const Icon(Icons.local_pizza, color: Colors.grey),
                const SizedBox(width: 8),
                const Icon(Icons.icecream, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Menu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat.currency(locale: 'en_US', symbol: '\$').format(product['price']);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              product['image_path'],
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['product_name'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  formattedPrice,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product['stock'] > 0 ? 'Stock: ${product['stock']}' : 'Out of Stock',
                  style: TextStyle(
                    fontSize: 12,
                    color: product['stock'] > 0 ? Colors.grey[700] : Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
