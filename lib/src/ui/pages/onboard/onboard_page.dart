import 'package:deliveryapp/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'onboard_controller.dart';
import 'widgets/onboard_footer.dart';
import 'widgets/onboard_slider.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardController>(
      create: (_) {
        final controller = OnboardController();
        WidgetsBinding.instance
            .addPostFrameCallback((_) => controller.afterFirstlayout());
        return controller;
      },
      builder: (context, __) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: bgColor,
            width: double.infinity,
            child: Column(
              children: [
                OnboardSlider(),
                const SizedBox(
                  height: 50,
                ),
                OnboardFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
