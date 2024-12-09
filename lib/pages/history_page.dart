import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'History',
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
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: ListTile(
              leading: Icon(Icons.receipt_long, color: Colors.blue[800]),
              title: Text('Order #${index + 1}'),
              subtitle: Text('Completed on ${(index + 1).toString().padLeft(2, '0')}-Nov-2024'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/order');
          }
        },
      ),
    );
  }
}
