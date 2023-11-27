import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shoe_shop/views/shared/appstyle.dart';

class ProductCard extends StatefulWidget {
  final image;
  final name;
  final category;
  final price;

  const ProductCard(
      {super.key, this.image, this.name, this.category, this.price, r});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: screenWidth * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(5, 5),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heart Icon
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () {}, child: const Icon(Ionicons.heart_outline)),
          ),
          // Shoe Image
          Center(
            child: CachedNetworkImage(
              width: screenWidth * 0.45,
              imageUrl: widget.image,
            ),
          ),

          // Shoe Name
          Text(
            widget.name,
            style: appStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          // Shoe Title
          Text(
            widget.category,
            style: appStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          // Shoe Price and Color
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${widget.price}',
                style: appStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  height: 1.1,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Colors",
                    style: appStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(width: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: Colors.grey,
                      width: 20,
                      height: 20,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
