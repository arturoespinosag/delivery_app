import 'package:deliveryapp/src/data/models/dish.dart';
import 'package:deliveryapp/src/routes/routes.dart';
import 'package:deliveryapp/src/ui/global_controllers/cart_controller.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasItems = context.select<CartController, bool>((_) => _.hasItems);
    if (!hasItems) {
      return Container();
    }
    final cart = context.select<CartController, Map<int, Dish>>((_) => _.cart);

    return Stack(
      children: [
        FloatingActionButton(
          child: Icon(Icons.shopping_cart_outlined),
          onPressed: () => Navigator.pushNamed(context, Routes.cart),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '${cart.length}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
