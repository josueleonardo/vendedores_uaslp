import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../my_colors.dart';

class Food extends StatefulWidget {
  const Food({Key? key, required this.type, required this.id}) : super(key: key);
  final String type;
  final String id;

  @override
  State<Food> createState() => _FoodState(type, id);
}

class _FoodState extends State<Food> {
  late String type;
  late String id;
  String burguer = "https://arc-anglerfish-arc2-prod-infobae.s3.amazonaws.com/public/FJKXKQKMMJBV7KQ7XQ3YNFO7LU.jpg";
  String pizza = "https://t1.rg.ltmcdn.com/es/posts/1/9/3/pizza_casera_31391_600.webp";
  String hotdog = "https://upload.wikimedia.org/wikipedia/commons/b/b1/Hot_dog_with_mustard.png";

  _FoodState(this.type, this.id);

  @override
  void initState() {
    type = widget.type;
    id = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    type = widget.type;
    id = widget.id;
    return GestureDetector(
      onTap: ((){
        final docProduct = FirebaseFirestore.instance
            .collection("productos").doc(id);
        docProduct.update({
          "type" : "hotdog"
        });
      }),
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.trueWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: MyColors.trueBlack,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Image.network(
                type == "burguer"
                    ? burguer
                    : type == "pizza"
                    ? pizza
                    : hotdog
            ),
            Text(
              type == "burguer"
                  ? "Burguer"
                  : type == "pizza"
                  ? "pizza"
                  : "hotdog",
              textScaleFactor: MediaQuery.of(context).size.width
                  / MediaQuery.of(context).size.height * 4,
            ),
          ],
        ),
      ),
    );
  }
}