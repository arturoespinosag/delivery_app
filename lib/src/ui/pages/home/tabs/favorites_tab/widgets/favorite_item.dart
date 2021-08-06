import 'package:deliveryapp/src/helpers/get.dart';
import 'package:deliveryapp/src/ui/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:deliveryapp/src/data/models/dish.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';

class FavoriteItem extends StatelessWidget {
  final Dish dish;
  const FavoriteItem({Key key, @required this.dish}) : super(key: key);

  void _deleteItem() {
    final homeController = Get.instance.find<HomeController>();
    homeController.deleteFavorite(dish);
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
            onTap: _deleteItem,
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
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${dish.rating}',
                          style: FontStyles.regular.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
