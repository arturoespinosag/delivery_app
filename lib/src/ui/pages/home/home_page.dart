import 'package:deliveryapp/src/helpers/get.dart';
import 'package:deliveryapp/src/ui/pages/home/home_controller.dart';
import 'package:deliveryapp/src/ui/pages/home/tabs/account_tab.dart';
import 'package:deliveryapp/src/ui/pages/home/tabs/favorites_tab.dart';
import 'package:deliveryapp/src/ui/pages/home/tabs/home_tab/home_tab.dart';
import 'package:deliveryapp/src/ui/pages/home/tabs/notifications_tab.dart';
import 'package:deliveryapp/src/ui/pages/home/widgets/home_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(create: (_) {
      final controller = HomeController();
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          controller.afterFirstLayout();
        },
      );
      Get.instance.put<HomeController>(controller);
      controller.onDispose = () => Get.instance.remove<HomeController>();
      return controller;
    }, builder: (_, __) {
      final controller = Provider.of<HomeController>(_, listen: false);
      return Scaffold(
        bottomNavigationBar: HomeBottomBar(),
        body: SafeArea(
          child: TabBarView(
            controller: controller.tabController,
            children: [
              HomeTab(),
              FavoritesTab(),
              NotificationsTab(),
              AccountTab(),
            ],
          ),
        ),
      );
    });
  }
}
