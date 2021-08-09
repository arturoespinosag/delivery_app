import 'package:deliveryapp/src/ui/global_controllers/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import 'package:deliveryapp/src/data/models/dish.dart';
import 'package:deliveryapp/src/routes/routes.dart';
import 'package:deliveryapp/src/ui/pages/dish/page/dish_controller.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';

class DishHomeItem extends StatelessWidget {
  const DishHomeItem({
    Key key,
    @required this.item,
    @required this.width,
    @required this.isFirst,
  }) : super(key: key);

  final Dish item;
  final double width;
  final bool isFirst;

// Se usa key, ya que asignamos una Uniquekey a cada dish item
  String get tag => '${this.key.toString()}-${item.id}';

  void _goToDetails(BuildContext context) {
    final int counter =
        context.read<CartController>().getDishCounter(this.item);
    final Dish dish = item.updateCounter(counter);
    Navigator.of(context).pushNamed(Routes.dish,
        arguments: DishPageArguments(tag: this.tag, dish: dish));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10)
          .copyWith(left: isFirst ? 15 : 10),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            Hero(
              tag: this.tag,
              child: ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: item.photo,
                  width: width,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(10).copyWith(top: 40),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      bgColor.withOpacity(0),
                      bgColor.withOpacity(0.3),
                      bgColor.withOpacity(0.6),
                      bgColor,
                    ],
                    stops: [
                      0.1,
                      0.3,
                      0.4,
                      0.8,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: FontStyles.regular.copyWith(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: FontStyles.regular.copyWith(
                              color: primaryColor,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                            text: '\$',
                            children: [
                              TextSpan(
                                text: '${item.price}0',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 18,
                              ),
                              Text('${item.rating}',
                                  style: FontStyles.normal.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: bgColor)),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        onPressed: () => _goToDetails(context),
      ),
    );
  }
}
