import 'package:flutter/material.dart';
import 'package:shoe_shop/models/sneaker_model.dart';
import 'package:shoe_shop/services/helper.dart';
import 'package:shoe_shop/views/shared/appstyle.dart';
import 'package:shoe_shop/views/shared/shoes_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

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
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    data: _male),
                ShoesList(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    data: _female),
                ShoesList(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    data: _kids),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
