import 'package:meta/meta.dart' show required;

class Dish {
  final int id;
  final String name, photo, description;
  final double price, rating;

  Dish(
      {@required this.id,
      @required this.name,
      @required this.photo,
      @required this.price,
      @required this.rating,
      @required this.description});
}
