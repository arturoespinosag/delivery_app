import 'package:deliveryapp/src/data/models/category.dart';
import 'package:deliveryapp/src/ui/pages/home/tabs/home_tab/home_tab_controller.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CategoriesMenu extends StatelessWidget {
  const CategoriesMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeTabController>(context, listen: false);
    return Container(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(controller.categories.length, (index) {
          final category = controller.categories[index];
          return CategoryButton(
            category: category,
            isFirst: index == 0,
          );
        }),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.category,
    required this.isFirst,
  }) : super(key: key);

  final Category category;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 10,
        left: isFirst ? 15 : 5,
        bottom: 5,
        top: 5,
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: cardsColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 8, offset: Offset(10, 10))
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: SvgPicture.asset(
                  category.iconPath,
                  width: 80,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                category.label,
                style: FontStyles.regular
                    .copyWith(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
