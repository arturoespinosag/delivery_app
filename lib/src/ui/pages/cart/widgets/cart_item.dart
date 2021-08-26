import 'package:deliveryapp/src/ui/global_controllers/cart_controller.dart';
import 'package:deliveryapp/src/ui/widgets/dish_counter.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:deliveryapp/src/data/models/dish.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';

class CartItem extends StatelessWidget {
  final Dish dish;
  const CartItem({Key? key, required this.dish}) : super(key: key);

  void _deleteItem(BuildContext context) {
    final cartController = context.read<CartController>();
    cartController.deleteFromCart(dish);
  }

  void _onCounterChanged(BuildContext context, int counter) {
    final updatedDish = dish.updateCounter(counter);
    final cartController = context.read<CartController>();
    cartController.addToCart(updatedDish);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: IconSlideAction(
            caption: 'Borrar',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => _deleteItem(context),
          ),
        )
      ],
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: dish.photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.name,
                    style: FontStyles.regular,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${dish.price}0',
                          style: FontStyles.title.copyWith(
                            color: primaryColor,
                          )),
                      DishCounter(
                        size: DishCounterSize.mini,
                        initialValue: dish.counter,
                        onChanged: (counter) =>
                            _onCounterChanged(context, counter),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}
