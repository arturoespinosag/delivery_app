import 'package:deliveryapp/src/data/models/user.dart';
import 'package:deliveryapp/src/data/respositories/authentication_repository.dart';
import 'package:deliveryapp/src/helpers/get.dart';
import 'package:deliveryapp/src/ui/widgets/custom_form.dart';

import 'package:flutter/widgets.dart';

class RegisterController extends ChangeNotifier {
  String _email = '', _name = '', _lastName = '';
  GlobalKey<CustomFormState> formKey = GlobalKey();
  final _repository = Get.instance.find<AuthenticationRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onNameChanged(String text) {
    _name = text;
  }

  void onLastNameChanged(String text) {
    _lastName = text;
  }

  Future<bool> submit() async {
    return _repository.register(
      User(
          id: null,
          email: _email,
          name: _name,
          lastName: _lastName,
          birthday: null),
    );
  }
}
