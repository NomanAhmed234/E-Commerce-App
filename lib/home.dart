import 'package:e_commerce_app/data/bakery/bakery_data.dart';
import 'package:e_commerce_app/data/beverages/coco_cola_data.dart';
import 'package:e_commerce_app/data/beverages/cola_next_data.dart';
import 'package:e_commerce_app/data/beverages/mineral_water_data.dart';
import 'package:e_commerce_app/data/beverages/pepsi_data.dart';
import 'package:e_commerce_app/data/dairy/dairy_products.dart';
import 'package:e_commerce_app/data/fresh_produce/fruit_data.dart';
import 'package:e_commerce_app/data/fresh_produce/herbs_data.dart';
import 'package:e_commerce_app/data/fresh_produce/vegetable_data.dart';
import 'package:e_commerce_app/data/meat/meat_seafood_data.dart';
import 'package:e_commerce_app/data/pantry_staples/pantry_staple_data.dart';
import 'package:e_commerce_app/data/snacks_sweets/snacks_sweets.dart';
import 'package:e_commerce_app/nav_bar.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: dairyAndEggsDataPakistan.length,
          itemBuilder: (context, int index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  '${dairyAndEggsDataPakistan[index]['product_link']}',
                ),
              ),
              title: Text(dairyAndEggsDataPakistan[index]['product_name']),
            );
          }),
    );
  }
}
