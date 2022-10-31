import 'package:flutter/material.dart';

class OnBoardNotifier extends ChangeNotifier {
  static final indicatorController  = PageController(initialPage: 1);
  int currentIndex = 0;
  
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
}
}
