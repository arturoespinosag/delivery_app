import 'package:deliveryapp/src/data/models/dish.dart';
import 'package:flutter/material.dart';

class DishPageArguments {
  final String tag;
  final Dish dish;

  DishPageArguments({
    @required this.tag,
    @required this.dish,
  });
}

class DishController extends ChangeNotifier {
  final Dish dish;
  final String tag;
  VoidCallback onDispose;
  DishController(DishPageArguments arguments)
      : this.dish = arguments.dish,
        this.tag = arguments.tag;

  int _counter = 0;
  int get counter => _counter;

  void onCounterChanged(int counter) {
    _counter = counter;
  }

  @override
  void dispose() {
    if (onDispose != null) {
      onDispose();
    }
    super.dispose();
  }
}
