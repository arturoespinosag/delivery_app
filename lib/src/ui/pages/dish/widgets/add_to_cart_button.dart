import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:deliveryapp/src/ui/global_controllers/cart_controller.dart';
import 'package:deliveryapp/src/ui/pages/dish/page/dish_controller.dart';
import 'package:deliveryapp/src/ui/widgets/rounded_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  void _addToCart(BuildContext context) {
    final cartController = context.read<CartController>();
    final controller = context.read<DishController>();
    final isInCart = cartController.isInCart(controller.dish);
    final SnackBar snackBar = SnackBar(
      content: Text(
        isInCart ? 'Orden actualizada' : 'Producto agregado',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.deepOrange,
    );
    cartController.addToCart(controller.dish);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final dishController = Provider.of<DishController>(context, listen: false);
    final bool isInCart = context
        .select<CartController, bool>((_) => _.isInCart(dishController.dish));
    return RoundedButton(
      label: isInCart ? 'Actualizar Orden' : 'Agregar al carrito',
      onPressed: () => _addToCart(context),
      fontSize: 18,
    );
  }
}
