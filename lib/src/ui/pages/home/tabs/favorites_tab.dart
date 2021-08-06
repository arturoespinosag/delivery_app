import 'package:deliveryapp/src/data/models/dish.dart';
import 'package:deliveryapp/src/ui/pages/home/home_controller.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({Key key}) : super(key: key);

  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // usamos HomeController, ya que hay la posibilidad de que este widget
    //no haya sido creado cuando agregamos un favorito
    final favorites =
        context.select<HomeController, List<Dish>>((_) => _.favorites);
    return Container(
      color: bgColor,
      child: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (_, index) {
            return Text('$index');
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
