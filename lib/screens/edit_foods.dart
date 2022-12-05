import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'foods/food.dart';

class EditFoods extends StatefulWidget {
  const EditFoods({Key? key}) : super(key: key);

  @override
  State<EditFoods> createState() => _EditFoodsState();
}

class _EditFoodsState extends State<EditFoods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: readProducs(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              return const Text("Something went wrong");
            } else if (snapshot.hasData){
              final product = snapshot.data!;

              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8, // change this value for different results
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                padding: const EdgeInsets.all(10.0),
                children: [
                  for(int i=0; i < product.length; i++)
                    Food(
                      type: product.toList()[i].type,
                      id: product.toList()[i].id,
                    ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
      ),
    );
  }
  Widget buildProduct(Product product) => ListTile(
    onTap: ((){
      final docProduct = FirebaseFirestore.instance
          .collection("productos").doc(product.id);

      docProduct.update({
        "type" : "hotdog"
      });
    }),
    leading: const CircleAvatar(
      child: Icon(Icons.fastfood),
    ),
    title: Text(product.type),
    subtitle: Text(product.type),
  );
  
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