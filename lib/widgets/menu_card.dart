import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MenuCard extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final int stock;

  const MenuCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(price);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  formattedPrice, // Harga dalam format Rupiah
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blue),
                ),
                const SizedBox(height: 5),
                Text(
                  stock > 0 ? 'Stock: $stock' : 'Out of Stock',
                  style: TextStyle(
                    fontSize: 12,
                    color: stock > 0 ? Colors.grey[700] : Colors.blueAccent,
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
