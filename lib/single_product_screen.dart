import 'package:flutter/material.dart';

class SingleProductScreen extends StatefulWidget {
  final Map data;
  const SingleProductScreen({super.key, required this.data});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Product Screen"),
      ),
      body: Card(
        child: Column(
          children: [
            Text(widget.data['product_name']),
            Text(widget.data['price'].toString()),
            Text(widget.data['weight']),
            Text(widget.data['product_name']),
          ],
        ),
      ),
    );
  }
}
