import 'package:carousel_slider/carousel_slider.dart';
import 'package:d_mart_bill/utils/product_page.dart';
import 'package:d_mart_bill/utils/routes.dart';
import 'package:flutter/material.dart';

import '../cart_page/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List image = [
    'assets/image/home_page/1.jpg',
    'assets/image/home_page/2.jpg',
    'assets/image/home_page/3.jpg',
    'assets/image/home_page/4.jpg',
    'assets/image/home_page/5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    var alldata;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff004D74),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          },
        ),
        title: Center(
          child: Text(
            "Home Page",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartPage);
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Color(0xff006DA4),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          alignment: const Alignment(0, -0.4),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: [
                    ...image
                        .map(
                          (e) => Container(
                            height: 50,
                            width: 350,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                image: AssetImage(
                                  e,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
                const SizedBox(
                  height: 19,
                ),
                const Center(
                  child: Text(
                    " D-Mart Product",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 4,
                    ),
                    itemCount: AllData.alldata.length,
                    itemBuilder: (context, index) => InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        Future.delayed(
                          const Duration(milliseconds: 200),
                          () {
                            Navigator.pushNamed(
                              context,
                              MyRoutes.detailPage,
                              arguments: AllData.alldata[index],
                            );
                          },
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: 252,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.white54,
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0, -2),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    AllData.alldata[index]['thumbnail'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
