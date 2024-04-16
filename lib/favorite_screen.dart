import 'package:e_commerce_app/data/favorite_data.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
        child: favoriteData.isEmpty
            ? Center(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 62,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/bc/bd/99/bcbd99c43aea08b85d3c3a6b80a47b56.jpg',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "No data found",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ))
            : ListView.builder(
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
                            backgroundImage: NetworkImage(
                                favoriteData[index]['product_link']),
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
                        trailing: Column(
                          children: [
                            Container(
                              constraints: BoxConstraints.tightFor(
                                width: 30, // Set the width of the IconButton
                                height: 30, // Set the height of the IconButton
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            "Warning",
                                            style: TextStyle(
                                              color: Colors.green,
                                            ),
                                          ),
                                          content: Text(
                                            "Do you want to remove ${favoriteData[index]['product_name']} from your Favorite list",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  favoriteData.removeAt(index);
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              child: Text(
                                                "Yes",
                                                style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  });
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                                iconSize: 15,
                              ),
                            ),
                            Text(
                              "Rs.${favoriteData[index]['price']}".toString(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
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
