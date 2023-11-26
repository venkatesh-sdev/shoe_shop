import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shoe_shop/views/shared/appstyle.dart';
import 'package:shoe_shop/views/shared/bottom_tab_icon.dart';

import 'package:shoe_shop/views/ui/add_page.dart';
import 'package:shoe_shop/views/ui/cart_page.dart';
import 'package:shoe_shop/views/ui/home_page.dart';
import 'package:shoe_shop/views/ui/profile_page.dart';
import 'package:shoe_shop/views/ui/search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const AddPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  int activePageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomTabIcon(
                  onTap: () {
                    setState(() {
                      activePageIndex = 0;
                    });
                  },
                  icon: Ionicons.home,
                ),
                BottomTabIcon(
                  onTap: () {
                    setState(() {
                      activePageIndex = 1;
                    });
                  },
                  icon: Ionicons.search,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: BottomTabIcon(
                    onTap: () {
                      setState(() {
                        activePageIndex = 2;
                      });
                    },
                    icon: Ionicons.add,
                    color: Colors.black,
                  ),
                ),
                BottomTabIcon(
                  onTap: () {
                    setState(() {
                      activePageIndex = 3;
                    });
                  },
                  icon: Ionicons.cart,
                ),
                BottomTabIcon(
                  onTap: () {
                    setState(() {
                      activePageIndex = 4;
                    });
                  },
                  icon: Ionicons.person,
                ),
              ],
            ),
          ),
        ),
      ),
      body: pageList[activePageIndex],
    );
  }
}
