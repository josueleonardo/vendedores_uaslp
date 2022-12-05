import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:vendedores/screens/Screen1.dart';
import 'package:vendedores/screens/blank.dart';
import 'package:vendedores/screens/foods/store_product.dart';

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          width: MediaQuery.of(context).size.width*.7,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Text(
                  FirebaseAuth.instance.currentUser!.email.toString(),
                  textScaleFactor: MediaQuery.of(context).size.width
                      /MediaQuery.of(context).size.height * 2.5,
                ),
              ),
              ListTile(
                title: Text(
                  "Volver",
                  textScaleFactor: MediaQuery.of(context).size.width
                      /MediaQuery.of(context).size.height * 2.5,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const Screen1()
                      )
                  );
                },
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.red
                ),
                child: ListTile(
                  title: Text(
                    "Cerrar sesion",
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    textScaleFactor: MediaQuery.of(context).size.width
                        /MediaQuery.of(context).size.height * 2.5,
                  ),
                  onTap: () {
                    FlutterFireUIAuth.signOut(
                      context: context,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "Store",
            textAlign: TextAlign.center,
          ),
          leading: Builder(
            builder: (context) =>
                IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer()
                ),
          ),
        ),
        body: const SafeArea(
          child: StoreProduct(),
        ),
      ),
    );
  }
}