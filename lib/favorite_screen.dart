import 'package:e_commerce_app/data/favorite_data.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Favorites",
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: favoriteData.length,
          itemBuilder: (context, int index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(
                      radius: 39,
                      backgroundImage:
                          NetworkImage(favoriteData[index]['product_link']),
                    ),
                  ),
                  title: Text(
                    favoriteData[index]['product_name'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  subtitle: Text(
                    favoriteData[index]['weight'],
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    "Rs.${favoriteData[index]['price']}".toString(),
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  ),
                ),
                Divider(
                  color: Colors.grey.shade300,
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
