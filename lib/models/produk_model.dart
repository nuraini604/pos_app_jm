// product_model.dart

import 'package:flutter/material.dart';

class Product {
  final String name;
  final int price;
  final int stock;
  final String category;
  final String imagePath;

 
  Product({
    required this.name,
    required this.price,
    required this.stock,
    required this.category,
    required this.imagePath,
  });

  
  static List<Product> getAllProducts() {
    return [
      Product(
        name: 'Coffee Brown Sugar',
        price: 28000,
        stock: 100,
        category: 'Coffee',
        imagePath: 'assets/images/coffee_brown_sugar.jpg',
      ),
      Product(
        name: 'Coffee Caramel Latte',
        price: 32000,
        stock: 80,
        category: 'Coffee',
        imagePath: 'assets/images/coffee_caramel_latte.jpg',
      ),
      Product(
        name: 'Coffee Latte',
        price: 30000,
        stock: 120,
        category: 'Coffee',
        imagePath: 'assets/images/coffee_latte.jpg',
      ),
      Product(
        name: 'Americano',
        price: 18000,
        stock: 50,
        category: 'Coffee',
        imagePath: 'assets/images/americano.jpg',
      ),
      Product(
        name: 'Cappuccino',
        price: 30000,
        stock: 100,
        category: 'Coffee',
        imagePath: 'assets/images/cappucino.jpg',
      ),
      Product(
        name: 'Espresso',
        price: 15000,
        stock: 25,
        category: 'Coffee',
        imagePath: 'assets/images/espresso.jpg',
      ),
      Product(
        name: 'Macchiato',
        price: 30000,
        stock: 30,
        category: 'Coffee',
        imagePath: 'assets/images/macchiato.jpg',
      ),
      Product(
        name: 'Vanilla Latte',
        price: 35000,
        stock: 80,
        category: 'Coffee',
        imagePath: 'assets/images/vanilla_latte.jpg',
      ),
      Product(
        name: 'Caramel Macchiato',
        price: 40000,
        stock: 40,
        category: 'Coffee',
        imagePath: 'assets/images/caramel_macchiato.jpg',
      ),
      Product(
        name: 'Hazelnut Cappuccino',
        price: 35000,
        stock: 45,
        category: 'Coffee',
        imagePath: 'assets/images/hazelnut_cappucino.jpg',
      ),
      Product(
        name: 'Signature Affogato',
        price: 30000,
        stock: 45,
        category: 'Coffee',
        imagePath: 'assets/images/signature_affogato.jpg',
      ),
      Product(
        name: 'FlatWhite',
        price: 25000,
        stock: 30,
        category: 'Coffee',
        imagePath: 'assets/images/flatwhite.jpg',
      ),
      Product(
        name: 'Mocha',
        price: 30000,
        stock: 33,
        category: 'Coffee',
        imagePath: 'assets/images/mocha.jpg',
      ),
      Product(
        name: 'Flavoured Latte',
        price: 35000,
        stock: 45,
        category: 'Coffee',
        imagePath: 'assets/images/flavoured_latte.jpg',
      ),
      Product(
        name: 'Matcha Latte',
        price: 32000,
        stock: 60,
        category: 'Non Coffee',
        imagePath: 'assets/images/matcha_latte.jpg',
      ),
      Product(
        name: 'Thaitea Latte',
        price: 25000,
        stock: 80,
        category: 'Non Coffee',
        imagePath: 'assets/images/thaitea_latte.jpg',
      ),
      Product(
        name: 'Flavoured Milk',
        price: 25000,
        stock: 40,
        category: 'Non Coffee',
        imagePath: 'assets/images/flavoured_milk.jpg',
      ),
      Product(
        name: 'Salted Caramel',
        price: 28000,
        stock: 60,
        category: 'Non Coffee',
        imagePath: 'assets/images/ice_salted_caramel.jpg',
      ),
      Product(
        name: 'Chocolate Mint',
        price: 22000,
        stock: 50,
        category: 'Non Coffee',
        imagePath: 'assets/images/chocolate_mint.jpg',
      ),
      Product(
        name: 'Lemon Tea',
        price: 17000,
        stock: 55,
        category: 'Non Coffee',
        imagePath: 'assets/images/lemontea.jpg',
      ),
      Product(
        name: 'Chocolate',
        price: 22000,
        stock: 90,
        category: 'Non Coffee',
        imagePath: 'assets/images/chocolate.jpg',
      ),
      Product(
        name: 'Ice Tea',
        price: 15000,
        stock: 70,
        category: 'Non Coffee',
        imagePath: 'assets/images/tea.jpg',
      ),
      Product(
        name: 'Sparkling Water',
        price: 12000,
        stock: 40,
        category: 'Non Coffee',
        imagePath: 'assets/images/sparkling.jpg',
      ),
      Product(
        name: 'Croissant',
        price: 10000,
        stock: 150,
        category: 'Snacks',
        imagePath: 'assets/images/croissant.jpg',
      ),
      Product(
        name: 'Cookies',
        price: 12000,
        stock: 110,
        category: 'Snacks',
        imagePath: 'assets/images/cookies.jpg',
      ),
      Product(
        name: 'Donut',
        price: 15000,
        stock: 80,
        category: 'Snacks',
        imagePath: 'assets/images/donut.jpg',
      ),
      Product(
        name: 'Macaron',
        price: 20000,
        stock: 70,
        category: 'Snacks',
        imagePath: 'assets/images/macaron.jpg',
      ),
      Product(
        name: 'Sandwich',
        price: 25000,
        stock: 60,
        category: 'Snacks',
        imagePath: 'assets/images/sandwich.jpg',
      ),
      Product(
        name: 'Muffin',
        price: 16000,
        stock: 50,
        category: 'Snacks',
        imagePath: 'assets/images/muffin.jpg',
      ),
      Product(
        name: 'French Fries',
        price: 24000,
        stock: 50,
        category: 'Snacks',
        imagePath: 'assets/images/frenchfries.jpg',
      ),
      Product(
        name: 'Onion Ring',
        price: 22000,
        stock: 40,
        category: 'Snacks',
        imagePath: 'assets/images/onionring.jpg',
      ),
    ];
  }
}
