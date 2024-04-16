import 'package:d_mart_bill/utils/product_page.dart';
import 'package:d_mart_bill/utils/routes.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff004D74),
        title: Text(
          "Cart Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xff006DA4),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ...AllData.cartProduct
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: size.height * 0.20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(7),
                      // color: Colors.grey,
                      child: Row(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blueAccent,
                              image: DecorationImage(
                                image: NetworkImage(
                                  e['thumbnail'],
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        e['title'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${e['price']} Rs.",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _itemCount--;
                                        if (_itemCount == 0) {
                                          AllData.cartProduct.remove(
                                            e,
                                          );
                                        }
                                        setState(() {});
                                      },
                                      child: const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.remove,
                                          size: 25,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "$_itemCount",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        _itemCount++;
                                        setState(() {});
                                      },
                                      child: const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.add,
                                          size: 25,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        AllData.cartProduct.remove(e);
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.pdfPage);
        },
        label: const Text(
          'PDF',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
