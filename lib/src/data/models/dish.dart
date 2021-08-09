import 'package:meta/meta.dart' show required;

class Dish {
  final int id;
  final String name, photo, description;
  final double price, rating;
  final int counter;

  Dish(
      {@required this.id,
      @required this.name,
      @required this.photo,
      @required this.price,
      @required this.rating,
      @required this.description,
      this.counter = 0});

  Dish updateCounter(int counter) {
    return Dish(
      id: this.id,
      name: this.name,
      photo: this.photo,
      price: this.price,
      rating: this.rating,
      description: this.description,
      counter: counter,
    );
  }
}
