import 'package:flutter/material.dart';

class MainScreenNotifier extends ChangeNotifier {
  int _activeIndex = 0;

  int get activeIndex => _activeIndex;

  set changePageIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }
}
