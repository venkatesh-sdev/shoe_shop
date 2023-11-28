import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewShoes extends StatelessWidget {
  const NewShoes({
    super.key,
    required this.screenWidth,
    required this.image,
  });

  final double screenWidth;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.30,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: CachedNetworkImage(
        imageUrl: image,
      ),
    );
  }
}
