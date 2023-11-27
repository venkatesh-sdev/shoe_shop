import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop/controllers/mainscreen_provider.dart';
import 'package:shoe_shop/views/shared/custom_bottom_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          bottomNavigationBar: const CustomBottomBar(),
          body: pageList[mainScreenNotifier.activeIndex],
        );
      },
    );
  }
}
