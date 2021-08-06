import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveryapp/src/ui/pages/dish/page/dish_controller.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DishHeader extends StatelessWidget {
  const DishHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 10 / 8,
        child: Builder(
          builder: (context) {
            final controller =
                Provider.of<DishController>(context, listen: false);
            return Hero(
              tag: controller.tag,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: controller.dish.photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              bgColor.withOpacity(0.1),
                              bgColor.withOpacity(0.3),
                              bgColor.withOpacity(0.5),
                              bgColor.withOpacity(0.8),
                              bgColor
                            ],
                          )),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: SafeArea(
                      child: CupertinoButton(
                        color: Colors.white30,
                        padding: EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(30),
                        onPressed: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
