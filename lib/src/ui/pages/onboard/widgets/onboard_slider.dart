import 'package:deliveryapp/src/data/models/onboard_items.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../onboard_controller.dart';

class OnboardSlider extends StatelessWidget {
  const OnboardSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardController>(context, listen: false);
    return Expanded(
      child: Container(
        child: PageView(
          controller: controller.pageController,
          children: List.generate(controller.items.length, (index) {
            final OnBoardItem item = controller.items[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Expanded(
                    child: SvgPicture.asset(item.img),
                  ),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: FontStyles.title,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    item.description,
                    textAlign: TextAlign.center,
                    style: FontStyles.normal,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
