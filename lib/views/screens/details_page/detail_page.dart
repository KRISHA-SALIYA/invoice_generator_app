import 'package:d_mart_bill/utils/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    Map<String, dynamic> product =
        (ModalRoute.of(context)?.settings.arguments ?? AllData.alldata[0])
            as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff004D74),
        title: const Text(
          "Detail Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xff006DA4),
      body: Column(
        children: [
          //ThumbNailView
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                product['images'].length,
                (index) => Container(
                  height: size.height * 0.4,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(product['images'][index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: const EdgeInsets.all(
                    10,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          //DetailsCard
          Container(
            height: size.height * 0.4,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                  spreadRadius: 3,
                  offset: Offset(0, -2),
                ),
              ],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "title           ${product['title'].toString()}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "category   ${product['category'].toString()}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " price    \$ ${product['price'].toString()}/-",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "stock     ${product['stock'].toString()}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RatingBarIndicator(
                  rating: double.parse(
                    product['rating'].toString(),
                  ),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          late SnackBar snackBar;
          // if (cartItems.contains(product))
          if (AllData.cartProduct.contains(product)) {
            AllData.cartProduct.remove(product);
            snackBar = SnackBar(
              content: Text("${product['title']} removed from the CART !!"),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            );
          } else {
            AllData.cartProduct.add(product);
            snackBar = SnackBar(
              content: Text("${product['title']} added to the CART !!"),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            );
          }

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        icon: const Icon(
          Icons.shopping_cart,
          color: Color(0xff032030),
        ),
        label: const Text("Add to cart"),
      ),
    );
  }
}
