import 'package:deliveryapp/src/helpers/get.dart';
import 'package:deliveryapp/src/ui/pages/dish/widgets/add_to_cart_button.dart';
import 'package:deliveryapp/src/ui/widgets/dish_counter.dart';
import 'package:deliveryapp/src/ui/pages/dish/widgets/dish_header.dart';
import 'package:deliveryapp/src/ui/pages/home/home_controller.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:deliveryapp/src/ui/pages/dish/page/dish_controller.dart';

import 'package:provider/provider.dart';

class DishPage extends StatelessWidget {
  const DishPage({Key? key}) : super(key: key);

  void _setStatusBar(bool light) {
    SystemChrome.setSystemUIOverlayStyle(
        light ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
  }

  void _toggleFavorite(BuildContext context) {
    final homeController = Get.instance.find<HomeController>();
    final controller = context.read<DishController>();
    if (!controller.isFavorite) {
      final SnackBar snackBar = SnackBar(content: Text('Agregado a favoritos'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    controller.toggleFavorite();
    homeController.toggleFavorite(controller.dish);
    // controller.onDispose =
    //     () => Get.instance.remove<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DishController>(
      create: (_) {
        final homeController = Get.instance.find<HomeController>();

        final DishPageArguments args =
            ModalRoute.of(context)!.settings.arguments as DishPageArguments;
        final isFavorite = homeController.isFavorite(args.dish);
        final controller = DishController(args, isFavorite);
        _setStatusBar(true);
        controller.onDispose = () => _setStatusBar(false);

        return controller;
      },
      child: Scaffold(
        floatingActionButton: AddToCartButton(),
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
                                controller.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline_outlined,
                                color: controller.isFavorite
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                              onPressed: () => _toggleFavorite(_),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DishCounter(
                          initialValue: controller.dish.counter,
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
