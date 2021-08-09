import 'package:deliveryapp/src/routes/routes.dart';
import 'package:deliveryapp/src/ui/pages/cart/cart_page.dart';
import 'package:deliveryapp/src/ui/pages/dish/page/dish_page.dart';
import 'package:deliveryapp/src/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:deliveryapp/src/ui/pages/home/home_page.dart';
import 'package:deliveryapp/src/ui/pages/login/login_page.dart';
import 'package:deliveryapp/src/ui/pages/onboard/onboard_page.dart';
import 'package:deliveryapp/src/ui/pages/register/register_page.dart';
import 'package:deliveryapp/src/ui/pages/welcome/welcome_page.dart';
import 'package:flutter/widgets.dart';

abstract class Pages {
  static const String initial = Routes.onboard;
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.onboard: (_) => OnboardPage(),
    Routes.welcome: (_) => Welcome(),
    Routes.login: (_) => LoginPage(),
    Routes.register: (_) => RegisterPage(),
    Routes.forgot_password: (_) => ForgotPasswordPage(),
    Routes.home: (_) => HomePage(),
    Routes.dish: (_) => DishPage(),
    Routes.cart: (_) => CartPage(),
  };
}
