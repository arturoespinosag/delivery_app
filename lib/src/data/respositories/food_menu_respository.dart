import 'package:deliveryapp/src/data/models/dish.dart';

abstract class FoodMenuRepository {
  Future<List<Dish>> getPopularMenu();
}
