import 'package:deliveryapp/src/data/models/dish.dart';
import 'package:flutter/widgets.dart';

class CartController extends ChangeNotifier {
  Map<int, Dish> _cart = {};
  Map<int, Dish> get cart => _cart;

  bool isInCart(Dish dish) {
    return _cart.containsKey(dish.id);
  }

  bool get hasItems => _cart.length > 0;

  double get subtotal => double.parse(cart.values
      .map((dish) => dish.price * dish.counter)
      .toList()
      .reduce((v, e) => v + e)
      .toStringAsFixed(2));

  double get taxAndFees => double.parse((subtotal * .16).toStringAsFixed(2));
  double get deliveryFee => double.parse((subtotal * .15).toStringAsFixed(2));
  double get total =>
      double.parse((subtotal + taxAndFees + deliveryFee).toStringAsFixed(2));

  int getDishCounter(Dish dish) {
    if (isInCart(dish)) {
      return _cart[dish.id]!.counter;
    }
    return 0;
  }

  void addToCart(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_cart);
    copy[dish.id] = dish;
    _cart = copy;
    notifyListeners();
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
