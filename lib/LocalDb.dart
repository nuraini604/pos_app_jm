import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  Database? _database;

  static const String tableProducts = 'products';
  static const String tableOrders = 'orders';
  static const String tableOrderDetails = 'order_details';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDB('Local.db');
    return _database!;
  }

  Future<Database> _initializeDB(String filepath) async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, filepath);
      return await openDatabase(
        path,
        version: 1,
        onCreate: _createDB,
      );
    } catch (e) {
      debugPrint("Error initializing database: $e");
      rethrow;
    }
  }

  Future<void> _createDB(Database db, int version) async {
    try {
      await db.execute('''
        CREATE TABLE $tableProducts (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          product_name TEXT NOT NULL,
          category TEXT NOT NULL,
          price INTEGER NOT NULL,
          description TEXT,
          image_path TEXT,
          available INTEGER NOT NULL DEFAULT 1
        )
      ''');

      await db.execute('''
        CREATE TABLE $tableOrders (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          order_date TEXT NOT NULL,
          total_price INTEGER NOT NULL,
          customer_name TEXT,
          customer_phone TEXT,
          status TEXT
        )
      ''');

      await db.execute('''
        CREATE TABLE $tableOrderDetails (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          order_id INTEGER NOT NULL,
          product_id INTEGER NOT NULL,
          quantity INTEGER NOT NULL,
          price_at_order INTEGER NOT NULL,
          FOREIGN KEY (order_id) REFERENCES $tableOrders(id),
          FOREIGN KEY (product_id) REFERENCES $tableProducts(id)
        )
      ''');

      await _addInitialProducts(db);
    } catch (e) {
      debugPrint("Error creating tables: $e");
      rethrow;
    }
  }

  Future<void> _addInitialProducts(Database db) async {
    final List<Map<String, dynamic>> products = [
      {
        'product_name': 'Coffee Brown Sugar',
        'category': 'Coffee',
        'price': 28000,
        'description': '',
        'image_path': 'assets/images/coffee_brown_sugar.jpg',
        'available': 100,
      },
      {
        'product_name': 'Coffee Caramel Latte',
        'category': 'Coffee',
        'price': 32000,
        'description': '',
        'image_path': 'assets/images/coffee_caramel_latte.jpg',
        'available': 80,
      },
      {
        'product_name': 'Coffee Latte',
        'category': 'Coffee',
        'price': 30000,
        'description': '',
        'image_path': 'assets/images/coffee_latte.jpg',
        'available': 120,
      },
      {
        'product_name': 'Americano',
        'category': 'Coffee',
        'price': 18000,
        'description': '',
        'image_path': 'assets/images/americano.jpg',
        'available': 50,
      },
      {
        'product_name': 'Cappuccino',
        'category': 'Coffee',
        'price': 30000,
        'description': '',
        'image_path': 'assets/images/cappucino.jpg',
        'available': 100,
      },
      {
        'product_name': 'Espresso',
        'category': 'Coffee',
        'price': 15000,
        'description': '',
        'image_path': 'assets/images/espresso.jpg',
        'available': 25,
      },
      {
        'product_name': 'Macchiato',
        'category': 'Coffee',
        'price': 30000,
        'description': '',
        'image_path': 'assets/images/macchiato.jpg',
        'available': 30,
      },
      {
        'product_name': 'Vanilla Latte',
        'category': 'Coffee',
        'price': 35000,
        'description': '',
        'image_path': 'assets/images/vanilla_latte.jpg',
        'available': 80,
      },
      {
        'product_name': 'Caramel Macchiato',
        'category': 'Coffee',
        'price': 40000,
        'description': '',
        'image_path': 'assets/images/caramel_macchiato.jpg',
        'available': 40,
      },
      {
        'product_name': 'Hazelnut Cappuccino',
        'category': 'Coffee',
        'price': 35000,
        'description': '',
        'image_path': 'assets/images/hazelnut_cappucino.jpg',
        'available': 45,
      },
      {
        'product_name': 'Signature Affogato',
        'category': 'Coffee',
        'price': 30000,
        'description': '',
        'image_path': 'assets/images/signature_affogato.jpg',
        'available': 45,
      },
      {
        'product_name': 'FlatWhite',
        'category': 'Coffee',
        'price': 25000,
        'description': '',
        'image_path': 'assets/images/flatwhite.jpg',
        'available': 30,
      },
      {
        'product_name': 'Mocha',
        'category': 'Coffee',
        'price': 30000,
        'description': '',
        'image_path': 'assets/images/mocha.jpg',
        'available': 33,
      },
      {
        'product_name': 'Flavoured Latte',
        'category': 'Coffee',
        'price': 35000,
        'description': '',
        'image_path': 'assets/images/flavoured_latte.jpg',
        'available': 45,
      },
      {
        'product_name': 'Matcha Latte',
        'category': 'Non Coffee',
        'price': 32000,
        'description': '',
        'image_path': 'assets/images/matcha_latte.jpg',
        'available': 60,
      },
      {
        'product_name': 'Thaitea Latte',
        'category': 'Non Coffee',
        'price': 25000,
        'description': '',
        'image_path': 'assets/images/thaitea_latte.jpg',
        'available': 80,
      },
      {
        'product_name': 'Flavoured Milk',
        'category': 'Non Coffee',
        'price': 25000,
        'description': '',
        'image_path': 'assets/images/flavoured_milk.jpg',
        'available': 40,
      },
      {
        'product_name': 'Salted Caramel',
        'category': 'Non Coffee',
        'price': 28000,
        'description': '',
        'image_path': 'assets/images/ice_salted_caramel.jpg',
        'available': 60,
      },
      {
        'product_name': 'Chocolate Mint',
        'category': 'Non Coffee',
        'price': 22000,
        'description': '',
        'image_path': 'assets/images/chocolate_mint.jpg',
        'available': 50,
      },
      {
        'product_name': 'Lemon Tea',
        'category': 'Non Coffee',
        'price': 17000,
        'description': '',
        'image_path': 'assets/images/lemontea.jpg',
        'available': 55,
      },
      {
        'product_name': 'Chocolate',
        'category': 'Non Coffee',
        'price': 22000,
        'description': '',
        'image_path': 'assets/images/chocolate.jpg',
        'available': 90,
      },
      {
        'product_name': 'Ice Tea',
        'category': 'Non Coffee',
        'price': 15000,
        'description': '',
        'image_path': 'assets/images/tea.jpg',
        'available': 70,
      },
      {
        'product_name': 'Sparkling Water',
        'category': 'Non Coffee',
        'price': 12000,
        'description': '',
        'image_path': 'assets/images/sparkling.jpg',
        'available': 40,
      },
      {
        'product_name': 'Croissant',
        'category': 'Snack',
        'price': 10000,
        'description': '',
        'image_path': 'assets/images/croissant.jpg',
        'available': 150,
      },
      {
        'product_name': 'Cookies',
        'category': 'Snack',
        'price': 12000,
        'description': '',
        'image_path': 'assets/images/cookies.jpg',
        'available': 110,
      },
      {
        'product_name': 'Donut',
        'category': 'Snack',
        'price': 15000,
        'description': '',
        'image_path': 'assets/images/donut.jpg',
        'available': 80,
      },
      {
        'product_name': 'Macaron',
        'category': 'Snack',
        'price': 20000,
        'description': '',
        'image_path': 'assets/images/macaron.jpg',
        'available': 70,
      },
      {
        'product_name': 'Sandwich',
        'category': 'Snack',
        'price': 25000,
        'description': '',
        'image_path': 'assets/images/sandwich.jpg',
        'available': 60,
      },
      {
        'product_name': 'Muffin',
        'category': 'Snack',
        'price': 16000,
        'description': '',
        'image_path': 'assets/images/muffin.jpg',
        'available': 50,
      },
      {
        'product_name': 'French Fries',
        'category': 'Snack',
        'price': 24000,
        'description': '',
        'image_path': 'assets/images/frenchfries.jpg',
        'available': 50,
      },
      {
        'product_name': 'Onion Ring',
        'category': 'Snack',
        'price': 22000,
        'description': '',
        'image_path': 'assets/images/onionring.jpg',
        'available': 40,
      },
    ];

    for (var product in products) {
      await db.insert(
        tableProducts,
        product,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Fetch all products
  static Future<List<Map<String, dynamic>>> fetchProducts() async {
    final db = await LocalDatabase().database;
    try {
      return await db.query(tableProducts);
    } catch (e) {
      debugPrint("Error fetching products: $e");
      return [];
    }
  }


  static Future<List<Map<String, dynamic>>> fetchProductsByCategory(String category) async {
    final db = await LocalDatabase().database;
    try {
      return await db.query(
        tableProducts,
        where: 'category = ? AND available = 1',
        whereArgs: [category],
      );
    } catch (e) {
      debugPrint("Error fetching products by category: $e");
      return [];
    }
  }

  Future<void> addProduct(Map<String, dynamic> product) async {
    final db = await database;
    try {
      await db.insert(
        tableProducts,
        product,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      debugPrint("Error adding product: $e");
      rethrow;
    }
  }

  Future<void> deleteProduct(int id) async {
    final db = await database;
    try {
      await db.delete(
        tableProducts,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      debugPrint("Error deleting product: $e");
      rethrow;
    }
  }
}
