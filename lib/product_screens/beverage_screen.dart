import 'package:e_commerce_app/data/bakery/bakery_data.dart';
import 'package:e_commerce_app/data/beverages/coco_cola_data.dart';
import 'package:e_commerce_app/data/beverages/mineral_water_data.dart';
import 'package:e_commerce_app/data/beverages/pepsi_data.dart';
import 'package:e_commerce_app/data/data_category.dart';
import 'package:e_commerce_app/single_product_screen.dart';
import 'package:flutter/material.dart';

class BeverageScreen extends StatelessWidget {
  const BeverageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> beverageProducts() {
      List<Map<String, dynamic>> allBevgProducts = [];
      allBevgProducts.addAll(pepsiProductsPakistan);
      allBevgProducts.addAll(cocaColaProductsPakistan);
      allBevgProducts.addAll(mineralWaterProductsPakistan);
      return allBevgProducts;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Beverages",
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: (beverageProducts().length / 2).ceil() - 1,
          itemBuilder: (context, index) {
            int firstIndex = index * 2;
            int secondIndex = index * 2 + 1;

            bool hasSecondItem = secondIndex < beverageProducts().length;

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
                                    data: beverageProducts()[firstIndex])));
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
                                            beverageProducts()[firstIndex]
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
                                beverageProducts()[firstIndex]['product_name'],
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                bakeryBreadData[firstIndex]['weight'],
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rs.${beverageProducts()[firstIndex]['price']}"
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
                                      data: beverageProducts()[secondIndex])));
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
                                              beverageProducts()[secondIndex]
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
                                  beverageProducts()[secondIndex]
                                      ['product_name'],
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  beverageProducts()[secondIndex]['weight'],
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Rs.${beverageProducts()[secondIndex]['price']}"
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
