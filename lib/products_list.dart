import 'package:e_commerce_app/data/data_category.dart';
import 'package:flutter/material.dart';

class ProductsListScreen extends StatefulWidget {
  final Map product;
  const ProductsListScreen({super.key, required this.product});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Name"),
      ),
    );
  }
}
