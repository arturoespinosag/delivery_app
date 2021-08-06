import 'package:deliveryapp/src/data/models/dish.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;

class HomeController extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  List<Dish> _favorites = [];
  List<Dish> get favorites => _favorites;

  void Function() onDispose;

  final TabController tabController =
      TabController(length: 4, vsync: NavigatorState());

  void afterFirstLayout() {
    this.tabController.addListener(() {
      _currentPage = tabController.index;
      notifyListeners();
    });
  }

  void addFavorite(Dish dish) {
    _favorites.add(dish);
    notifyListeners();
  }

  @override
  void dispose() {
    tabController.dispose();
    if (this.onDispose != null) {
      this.onDispose();
    }
    super.dispose();
  }
}
