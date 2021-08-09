import 'package:deliveryapp/src/data/models/dish.dart';
import 'package:flutter/widgets.dart';

class CartController extends ChangeNotifier {
  Map<int, Dish> _cart = {};
  Map<int, Dish> get cart => _cart;

  bool isInCart(Dish dish) {
    return _cart.containsKey(dish.id);
  }

  int getDishCounter(Dish dish) {
    if (isInCart(dish)) {
      return _cart[dish.id].counter;
    }
    return 0;
  }

  void addToCart(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_cart);
    copy[dish.id] = dish;
    _cart = copy;
  }

  void deleteFromCart(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_cart);
    if (copy.containsKey(dish.id)) {
      copy.remove(dish.id);
      _cart = copy;
      notifyListeners();
    }
  }
}
