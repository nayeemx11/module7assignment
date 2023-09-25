import 'package:flutter/material.dart';
import 'main.dart'; // Import the Product class from the main.dart file

class CartPageListView extends StatefulWidget {
  final List<Product> products;
  CartPageListView({required this.products});

  @override
  State<CartPageListView> createState() => _CartPageListViewState();
}

class _CartPageListViewState extends State<CartPageListView> {
  List<Product> CartList = Product(name: 'null', price: 0) as List<Product>;

  void getProductCart() {
    print(CartList);
    int i = 0;
    for (var product in widget.products) {
      CartList[i].count = product.count;
      CartList[i].name = product.name;
      CartList[i].price = product.price;
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: CartList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(CartList[index].name),
          subtitle: Text("${CartList[index].count}"),
        ),
      ),
    );
  }
}
