import 'package:deliveryapp/src/data/models/category.dart';
import 'package:deliveryapp/src/data/models/dish.dart';
import 'package:deliveryapp/src/data/respositories/food_menu_respository.dart';
import 'package:deliveryapp/src/helpers/get.dart';
import 'package:flutter/material.dart';

class HomeTabController extends ChangeNotifier {
  final FoodMenuRepository _foodMenuRepository =
      Get.instance.find<FoodMenuRepository>();

  final List<Category> categories = [
    Category(
        iconPath: 'assets/pages/home/home_tab/breakfast.svg',
        label: 'Desayuno'),
    Category(
      iconPath: 'assets/pages/home/home_tab/fries.svg',
      label: 'Fast Food',
    ),
    Category(
      iconPath: 'assets/pages/home/home_tab/dinner.svg',
      label: 'Cenas',
    ),
    Category(
      iconPath: 'assets/pages/home/home_tab/dessert.svg',
      label: 'Postres',
    ),
  ];

  List<Dish> _popularMenu = [];

  List<Dish> get popularMenu => _popularMenu;

  // Se ejectua una sola vez cuando el HomeTab es renderizado

  void afterFirstLayout() {
    _init();
  }

  void _init() async {
    _popularMenu = await _foodMenuRepository.getPopularMenu();
    notifyListeners();
  }
}
