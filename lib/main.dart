import 'package:ecommerce/screens/productList.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Ticaret Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
      routes: Routes.routes,
    );
  }
}
