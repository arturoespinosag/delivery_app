import 'package:deliveryapp/src/data/respositories/authentication_repository.dart';
import 'package:deliveryapp/src/helpers/get.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends ChangeNotifier {
  String _email = '';

  String get email => _email;

  final AuthenticationRepository _repository =
      Get.instance.find<AuthenticationRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  Future<bool> submit() {
    return _repository.sendResetToken(_email);
  }
}
