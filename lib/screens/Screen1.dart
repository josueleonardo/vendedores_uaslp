import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vendedores/screens/Tienda.dart';
import 'package:vendedores/screens/blank.dart';
import 'package:vendedores/screens/create_foods.dart';
import 'package:vendedores/screens/delete_food.dart';
import 'package:vendedores/screens/edit_foods.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key,}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int selectedIndex = 1;
  double space = 50.0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (_controller.hasClients) {
        _controller.jumpToPage(selectedIndex);
      }
    });
  }

  final PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

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
                  "Portal de administradores",
                  textScaleFactor: MediaQuery.of(context).size.width
                      /MediaQuery.of(context).size.height * 2.5,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const Store()
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
          title: Text(
            selectedIndex == 0
                ? "Create"
                : selectedIndex == 1
                ? "Edit"
                : "Delete",
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
        body: SafeArea(
          child: selectedIndex == 0
              ? const CreateFoods()
              : selectedIndex == 1
              ? const EditFoods()
              : const DelateFood(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          //backgroundColor: const Color(0xFF8a4fff),
          selectedFontSize: 5,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.shop), //FaIcon(FontAwesomeIcons.solidUser),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.shopware), //FaIcon(FontAwesomeIcons.solidUser),
              label: 'Edit ',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.shopSlash), //FaIcon(FontAwesomeIcons.solidUser),
              label: 'Delete',
            ),
          ],
          currentIndex: selectedIndex,
          selectedIconTheme: const IconThemeData(size: 40),
          unselectedIconTheme: const IconThemeData(size: 20),
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}