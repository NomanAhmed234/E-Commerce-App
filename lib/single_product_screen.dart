import 'package:e_commerce_app/cart_screen.dart';
import 'package:e_commerce_app/data/add_to_cart_data.dart';
import 'package:e_commerce_app/data/favorite_data.dart';
import 'package:e_commerce_app/favorite_screen.dart';
import 'package:e_commerce_app/product_screens/fruit_screen.dart';
import 'package:flutter/material.dart';

class SingleProductScreen extends StatefulWidget {
  final Map data;

  const SingleProductScreen({super.key, required this.data});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  bool isChange = true;
  int counter = 1;
  num totalPrice = 1;

  @override
  Widget build(BuildContext context) {
    totalPrice = counter * widget.data['price'];
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.green,
          backgroundColor: Colors.grey.shade200,
          // title: Text("Single Product Screen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CircleAvatar(
                          radius: 101,
                          backgroundColor: Colors.green,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage:
                                NetworkImage(widget.data['product_link']),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.data['product_name'],
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (isChange == true) {
                              // Check if the item is already in the favorite list
                              bool isAlreadyFavorite = favoriteData.any(
                                  (item) =>
                                      item['product_name'] ==
                                          widget.data['product_name'] &&
                                      item['product_link'] ==
                                          widget.data['product_link'] &&
                                      item['weight'] == widget.data['weight'] &&
                                      item['price'] == widget.data['price']);

                              // If not already in favorites, add it
                              if (!isAlreadyFavorite) {
                                favoriteData.add({
                                  'product_name': widget.data['product_name'],
                                  'product_link': widget.data['product_link'],
                                  'weight': widget.data['weight'],
                                  'price': widget.data['price'],
                                });
                              } else {
                                // If already in favorites, remove it
                                favoriteData.removeWhere((item) =>
                                    item['product_name'] ==
                                        widget.data['product_name'] &&
                                    item['product_link'] ==
                                        widget.data['product_link'] &&
                                    item['weight'] == widget.data['weight'] &&
                                    item['price'] == widget.data['price']);
                              }
                            }

                            // Toggle the state
                            isChange = !isChange;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: isChange ? Colors.grey : Colors.redAccent,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.data['weight'],
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Center(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (counter > 1) {
                                  counter--;
                                  totalPrice = counter * widget.data['price'];
                                }
                              });
                            },
                            icon: Icon(
                              Icons.minimize,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                          child: Container(
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 2, bottom: 2),
                              child: Text(
                                "$counter",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              {
                                counter++;
                                totalPrice = counter * widget.data['price'];
                              }
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Rs. ${totalPrice.toString()}",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Product Detail",
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  widget.data['origin'],
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nutritions",
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reviews",
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
              Center(
                  child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(10), // Add margin if needed
                child: ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      backgroundColor: Colors.green,
                      content:
                          Text('${widget.data['product_name']} added in Cart'),
                      duration:
                          Duration(seconds: 2), // Adjust duration as needed
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // Add item to cart
                    addToCartData.add({
                      'product_name': widget.data['product_name'],
                      'product_link': widget.data['product_link'],
                      'weight': widget.data['weight'],
                      'price': widget.data['price'],
                      'total_price': widget.data['price'] * counter,
                      'item': counter,
                    });

                    // Show feedback to the user using a dialog

                    // Navigate to the fruit screen with a fade transition
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => FruitScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add To Basket",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white, // Set button color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Set border radius
                    ),
                  ),
                ),
              ))
            ],
          ),
        ));
  }
}
