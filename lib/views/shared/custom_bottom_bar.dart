import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop/controllers/mainscreen_provider.dart';
import 'package:shoe_shop/views/shared/bottom_tab_icon.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return SafeArea(
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
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: mainScreenNotifier.activeIndex == 0
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: BottomTabIcon(
                    onTap: () {
                      mainScreenNotifier.changePageIndex = 0;
                    },
                    icon: Ionicons.home,
                    color: mainScreenNotifier.activeIndex == 0
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: mainScreenNotifier.activeIndex == 1
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: BottomTabIcon(
                    onTap: () {
                      mainScreenNotifier.changePageIndex = 1;
                    },
                    icon: Ionicons.search,
                    color: mainScreenNotifier.activeIndex == 1
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: mainScreenNotifier.activeIndex == 2
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: BottomTabIcon(
                    onTap: () {
                      mainScreenNotifier.changePageIndex = 2;
                    },
                    icon: Ionicons.add,
                    color: mainScreenNotifier.activeIndex == 2
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: mainScreenNotifier.activeIndex == 3
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: BottomTabIcon(
                    onTap: () {
                      mainScreenNotifier.changePageIndex = 3;
                    },
                    icon: Ionicons.cart,
                    color: mainScreenNotifier.activeIndex == 3
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: mainScreenNotifier.activeIndex == 4
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: BottomTabIcon(
                    onTap: () {
                      mainScreenNotifier.changePageIndex = 4;
                    },
                    icon: Ionicons.person,
                    color: mainScreenNotifier.activeIndex == 4
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
