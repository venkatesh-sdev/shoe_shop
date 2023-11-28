import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shoe_shop/models/sneaker_model.dart';
import 'package:shoe_shop/views/shared/appstyle.dart';
import 'package:shoe_shop/views/shared/new_shoes.dart';
import 'package:shoe_shop/views/shared/product_card.dart';

class ShoesList extends StatelessWidget {
  const ShoesList({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.data,
  });

  final double screenWidth;
  final double screenHeight;
  final Future<List<Sneakers>> data;

  @override
  Widget build(BuildContext context) {
    // Men Shoes Section
    return Column(
      children: [
        // For Men Shoes
        Container(
          width: screenWidth,
          height: screenHeight * 0.44,
          decoration: const BoxDecoration(),
          child: FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                final shoeData = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shoeData!.length,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        print(' Hi $index');
                      },
                      child: ProductCard(
                        image: shoe.imageUrl[0],
                        category: shoe.category,
                        price: shoe.price,
                        id: shoe.id,
                        name: shoe.name,
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        // Latest Shoes
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes",
                    style: appStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "Show All",
                          style: appStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Icon(
                        AntDesign.caretright,
                        size: 18,
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Latest Shoe Items
            SizedBox(
              height: screenHeight * 0.16,
              child: FutureBuilder(
                  future: data,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      final shoe = snapshot.data;
                      return ListView.builder(
                        itemCount: shoe!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {},
                          child: NewShoes(
                            screenWidth: screenWidth,
                            image: snapshot.data![index].imageUrl[1],
                          ),
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ],
    );
  }
}
