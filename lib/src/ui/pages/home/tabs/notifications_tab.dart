import 'package:deliveryapp/src/utils/colors.dart';
import 'package:flutter/material.dart';

class NotificationsTab extends StatefulWidget {
  const NotificationsTab({Key key}) : super(key: key);

  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab>
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
