import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final Map dataFromSingleProductScreen;
  final int dataCounter;


  const CartScreen({
    Key? key,
    required this.dataFromSingleProductScreen, required this.dataCounter,
    
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late int dataCounter;
  late int productPrice;

  @override
  void initState() {
    super.initState();
    dataCounter = widget.dataCounter;
    productPrice = widget.dataFromSingleProductScreen['price'] * dataCounter;
  }

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
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 43,
                        backgroundColor: Colors.green,
                        child: CircleAvatar(
                          radius: 42,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              widget
                                  .dataFromSingleProductScreen['product_link'],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.dataFromSingleProductScreen['product_name'],
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.dataFromSingleProductScreen['weight']
                              .toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (dataCounter > 1) {
                                          dataCounter--;
                                          productPrice =
                                              widget.dataFromSingleProductScreen[
                                                      'price'] *
                                                  dataCounter;
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
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Container(
                                    color: Colors.green,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      child: Text(
                                        dataCounter.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      dataCounter++;
                                      productPrice =
                                          widget.dataFromSingleProductScreen[
                                                  'price'] *
                                              dataCounter;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Rs.${productPrice.toString()}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  height: 1,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
