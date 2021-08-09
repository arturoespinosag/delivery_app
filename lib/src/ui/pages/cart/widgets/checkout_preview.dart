import 'package:deliveryapp/src/ui/global_controllers/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';

class CheckoutPreview extends StatelessWidget {
  const CheckoutPreview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CartController>();
    final subtotal = controller.cart.values
        .map((dish) => dish.price * dish.counter)
        .toList()
        .reduce((v, e) => v + e);
    final taxAndFees = double.parse((subtotal * .16).toStringAsFixed(2));
    final deliveryFee = double.parse((subtotal * .15).toStringAsFixed(2));
    final total =
        double.parse((subtotal + taxAndFees + deliveryFee).toStringAsFixed(2));

    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ).copyWith(top: 30),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Table(
              children: [
                _buildTableRow('Subtotal:', '$subtotal'),
                _buildTableRow('Comisiones e impuestos.', '$taxAndFees'),
                _buildTableRow('Envío:', '$deliveryFee'),
                _buildTableRow('Total:', '$total'),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: Colors.white,
                child: Text(
                  'PAGAR',
                  style: FontStyles.title.copyWith(
                    color: Colors.deepOrange,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Text(label),
        Text(
          '$value',
          style: FontStyles.regular,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
