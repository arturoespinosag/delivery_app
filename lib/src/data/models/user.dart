import 'package:meta/meta.dart' show required;

class User {
  final String id, email, name, lastName;
  final DateTime birthday;

  User({
    @required this.id,
    @required this.email,
    @required this.name,
    @required this.lastName,
    @required this.birthday,
  });
}
