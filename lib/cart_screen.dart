import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final Map dataFromSingleProductScreen;
  const CartScreen({super.key, required this.dataFromSingleProductScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, int index) {
                return Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.green,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              dataFromSingleProductScreen['product_link']),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                  "Product Detail",
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                  ],
                );
              }),
        ));
  }
}
