import 'package:e_commerce_app/data/bakery/bakery_data.dart';
import 'package:e_commerce_app/data/beverages/coco_cola_data.dart';
import 'package:e_commerce_app/data/beverages/mineral_water_data.dart';
import 'package:e_commerce_app/data/beverages/pepsi_data.dart';
import 'package:e_commerce_app/data/dairy/dairy_products.dart';
import 'package:e_commerce_app/data/fresh_produce/fruit_data.dart';
import 'package:e_commerce_app/data/fresh_produce/herbs_data.dart';
import 'package:e_commerce_app/data/fresh_produce/vegetable_data.dart';
import 'package:e_commerce_app/data/meat/meat_seafood_data.dart';
import 'package:e_commerce_app/data/pantry_staples/pantry_staple_data.dart';
import 'package:e_commerce_app/data/snacks_sweets/snacks_sweets.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String searchValue = '';
// Concatenate all bakery product lists
  List<Map<String, dynamic>> getAllBakeryProducts() {
    List<Map<String, dynamic>> allProducts = [];
    allProducts.addAll(bakeryBreadData);
    allProducts.addAll(cocaColaProductsPakistan);
    allProducts.addAll(mineralWaterProductsPakistan);
    allProducts.addAll(pepsiProductsPakistan);
    allProducts.addAll(dairyAndEggsDataPakistan);
    allProducts.addAll(freshFruitsDataPakistan);
    allProducts.addAll(freshHerbsDataPakistan);
    allProducts.addAll(freshVegetablesDataPakistan);
    allProducts.addAll(meatAndSeafoodDataPakistan);
    allProducts.addAll(pantryStaplesData);
    allProducts.addAll(snacksAndSweetsPakistan);
    // allProducts.addAll(cocaColaProductsPakistan);
    // allProducts.addAll(mineralWaterProductsPakistan);
    // allProducts.addAll(pepsiProductsPakistan);
    // Add more lists if needed
    return allProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EasySearchBar(
          searchHintText: "Seach item here",
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          title: const Text(
            'Serach here',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
          ),
          onSearch: (value) => setState(() => searchValue = value),
          suggestions: getAllBakeryProducts()
              .map<String>((item) => item['product_name'])
              .toList(),
        ),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
              title: const Text('Item 1'), onTap: () => Navigator.pop(context)),
          ListTile(
              title: const Text('Item 2'), onTap: () => Navigator.pop(context))
        ])),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Image.network(
                    'https://i.pinimg.com/474x/5d/9c/76/5d9c769ce440958fd3df2bd05e31e540.jpg',
                    height: 100,
                    width: double.maxFinite,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Exclusive Offer",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: Text(
                        " See all",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 220,
                  child: Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: freshFruitsDataPakistan.length,
                        itemBuilder: (context, int index) {
                          return Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.green, width: 0.4),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: CircleAvatar(
                                      radius: 51,
                                      backgroundColor: Colors.green,
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                            freshFruitsDataPakistan[index]
                                                ['product_link']),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    freshFruitsDataPakistan[index]
                                        ['product_name'],
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    freshFruitsDataPakistan[index]['weight'],
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Rs.${freshFruitsDataPakistan[index]['price']}"
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
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Selling",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: Text(
                        " See all",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 220,
                  child: Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: freshFruitsDataPakistan.length,
                        itemBuilder: (context, int index) {
                          return Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.green, width: 0.4),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: CircleAvatar(
                                      radius: 51,
                                      backgroundColor: Colors.green,
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                            freshFruitsDataPakistan[index]
                                                ['product_link']),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    freshFruitsDataPakistan[index]
                                        ['product_name'],
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    freshFruitsDataPakistan[index]['weight'],
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Rs.${freshFruitsDataPakistan[index]['price']}"
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
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
