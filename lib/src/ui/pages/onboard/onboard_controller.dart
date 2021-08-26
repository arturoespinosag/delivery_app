import 'package:deliveryapp/src/data/models/onboard_items.dart';
import 'package:flutter/widgets.dart';

class OnboardController extends ChangeNotifier {
  final List<OnBoardItem> items = [
    OnBoardItem(
        img: 'assets/pages/onboard/breakfast.svg',
        title: 'Desayunos deliciosos',
        description: 'Desayunos hasta la 1 pm con los mejores precios.'),
    OnBoardItem(
        img: 'assets/pages/onboard/hamburger.svg',
        title: 'Whopper Jr. en combo',
        description: 'Comida completa desde \$49'),
    OnBoardItem(
        img: 'assets/pages/onboard/ice_cream.svg',
        title: 'Helados a sólo \$15',
        description: 'Vainilla, chocolate o combinados.'),
  ];

  final PageController pageController = PageController();
  double _currentPage = 0;

  double get currentPage => _currentPage;

  void afterFirstlayout() {
    pageController.addListener(
      () {
        final double page = pageController.page!;
        _currentPage = page;
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
