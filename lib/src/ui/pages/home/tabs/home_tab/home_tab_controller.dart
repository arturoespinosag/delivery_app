import 'package:deliveryapp/src/data/models/category.dart';
import 'package:flutter/material.dart';

class HomeTabController extends ChangeNotifier {
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
}
