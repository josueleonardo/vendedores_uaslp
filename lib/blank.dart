import 'package:flutter/cupertino.dart';
import 'package:vendedores/my_colors.dart';

class Blank extends StatefulWidget {
  const Blank({Key? key}) : super(key: key);

  @override
  State<Blank> createState() => _BlankState();
}

class _BlankState extends State<Blank> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.trueWhite,
    );
  }
}