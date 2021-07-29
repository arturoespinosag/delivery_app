import 'package:deliveryapp/src/data/models/user.dart';

class AuthenticationProvider {
  Future<User> login(String email, String password) async {
    await Future.delayed(
        Duration(seconds: 2)); // esta parte simula la petición a una api
    if (email == 'test@test.com' && password == 'test') {
      return User(
        id: '545654',
        email: 'test@test.com',
        name: 'test',
        lastName: 'Test',
        birthday: DateTime(1980, 3, 18),
      );
    }
    return null;
  }

  Future<bool> register(User user) async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    return true;
  }

  Future<bool> sendResetToken(String email) async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    return true;
  }
}
