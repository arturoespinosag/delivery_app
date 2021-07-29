import 'package:deliveryapp/src/utils/colors.dart';
import 'package:flutter/material.dart';

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
    return Container(
      color: bgColor,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
