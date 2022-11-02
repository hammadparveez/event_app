import 'package:flutter/material.dart';

class OnBoardProvider extends ChangeNotifier {
  static final indicatorController = PageController(initialPage: 0);
  static final imageSlideController = PageController(initialPage: 0);
  static const maxIndex = 3;
  
  int currentIndex = 0;

  void next() {
    if (currentIndex < maxIndex - 1) {
      ++currentIndex;
      _animateTo(currentIndex);
      notifyListeners();
    }
  }

  void previous() {
    if (currentIndex > 0) {
      currentIndex--;
      _animateTo(currentIndex);
      notifyListeners();
    }
  }

  void _animateTo(int index) {
    indicatorController.animateToPage(currentIndex,
        curve: Curves.easeIn, duration: const Duration(milliseconds: 500));
    imageSlideController.animateToPage(currentIndex,
        curve: Curves.easeIn, duration: const Duration(milliseconds: 500));
  }
}
