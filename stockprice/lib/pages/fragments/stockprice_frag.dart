import 'package:flutter/material.dart';

class StockpricePage extends StatefulWidget {
  const StockpricePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StockpricePageState createState() => _StockpricePageState();
}

class _StockpricePageState extends State<StockpricePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Stockprice"),
      );
  }
}