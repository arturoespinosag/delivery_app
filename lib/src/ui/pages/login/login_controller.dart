import 'package:deliveryapp/src/data/models/user.dart';
import 'package:deliveryapp/src/data/respositories/authentication_repository.dart';
import 'package:deliveryapp/src/helpers/get.dart';
import 'package:flutter/widgets.dart';

class LoginController extends ChangeNotifier {
  String _email = '', _password = '';
  final _repository = Get.instance.find<AuthenticationRepository>();

  void onEmailChanged(String email) {
    _email = email;
  }

  void onPasswordChanged(password) {
    _password = password;
  }

  Future<User?> submit() {
    return _repository.login(_email, _password);
  }
}
