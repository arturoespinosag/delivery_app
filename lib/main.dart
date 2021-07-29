import 'package:deliveryapp/src/helpers/dependency_injection.dart';
import 'package:deliveryapp/src/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  DependencyInjection.initialize();
  runApp(MyApp());
}
