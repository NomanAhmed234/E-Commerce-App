import 'package:e_commerce_app/data/bakery/bakery_data.dart';
import 'package:e_commerce_app/data/dairy/dairy_products.dart';
import 'package:e_commerce_app/data/data_category.dart';
import 'package:e_commerce_app/data/fresh_produce/fruit_data.dart';
import 'package:e_commerce_app/data/fresh_produce/herbs_data.dart';
import 'package:e_commerce_app/data/fresh_produce/vegetable_data.dart';
import 'package:e_commerce_app/data/meat/meat_seafood_data.dart';
import 'package:e_commerce_app/data/pantry_staples/pantry_staple_data.dart';
import 'package:e_commerce_app/single_product_screen.dart';
import 'package:flutter/material.dart';

class PantryStapleScreen extends StatelessWidget {
  const PantryStapleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Pantry & Staple",
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: (pantryStaplesData.length / 2).ceil(),
          itemBuilder: (context, index) {
            int firstIndex = index * 2;
            int secondIndex = index * 2 + 1;

            bool hasSecondItem = secondIndex < pantryStaplesData.length;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleProductScreen(
                                    data: pantryStaplesData[firstIndex])));
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green, width: 0.4),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        // First card
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 43,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 42,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            pantryStaplesData[firstIndex]
                                                ['product_link']),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              // Add your card content here
                              Text(
                                pantryStaplesData[firstIndex]['product_name'],
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                pantryStaplesData[firstIndex]['weight'],
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rs.${pantryStaplesData[firstIndex]['price']}"
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    child: Card(
                                      color: Colors.green,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                              // Add other widgets for the first item in the row
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Add spacing between cards
                  // Build the second card if it has data
                  if (hasSecondItem)
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleProductScreen(
                                      data: pantryStaplesData[secondIndex])));
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green, width: 0.4),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // Second card
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 43,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 42,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              pantryStaplesData[secondIndex]
                                                  ['product_link']),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // Add your card content here
                                Text(
                                  pantryStaplesData[secondIndex]
                                      ['product_name'],
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  pantryStaplesData[secondIndex]['weight'],
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Rs.${pantryStaplesData[secondIndex]['price']}"
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      child: Card(
                                        color: Colors.green,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                                // Add other widgets for the second item in the row
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
