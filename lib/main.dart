import 'package:d_mart_bill/utils/routes.dart';
import 'package:d_mart_bill/views/screens/cart_page/cart_page.dart';
import 'package:d_mart_bill/views/screens/details_page/detail_page.dart';
import 'package:d_mart_bill/views/screens/home_page/home_page.dart';
import 'package:d_mart_bill/views/screens/pdf_page/pdf_page.dart';
import 'package:d_mart_bill/views/screens/splesh_page/splesh_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.detailPage: (context) => const DetailPage(),
        MyRoutes.cartPage: (context) => const CartPage(),
        MyRoutes.pdfPage: (context) => const InvoicePage(),
      },
    );
  }
}
