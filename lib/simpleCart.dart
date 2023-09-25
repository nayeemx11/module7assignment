import 'package:flutter/material.dart';
import 'main.dart'; // Import the Product class from the main.dart file

class SimpleCartPage extends StatelessWidget {
  final List<Product> products;
  SimpleCartPage({required this.products});

  int getProductCart() {
    int totalItem = 0;
    for (var product in products) {
      totalItem = totalItem + product.count;
    }

    return totalItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Total Product ${getProductCart().toString()}"),
      ),
    );
  }
}
