import 'package:deliveryapp/src/ui/global_controllers/notifications_controller.dart';
import 'package:deliveryapp/src/ui/pages/home/tabs/notifications_tab/widgets/notification_item.dart';
import 'package:deliveryapp/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationsTab extends StatefulWidget {
  const NotificationsTab({Key? key}) : super(key: key);

  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<NotificationsController>();
    final notifications = controller.notifications;
    super.build(context);
    return Container(
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (_, int index) {
          final notification = notifications[index];
          return NotificationItem(notification: notification);
        },
      ),
      color: bgColor,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
