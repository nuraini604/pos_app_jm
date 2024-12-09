import 'package:flutter/material.dart';
import 'package:posproject/pages/home_page.dart';
import 'package:posproject/pages/order_page.dart';
import 'package:posproject/pages/history_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/order': (context) => OrderPage(),
        '/history': (context) => HistoryPage(),
      },
    );
  }
}
