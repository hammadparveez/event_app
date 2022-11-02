import 'package:event_app/main.dart';
import 'package:event_app/src/routes/routes.dart';
import 'package:flutter/material.dart';

class OnBoardProvider extends ChangeNotifier {
  static final indicatorController = PageController(initialPage: 0);
  static final imageSlideController = PageController(initialPage: 0);
  static const maxIndex = 3;
  String nextBtnTitle = 'Next';

  int currentIndex = 0;

  void next() {
    if (currentIndex < maxIndex - 1) {
      ++currentIndex;
      _animateTo(currentIndex);
      if (currentIndex == 2) nextBtnTitle = 'Go';
      notifyListeners();
    } else {
      Navigator.pushNamed(App.navigatorKey.currentContext!, AppRoutes.home);
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
