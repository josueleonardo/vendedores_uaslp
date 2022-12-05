import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DelateFood extends StatefulWidget {
  const DelateFood({Key? key}) : super(key: key);

  @override
  State<DelateFood> createState() => _DelateFoodState();
}

class _DelateFoodState extends State<DelateFood> {
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

            return ListView(
              children: product.map(buildProduct).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //if(snapshot.hasData){
          //  final Product = snapshot.data!;
          //  return ListView(
          //    children: Product.map(builder).toList(),
          //  );
          //}
        },
      ),
    );
  }
  Widget buildProduct(Product product) => ListTile(
    onTap: ((){
      final docProduct = FirebaseFirestore.instance
          .collection("productos").doc(product.id);

      docProduct.delete();
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