import 'package:deliveryapp/src/ui/pages/home/tabs/home_tab/home_tab_controller.dart';
import 'package:deliveryapp/src/ui/pages/home/tabs/home_tab/widgets/categories_menu.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'widgets/search_button.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<HomeTabController>(
      create: (_) => HomeTabController(),
      child: Container(
        color: bgColor,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text('Hola, Arturo'),
                    Text(
                      'Bienvenido, elige tu comida.',
                      style: FontStyles.title.copyWith(fontSize: 23),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SearchButton(),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              CategoriesMenu(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
