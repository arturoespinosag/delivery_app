import 'package:deliveryapp/src/routes/routes.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../onboard_controller.dart';

class OnboardFooter extends StatelessWidget {
  const OnboardFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _Dots(),
        SizedBox(
          height: 15,
        ),
        SizedBox(
            width: double.infinity,
            child: Consumer<OnboardController>(
              builder: (_, controller, __) => CupertinoButton(
                child: Text(
                  controller.currentPage != 2 ? 'Next' : 'Get Started',
                  style: FontStyles.normal.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () => onNext(context),
                color: primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
            )),
      ],
    );
  }

  void onNext(BuildContext context) {
    final controller = Provider.of<OnboardController>(context, listen: false);
    if (controller.currentPage == 2) {
      Navigator.pushReplacementNamed(context, Routes.welcome);
    } else {
      controller.pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardController>(context);
    return DotsIndicator(
      dotsCount: controller.items.length,
      position: controller.currentPage.toDouble(),
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        color: Colors.grey.withOpacity(0.4),
        activeColor: primaryColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
