import 'package:deliveryapp/src/ui/pages/home/home_controller.dart';
import 'package:deliveryapp/src/ui/pages/home/widgets/home_indicator.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';

class HomeBoottomBar extends StatelessWidget {
  HomeBoottomBar({Key key}) : super(key: key);

  final List<_BottomBarItem> _items = [
    _BottomBarItem(icon: 'assets/pages/home/home.svg', label: 'Home'),
    _BottomBarItem(icon: 'assets/pages/home/favorite.svg', label: 'Favorites'),
    _BottomBarItem(icon: 'assets/pages/home/bell.svg', label: 'Notifications'),
    _BottomBarItem(icon: 'assets/pages/home/avatar.svg', label: 'Cuenta'),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context,
        listen:
            false); // esta llamada no escucha, sólo tiene acceso a las propiedades.
    final int currentPage = context.select<HomeController, int>((_) =>
        _.currentPage); // esta llamada sólo escucha los cambios en currentpage.
    return Container(
      color: bgColor,
      child: SafeArea(
        top: false,
        child: TabBar(
          controller: controller.tabController,
          indicator: HomeTabBarIndicator(),
          tabs: List.generate(
            _items.length,
            (index) {
              final item = _items[index];
              return BottomBarTab(
                item: item,
                isActive: currentPage == index,
              );
            },
          ),
        ),
      ),
    );
  }
}

class BottomBarTab extends StatelessWidget {
  const BottomBarTab({
    Key key,
    @required this.item,
    @required this.isActive,
  }) : super(key: key);

  final _BottomBarItem item;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final _color = this.isActive ? primaryColor : Colors.black;
    return Tab(
      iconMargin: EdgeInsets.only(
        bottom: 20,
      ),
      icon: SvgPicture.asset(
        item.icon,
        width: 30,
        height: 30,
        color: _color,
      ),
    );
  }
}

class _BottomBarItem {
  final String icon;
  final String label;

  _BottomBarItem({this.icon, this.label});
}
