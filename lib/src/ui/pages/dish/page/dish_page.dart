import 'package:deliveryapp/src/helpers/get.dart';
import 'package:deliveryapp/src/ui/pages/dish/widgets/dish_counter.dart';
import 'package:deliveryapp/src/ui/pages/dish/widgets/dish_header.dart';
import 'package:deliveryapp/src/ui/pages/home/home_controller.dart';
import 'package:deliveryapp/src/ui/widgets/rounded_button.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:deliveryapp/src/ui/pages/dish/page/dish_controller.dart';

import 'package:provider/provider.dart';

class DishPage extends StatelessWidget {
  const DishPage({Key key}) : super(key: key);

  void _setStatusBar(bool light) {
    SystemChrome.setSystemUIOverlayStyle(
        light ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DishController>(
      create: (_) {
        final DishPageArguments args =
            ModalRoute.of(context).settings.arguments;
        final controller = DishController(args);
        _setStatusBar(true);
        controller.onDispose = () => _setStatusBar(false);

        return controller;
      },
      child: Scaffold(
        floatingActionButton: RoundedButton(
          label: 'Agregar al carrito',
          onPressed: () {},
          fontSize: 18,
        ),
        body: Container(
          color: bgColor,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DishHeader(),
                Builder(builder: (_) {
                  final controller = Provider.of<DishController>(_);
                  final dish = controller.dish;
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dish.name,
                                    style: FontStyles.title,
                                  ),
                                  Text(
                                    '\$${dish.price.toString()}0',
                                    style: FontStyles.title,
                                  ),
                                ],
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.favorite_outline_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                final homeController =
                                    Get.instance.find<HomeController>();
                                homeController.addFavorite(dish);
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DishCounter(
                          onChanged: controller.onCounterChanged,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          dish.description,
                          textAlign: TextAlign.center,
                          style: FontStyles.regular.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
