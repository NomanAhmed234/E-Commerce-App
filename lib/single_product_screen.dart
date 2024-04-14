import 'package:e_commerce_app/cart_screen.dart';
import 'package:flutter/material.dart';

class SingleProductScreen extends StatefulWidget {
  final Map data;

  const SingleProductScreen({super.key, required this.data});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  bool isChange = false;
  int counter = 1;
  num totalPrice = 1;

  @override
  Widget build(BuildContext context) {
    totalPrice = counter * widget.data['price'];
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.green,
          backgroundColor: Colors.grey.shade200,
          title: Text("Single Product Screen"),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          dataFromSingleProductScreen: widget.data,
                          dataCounter: counter,
                        ),
                      ),
                    );
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