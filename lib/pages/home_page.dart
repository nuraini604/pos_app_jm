import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posproject/LocalDb.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;
  int _currentIndex = 0; // Menambahkan variabel untuk index Bottom Navigation

  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.local_cafe, 'text': 'Coffee'},
    {'icon': Icons.emoji_food_beverage, 'text': 'Non Coffee'},
    {'icon': Icons.fastfood, 'text': 'Snacks'},
  ];

  final List<Map<String, dynamic>> _allProducts = [
    {
      'name': 'Coffee Brown Sugar',
      'price': 28000,
      'stock': 100,
      'category': 'Coffee',
      'image_path': 'assets/images/coffee_brown_sugar.jpg'
    },
    {
      'name': 'Coffee Caramel Latte',
      'price': 32000,
      'stock': 80,
      'category': 'Coffee',
      'image_path': 'assets/images/coffee_caramel_latte.jpg'
    },
    {
      'name': 'Coffee Latte',
      'price': 30000,
      'stock': 120,
      'category': 'Coffee',
      'image_path': 'assets/images/coffee_latte.jpg'
    },
    {
      'name': 'Americano',
      'price': 18000,
      'stock': 50,
      'category': 'Coffee',
      'image_path': 'assets/images/americano.jpg'
    },
    {
      'name': 'Cappuccino',
      'price': 30000,
      'stock': 100,
      'category': 'Coffee',
      'image_path': 'assets/images/cappucino.jpg'
    },
    {
      'name': 'Espresso',
      'price': 15000,
      'stock': 25,
      'category': 'Coffee',
      'image_path': 'assets/images/espresso.jpg'
    },
    {
      'name': 'Macchiato',
      'price': 30000,
      'stock': 30,
      'category': 'Coffee',
      'image_path': 'assets/images/macchiato.jpg'
    },
    {
      'name': 'Vanilla Latte',
      'price': 35000,
      'stock': 80,
      'category': 'Coffee',
      'image_path': 'assets/images/vanilla_latte.jpg'
    },
    {
      'name': 'Caramel Macchiato',
      'price': 40000,
      'stock': 40,
      'category': 'Coffee',
      'image_path': 'assets/images/caramel_macchiato.jpg'
    },
    {
      'name': 'Hazelnut Cappuccino',
      'price': 35000,
      'stock': 45,
      'category': 'Coffee',
      'image_path': 'assets/images/hazelnut_cappucino.jpg'
    },
    {
      'name': 'Signature Affogato',
      'price': 30000,
      'stock': 45,
      'category': 'Coffee',
      'image_path': 'assets/images/signature_affogato.jpg'
    },
    {
      'name': 'FlatWhite',
      'price': 25000,
      'stock': 30,
      'category': 'Coffee',
      'image_path': 'assets/images/flatwhite.jpg'
    },
    {
      'name': 'Mocha',
      'price': 30000,
      'stock': 33,
      'category': 'Coffee',
      'image_path': 'assets/images/mocha.jpg'
    },
    {
      'name': 'Flavoured Latte',
      'price': 35000,
      'stock': 45,
      'category': 'Coffee',
      'image_path': 'assets/images/flavoured_latte.jpg'
    },
    {
      'name': 'Matcha Latte',
      'price': 32000,
      'stock': 60,
      'category': 'Non Coffee',
      'image_path': 'assets/images/matcha_latte.jpg'
    },
    {
      'name': 'Thaitea Latte',
      'price': 25000,
      'stock': 80,
      'category': 'Non Coffee',
      'image_path': 'assets/images/thaitea_latte.jpg'
    },
    {
      'name': 'Flavoured Milk',
      'price': 25000,
      'stock': 40,
      'category': 'Non Coffee',
      'image_path': 'assets/images/flavoured_milk.jpg'
    },
    {
      'name': 'Salted Caramel',
      'price': 28000,
      'stock': 60,
      'category': 'Non Coffee',
      'image_path': 'assets/images/ice_salted_caramel.jpg'
    },
    {
      'name': 'Chocolate Mint',
      'price': 22000,
      'stock': 50,
      'category': 'Non Coffee',
      'image_path': 'assets/images/chocolate_mint.jpg'
    },
    {
      'name': 'Lemon Tea',
      'price': 17000,
      'stock': 55,
      'category': 'Non Coffee',
      'image_path': 'assets/images/lemontea.jpg'
    },
    {
      'name': 'Chocolate',
      'price': 22000,
      'stock': 90,
      'category': 'Non Coffee',
      'image_path': 'assets/images/chocolate.jpg'
    },
    {
      'name': 'Ice Tea',
      'price': 15000,
      'stock': 70,
      'category': 'Non Coffee',
      'image_path': 'assets/images/tea.jpg'
    },
    {
      'name': 'Sparkling Water',
      'price': 12000,
      'stock': 40,
      'category': 'Non Coffee',
      'image_path': 'assets/images/sparkling.jpg'
    },
    {
      'name': 'Croissant',
      'price': 10000,
      'stock': 150,
      'category': 'Snacks',
      'image_path': 'assets/images/croissant.jpg'
    },
    {
      'name': 'Cookies',
      'price': 12000,
      'stock': 110,
      'category': 'Snacks',
      'image_path': 'assets/images/cookies.jpg'
    },
    {
      'name': 'Donut',
      'price': 15000,
      'stock': 80,
      'category': 'Snacks',
      'image_path': 'assets/images/donut.jpg'
    },
    {
      'name': 'Macaron',
      'price': 20000,
      'stock': 70,
      'category': 'Snacks',
      'image_path': 'assets/images/macaron.jpg'
    },
    {
      'name': 'Sandwich',
      'price': 25000,
      'stock': 60,
      'category': 'Snacks',
      'image_path': 'assets/images/sandwich.jpg'
    },
    {
      'name': 'Muffin',
      'price': 16000,
      'stock': 50,
      'category': 'Snacks',
      'image_path': 'assets/images/muffin.jpg'
    },
    {
      'name': 'French Fries',
      'price': 24000,
      'stock': 50,
      'category': 'Snacks',
      'image_path': 'assets/images/frenchfries.jpg'
    },
    {
      'name': 'Onion Ring',
      'price': 22000,
      'stock': 40,
      'category': 'Snacks',
      'image_path': 'assets/images/onionring.jpg'
    },
  ];

  String _formatCurrency(int price) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
        .format(price);
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _allProducts.where((product) =>
    product['category'] == _categories[_selectedCategoryIndex]['text']).toList();
    final bestSellers = _allProducts.where((product) => product['stock'] <= 30).toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Sugar Crave',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => LocalDatabase.fetchProducts(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search menu...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    _categories.length,
                        (index) {
                      final category = _categories[index];
                      return _buildCategoryButton(
                        icon: category['icon'],
                        text: category['text'],
                        isSelected: _selectedCategoryIndex == index,
                        onTap: () {
                          setState(() {
                            _selectedCategoryIndex = index;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: Text(
                  "Recommended",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (bestSellers.isNotEmpty)
              CarouselSlider(
                options: CarouselOptions(
                  height: 140,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: bestSellers.map((product) {
                  return _buildBestSellerCard(product);
                }).toList(),
              )
            else
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("No Best Sellers currently available."),
              ),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      _categories[_selectedCategoryIndex]['text'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  filteredProducts.isEmpty
                      ? const Center(child: Text('No products available.'))
                      : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: _buildProductBox(product),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton({
    required IconData icon,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isSelected ? Colors.blueAccent : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onTap,
        icon: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black,
          size: 18,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProductBox(Map<String, dynamic> product) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white, // Sesuaikan warna dengan box recommended
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(product['image_path']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Price: ${_formatCurrency(product['price'])}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Stock: ${product['stock']}',
                    style: TextStyle(
                      color: product['stock'] > 0 ? Colors.grey : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBestSellerCard(Map<String, dynamic> product) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              product['image_path'] ?? 'assets/images/default_image.png',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product['name'] ?? 'Nama Produk Tidak Tersedia',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  'Price: ${_formatCurrency(product['price'])}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
