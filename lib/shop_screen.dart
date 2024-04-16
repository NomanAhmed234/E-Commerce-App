import 'dart:math';

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
import 'package:e_commerce_app/single_product_screen.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final List<String> images = [
    'https://i.pinimg.com/474x/fb/fb/5c/fbfb5cf43bba49f49c865b8bafb1e46f.jpg',
    'https://i.pinimg.com/564x/ab/01/9a/ab019ae53ebdab9e2e03e257445c308f.jpg',
    'https://i.pinimg.com/474x/bd/44/6c/bd446c6f368f7ecad9cfc326a5517470.jpg',
    'https://i.pinimg.com/564x/49/c2/ed/49c2edea1278cb0783738e8a31bdd246.jpg',
    // Add more image URLs here
  ];
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> allProducts = getAllBakeryProducts();
    List<Map<String, dynamic>> exclusiveProductsFun = exclusiveOffer();
    List<Map<String, dynamic>> trendingProductsFun = trendingProducts();
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
        suggestions:
            allProducts.map<String>((item) => item['product_name']).toList(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200, // Adjust the height as needed
                child: PageView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, int index) {
                    int randomIndex =
                        Random().nextInt(exclusiveProductsFun.length);
                    Map<String, dynamic> product =
                        exclusiveProductsFun[randomIndex];

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
                                  backgroundImage:
                                      NetworkImage(product['product_link']),
                                ),
                              ),
                            ),
                            Text(
                              product['product_name'],
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              product['weight'],
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Rs.${product['price']}".toString(),
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
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending Products",
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, int index) {
                    int randomIndex =
                        Random().nextInt(trendingProductsFun.length);
                    Map<String, dynamic> product =
                        trendingProductsFun[randomIndex];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleProductScreen(
                                    data: trendingProductsFun[index])));
                      },
                      child: Card(
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
                                    backgroundImage:
                                        NetworkImage(product['product_link']),
                                  ),
                                ),
                              ),
                              Text(
                                product['product_name'],
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                product['weight'],
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rs.${product['price']}".toString(),
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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

  List<Map<String, dynamic>> trendingProducts() {
    List<Map<String, dynamic>> allProducts = [];

    allProducts.addAll(cocaColaProductsPakistan);
    allProducts.addAll(mineralWaterProductsPakistan);
    allProducts.addAll(pepsiProductsPakistan);

    allProducts.addAll(pantryStaplesData);
    allProducts.addAll(snacksAndSweetsPakistan);
    // allProducts.addAll(cocaColaProductsPakistan);
    // allProducts.addAll(mineralWaterProductsPakistan);
    // allProducts.addAll(pepsiProductsPakistan);
    // Add more lists if needed
    return allProducts;
  }

  List<Map<String, dynamic>> exclusiveOffer() {
    List<Map<String, dynamic>> allProducts = [];
    allProducts.addAll(bakeryBreadData);
    allProducts.addAll(dairyAndEggsDataPakistan);
    allProducts.addAll(freshFruitsDataPakistan);
    allProducts.addAll(freshHerbsDataPakistan);
    allProducts.addAll(freshVegetablesDataPakistan);
    allProducts.addAll(meatAndSeafoodDataPakistan);
    // allProducts.addAll(cocaColaProductsPakistan);
    // allProducts.addAll(mineralWaterProductsPakistan);
    // allProducts.addAll(pepsiProductsPakistan);
    // Add more lists if needed
    return allProducts;
  }
}
