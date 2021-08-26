import 'package:deliveryapp/src/ui/global_controllers/cart_controller.dart';
import 'package:deliveryapp/src/ui/pages/cart/widgets/checkout_preview.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';

import 'widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartController>().cart.values.toList();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Mi carrito',
          style: FontStyles.title.copyWith(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        backgroundColor: bgColor,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (_, index) {
            final dish = cart[index];
            return CartItem(dish: dish);
          },
        ),
      ),
      bottomNavigationBar: CheckoutPreview(),
    );
  }
}
