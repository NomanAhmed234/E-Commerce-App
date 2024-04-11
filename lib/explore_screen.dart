import 'package:e_commerce_app/data/bakery/bakery_data.dart';
import 'package:e_commerce_app/data/beverages/coco_cola_data.dart';
import 'package:e_commerce_app/data/beverages/mineral_water_data.dart';
import 'package:e_commerce_app/data/beverages/pepsi_data.dart';
import 'package:e_commerce_app/data/dairy/dairy_products.dart';
import 'package:e_commerce_app/data/data_category.dart';
import 'package:e_commerce_app/data/fresh_produce/fruit_data.dart';
import 'package:e_commerce_app/data/fresh_produce/herbs_data.dart';
import 'package:e_commerce_app/data/fresh_produce/vegetable_data.dart';
import 'package:e_commerce_app/data/meat/meat_seafood_data.dart';
import 'package:e_commerce_app/data/pantry_staples/pantry_staple_data.dart';
import 'package:e_commerce_app/data/snacks_sweets/snacks_sweets.dart';
import 'package:e_commerce_app/product_screens/fruit_screen.dart';
import 'package:e_commerce_app/products_list.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
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
        title: Center(
          child: const Text(
            'Find Products',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
          ),
        ),
        onSearch: (value) => setState(() => searchValue = value),
        suggestions: getAllBakeryProducts()
            .map<String>((item) => item['product_name'])
            .toList(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: (dataCategory.length / 2).ceil(),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return dataCategory[index * 2]['screen'];
                        // ProductsListScreen(
                        //   product: dataCategory[index * 2],
                        // );
                      }));
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.green, width: 0.4),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // Second card
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
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
                                      dataCategory[index * 2]['image']),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // Add your card content here
                          Text(
                            dataCategory[index * 2]['name'],
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          // Add other widgets for the second item in the row
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8), // Add spacing between cards
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return dataCategory[index * 2 + 1]['screen'];
                        // ProductsListScreen(
                        //   product: dataCategory[index * 2 + 1],
                        // );
                      }));
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.green, width: 0.4),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // Second card
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
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
                                      dataCategory[index * 2 + 1]['image']),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // Add your card content here
                          Text(
                            dataCategory[index * 2 + 1]['name'],
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          // Add other widgets for the second item in the row
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
