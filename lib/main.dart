import 'package:flutter/material.dart';
import 'package:module7assignment/simpleCart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
          centerTitle: true,
        ),
        body: ProductList(),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Product 1', price: 10),
    Product(name: 'Product 2', price: 20),
    Product(name: 'Product 3', price: 30),
    Product(name: 'Product 4', price: 40),
    Product(name: 'Product 5', price: 50),
    Product(name: 'Product 6', price: 60),
    Product(name: 'Product 7', price: 70),
    Product(name: 'Product 8', price: 80),
    Product(name: 'Product 9', price: 90),
    Product(name: 'Product 10', price: 100),
    Product(name: 'Product 11', price: 110),
    Product(name: 'Product 12', price: 120),
    Product(name: 'Product 13', price: 100),
    Product(name: 'Product 14', price: 100),
    Product(name: 'Product 15', price: 110),
    Product(name: 'Product 16', price: 120),
  ];

  int cartCurrentSize = 0;

  void navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SimpleCartPage(products: products),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(products[index].name),
              subtitle: Text("${products[index].price}"),
              trailing: Column(
                children: [
                  Text("Count: ${products[index].count}"),
                  ElevatedButton(
                    onPressed: () {
                      products[index].count++;
                      setState(() {});
                      if (cartCurrentSize < 4) {
                        cartCurrentSize++;
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Congratulations!'),
                              content: Text('You\'ve bought 5! products !'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: TextButton(
                                      child: Text(
                                          "OK"), // Within the `FirstRoute` widget
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SimpleCartPage(
                                                      products: products)),
                                        );
                                      }),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text("buy now"),
                  ),
                ],
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToCart,
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class Product {
  String name;
  double price;
  int count = 0;

  Product({required this.name, required this.price});
}
