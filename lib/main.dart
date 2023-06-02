import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/food/popular_food_detail.dart';
import 'package:flutter_ecommerce/pages/food/recommended_food_detail.dart';
import 'package:get/get.dart';

import 'pages/home/main_food_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GetMaterialApp (instead of MaterialApp) to get the context (in order to use GetX Package)
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const MainFoodPage());
        //home: const PopularFoodDetail());
        home: const RecommendedFoodDetail());
  }
}
