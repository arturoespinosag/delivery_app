import 'package:deliveryapp/src/data/models/dish.dart';
import 'package:deliveryapp/src/data/providers/remote/food_menu_provider.dart';
import 'package:deliveryapp/src/data/respositories/food_menu_respository.dart';

class FoodMenuRepositoryImplementation implements FoodMenuRepository {
  final FoodMenuProvider _provider;

  FoodMenuRepositoryImplementation(this._provider);

  @override
  Future<List<Dish>> getPopularMenu() {
    return _provider.getPopularMenu();
  }
}
