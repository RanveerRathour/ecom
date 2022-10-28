// ignore_for_file: prefer_const_constructors

import 'package:ecom/components/grid_card.dart';
import 'package:ecom/screens/login.dart';
import 'package:ecom/screens/product.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final data = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
  ];

  @override
  Widget build(BuildContext context) {
    onCardPress() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductScreen()));
    }

    return Container(
        child: GridView.builder(
            itemCount: data.length,
            padding: const EdgeInsets.symmetric(vertical: 30),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 30, crossAxisSpacing: 30),
            itemBuilder: (BuildContext context, int index) {
              return GridCard(index: index, onPress: onCardPress);
            }));
  }
}
