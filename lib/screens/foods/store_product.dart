import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vendedores/screens/foods/food.dart';

import '../../my_colors.dart';

class StoreProduct extends StatefulWidget {
  const StoreProduct({Key? key}) : super(key: key);

  @override
  State<StoreProduct> createState() => _StoreProductState();
}

class _StoreProductState extends State<StoreProduct> {
  late bool reset = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.trueWhite,
        body: Stack(
          children: [
            Container(
                color: MyColors.trueWhite,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(right: 0, left: 0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8, // change this value for different results
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  padding: const EdgeInsets.all(10.0),
                  children: [
                    for(int i=0; i < 10; i++)
                      const Food(type: "burguer", id: "yes",),
                  ],
                )
            ),
          ],
        )
    );
  }

  Stream <Iterable<Product>> readProducs()
  => FirebaseFirestore.instance
      .collection("productos")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Product.fromJson(doc.data())));
}

class Product {
  String id;
  final String type;

  Product({
    this.id = "",
    this.type = ""
  });

  static Product fromJson(Map <String, dynamic> json) => Product(
    id: json["id"],
    type: json["type"]
  );
}
