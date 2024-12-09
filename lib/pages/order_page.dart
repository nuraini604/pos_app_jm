import 'package:flutter/material.dart';
import 'package:posproject/LocalDb.dart';
import 'package:posproject/models/produk_model.dart';
import 'package:posproject/pages/CartPage.dart';

class DetailPage extends StatefulWidget {
  final Product product; // Menggunakan tipe Product, bukan dynamic

  DetailPage({required this.product});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final LocalDatabase _localDatabase = LocalDatabase();
  late Future<List<Map<String, dynamic>>> _orderDetails;

  // Variabel untuk opsi
  String? _selectedSize;
  String? _selectedSweetness;
  String? _selectedIceCube;
  List<String> _selectedToppings = [];

  // Variabel untuk kuantitas
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _orderDetails = _localDatabase.fetchOrderDetails();
  }

  // Memeriksa apakah opsi yang wajib sudah dipilih
  bool _areMandatoryOptionsSelected() {
    return _selectedSize != null && _selectedSweetness != null && _selectedIceCube != null;
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product; // Produk yang dipilih

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(  // Menampilkan pilihan kategori
        future: _orderDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada data tersedia.'));
          }

          final orderDetails = snapshot.data!;

          // Urutkan kategori berdasarkan prioritas
          final priorityOrder = ['Size', 'Sweetness', 'Ice Cube', 'Topping'];

          orderDetails.sort((a, b) {
            final aIndex = priorityOrder.indexOf(a['category']);
            final bIndex = priorityOrder.indexOf(b['category']);
            return aIndex.compareTo(bIndex);
          });

          final groupedCategories = groupCategories(orderDetails);

          return SingleChildScrollView(  // Wrap seluruh body dengan SingleChildScrollView
            child: Column(
              children: [
                // Membuat gambar dan nama produk dapat digulir
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child: Image.asset(
                    '${product.imagePath}', 
                    width: 500,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                // Menampilkan nama produk
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.name, 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                // Menampilkan pilihan kategori berdasarkan data dari database
                Column(
                  children: [
                    // Membuat kategori dapat digulir
                    for (var category in groupedCategories)
                      _buildCategory(category['category'], category['choices']),
                  ],
                ),
                // Bagian bawah untuk kuantitas dan harga
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Bagian kuantitas
                      StatefulBuilder(
                        builder: (context, setStateQuantity) {
                          return Row(
                            children: [
                              // Tombol minus
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.remove, color: Colors.white),
                                  onPressed: () {
                                    setStateQuantity(() {
                                      if (_quantity > 1) {
                                        _quantity--;
                                      }
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '$_quantity',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              SizedBox(width: 10),
                              // Tombol tambah
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.add, color: Colors.white),
                                  onPressed: () {
                                    setStateQuantity(() {
                                      _quantity++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      // Tombol harga
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _areMandatoryOptionsSelected() ? Colors.blue : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: _areMandatoryOptionsSelected() ? () {} : null,
                        child: Text(
                          'Rp ${product.price}', 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Fungsi untuk mengelompokkan kategori produk
  List<Map<String, dynamic>> groupCategories(List<Map<String, dynamic>> orderDetails) {
    Set<String> processedCategories = Set();
    List<Map<String, dynamic>> groupedCategories = [];

    for (var category in orderDetails) {
      final categoryName = category['category'];

      if (!processedCategories.contains(categoryName)) {
        processedCategories.add(categoryName);
        groupedCategories.add(category);
      }
    }
    return groupedCategories;
  }

  // Fungsi untuk membangun kategori dengan radio button atau checkbox
  Widget _buildCategory(String categoryName, List choices) {
    bool isRadioCategory = categoryName == "Size" || categoryName == "Sweetness" || categoryName == "Ice Cube";

    if (isRadioCategory) {
      return _buildRadioCategory(categoryName, choices);
    } else if (categoryName == "Topping") {
      return _buildCheckboxCategory(categoryName, choices);
    }

    return Container();
  }

  // Fungsi untuk kategori radio button (Size, Sweetness, Ice Cube)
  Widget _buildRadioCategory(String categoryName, List choices) {
    String? selectedValue;

    if (categoryName == "Size") {
      selectedValue = _selectedSize;
    } else if (categoryName == "Sweetness") {
      selectedValue = _selectedSweetness;
    } else if (categoryName == "Ice Cube") {
      selectedValue = _selectedIceCube;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$categoryName",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
          Column(
            children: choices.map<Widget>((choice) {
              return RadioListTile<String>(
                title: Text(choice['name'],
                    style: TextStyle(fontFamily: 'Poppins')),
                subtitle: choice['additional_price'] != null
                    ? Text('Rp ${choice['additional_price']}',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontFamily: 'Poppins'))
                    : null,
                value: choice['name'],
                groupValue: selectedValue,
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  setState(() {
                    if (categoryName == "Size") {
                      _selectedSize = value;
                    } else if (categoryName == "Sweetness") {
                      _selectedSweetness = value;
                    } else if (categoryName == "Ice Cube") {
                      _selectedIceCube = value;
                    }
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk kategori checkbox (Topping)
  Widget _buildCheckboxCategory(String categoryName, List choices) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$categoryName",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
          Column(
            children: choices.map<Widget>((choice) {
              return CheckboxListTile(
                title: Text(choice['name'],
                    style: TextStyle(fontFamily: 'Poppins')),
                subtitle: choice['additional_price'] != null
                    ? Text('Rp ${choice['additional_price']}',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontFamily: 'Poppins'))
                    : null,
                value: _selectedToppings.contains(choice['name']),
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      _selectedToppings.add(choice['name']);
                    } else {
                      _selectedToppings.remove(choice['name']);
                    }
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
