import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateFoods extends StatefulWidget {
  const CreateFoods({Key? key}) : super(key: key);

  @override
  State<CreateFoods> createState() => _CreateFoodsState();
}

class _CreateFoodsState extends State<CreateFoods> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: GestureDetector(
            onTap: ((){
              createBurguer(name: "burguer");
            }),
            child: Container(
              width: MediaQuery.of(context).size.width *.8,
              height: MediaQuery.of(context).size.height*.1,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white
              ),
              child: Center(
                child: Text(
                  "Create Burguer",
                  textScaleFactor: MediaQuery.of(context).size.width
                      / MediaQuery.of(context).size.width * 2.5,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*.01,
        ),
        Center(
          child: GestureDetector(
            onTap: ((){
              createPizza(name: "pizza");
            }),
            child: Container(
              width: MediaQuery.of(context).size.width *.8,
              height: MediaQuery.of(context).size.height*.1,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white
              ),
              child: Center(
                child: Text(
                  "Create Pizza",
                  textScaleFactor: MediaQuery.of(context).size.width
                      / MediaQuery.of(context).size.width * 2.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future createBurguer({required String name}) async{
    final docUser = FirebaseFirestore.instance.collection("productos").doc();
    final json = {
      "id" : docUser.id,
      "type" : name,
    };

    await docUser.set(json);
  }
  Future createPizza({required String name}) async{
    final docUser = FirebaseFirestore.instance.collection("productos").doc();
    final json = {
      "id" : docUser.id,
      "type" : name,
    };

    await docUser.set(json);
  }
}
