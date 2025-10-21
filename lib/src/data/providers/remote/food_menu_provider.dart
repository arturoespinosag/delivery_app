import 'dart:convert';

import 'package:flutter/services.dart';

import '../../models/dish.dart';

class FoodMenuProvider {
  Future<List<Dish>> getPopularMenu() async {
    final jsonasString = await rootBundle.loadString(
      'assets/pages/home/home_tab/json/popular_menu.json',
    );
    final List list = jsonDecode(jsonasString);
    List<Dish> dishes = [];
    for (final Map<String, dynamic> item in list) {
      final dish = Dish(
        id: item['id'],
        name: item['name'],
        photo: item['photo'],
        price: item['price'],
        rating: item['rating'],
        description: item['description'],
      );
      dishes.add(dish);
    }
    return dishes;
  }
}
