import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;

class HomeController extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  final TabController tabController =
      TabController(length: 4, vsync: NavigatorState());

  void afterFirstLayout() {
    this.tabController.addListener(() {
      _currentPage = tabController.index;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
