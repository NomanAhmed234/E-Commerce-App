import 'package:e_commerce_app/data/bakery/bakery_data.dart';
import 'package:e_commerce_app/data/fresh_produce/fruit_data.dart';
import 'package:e_commerce_app/data/fresh_produce/vegetable_data.dart';
import 'package:e_commerce_app/data/meat/meat_seafood_data.dart';
import 'package:e_commerce_app/data/pantry_staples/pantry_staple_data.dart';
import 'package:flutter/material.dart';

class pantryStapleScreen extends StatelessWidget {
  const pantryStapleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vegetable Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: (pantryStaplesData.length / 2).ceil() - 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return
                        //   ProductsListScreen(
                        //     product: dataCategory[index * 2],
                        //   );
                        // }));
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green, width: 0.4),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        // First card
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
                                        pantryStaplesData[index * 2]
                                            ['product_link']),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // Add your card content here
                            Text(
                              pantryStaplesData[index * 2]['product_name'],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Add other widgets for the first item in the row
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Add spacing between cards
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return
                        //   ProductsListScreen(
                        //     product: dataCategory[index * 2 + 1],
                        //   );
                        // }));
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
                                        pantryStaplesData[index * 2 + 1]
                                            ['product_link']),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // Add your card content here
                            Text(
                              pantryStaplesData[index * 2 + 1]['product_name'],
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
              ),
            );
          },
        ),
      ),
    );
  }
}
