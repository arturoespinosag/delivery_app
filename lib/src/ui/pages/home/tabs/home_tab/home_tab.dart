import 'package:deliveryapp/src/data/models/dish.dart';
import 'package:deliveryapp/src/ui/pages/home/tabs/home_tab/home_tab_controller.dart';
import 'package:deliveryapp/src/ui/pages/home/tabs/home_tab/widgets/categories_menu.dart';
import 'package:deliveryapp/src/ui/pages/home/tabs/home_tab/widgets/horizontal_menu.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/search_button.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<HomeTabController>(
      create: (_) {
        final controller = HomeTabController();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.afterFirstLayout();
        });
        return controller;
      },
      child: Container(
        color: bgColor,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text('Hola, Arturo'),
                    Text(
                      'Bienvenido, elige tu comida.',
                      style: FontStyles.title.copyWith(fontSize: 23),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SearchButton(),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              CategoriesMenu(),
              SizedBox(height: 20),
              Builder(
                builder: (context) {
                  final List<Dish> popularMenu =
                      context.select<HomeTabController, List<Dish>>(
                          (_) => _.popularMenu);
                  return HorizontalMenu(
                    dishes: popularMenu,
                    title: 'Menú Popular',
                    onViewAll: () {},
                  );
                },
              ),
              SizedBox(height: 15),
              Builder(
                builder: (context) {
                  final List<Dish> popularMenu =
                      context.select<HomeTabController, List<Dish>>(
                          (_) => _.popularMenu);
                  return HorizontalMenu(
                    dishes: popularMenu,
                    title: 'Menú de Hoy',
                    onViewAll: () {},
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
