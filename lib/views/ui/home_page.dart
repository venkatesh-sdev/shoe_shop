import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shoe_shop/views/shared/appstyle.dart';
import 'package:shoe_shop/views/shared/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SizedBox(
          height: screenHeight,
          child: Stack(
            children: [
              // Background Image
              Container(
                padding: const EdgeInsets.only(left: 8, top: 45),
                height: (screenHeight * 0.35),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/top_image.png'),
                  ),
                ),
                // Title and Tabbar Container
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                    bottom: 15,
                  ),
                  width: screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Atheletics Shoes",
                        style: appStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                      ),
                      Text(
                        "Collections",
                        style: appStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // TabBar Items
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        isScrollable: true,
                        controller: _tabController,
                        labelColor: Colors.white,
                        dividerHeight: 0,
                        labelStyle: appStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelColor: Colors.grey.withOpacity(0.3),
                        tabs: const [
                          Tab(text: "Men Shoes"),
                          Tab(text: "Women Shoes"),
                          Tab(text: "Kid Shoes"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Shoes Tab Items
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.250),
                child: TabBarView(controller: _tabController, children: [
                  ShoesList(
                      screenWidth: screenWidth, screenHeight: screenHeight),
                  ShoesList(
                      screenWidth: screenWidth, screenHeight: screenHeight),
                  ShoesList(
                      screenWidth: screenWidth, screenHeight: screenHeight),
                ]),
              ),
            ],
          ),
        ));
  }
}

class ShoesList extends StatelessWidget {
  const ShoesList({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => const ProductCard(),
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
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
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
                    imageUrl:
                        "https://d326fntlu7tb1e.cloudfront.net/uploads/6f6ba91b-68f1-41f6-8111-493710d46838-FY7974_a1.webp",
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
